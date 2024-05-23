local GGData = {}
local GGData_mt = { __index = GGData }
local json = require( "json" )
local lfs = require( "lfs" )
local crypto = require( "crypto" )
------- Funciones utilizadas para convertir tablas en cadenas que se utilizan para la integridad de los datos. Funciones obtenidas desde aquí: http://lua-users.org/wiki/TableUtils
function table.val_to_str ( v )
	if "string" == type( v ) then
		v = string.gsub( v, "\n", "\\n" )
		if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
	else
		return "table" == type( v ) and table.tostring( v ) or tostring( v )
	end
end
function table.key_to_str ( k )
	if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
		return k
	else
		return "[" .. table.val_to_str( k ) .. "]"
	end
end
function table.tostring( tbl )
	local result, done = {}, {}
	for k, v in ipairs( tbl ) do
		table.insert( result, table.val_to_str( v ) )
		done[ k ] = true
	end
	for k, v in pairs( tbl ) do
		if not done[ k ] then
	  		table.insert( result,
			table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
		end
	end
	return "{" .. table.concat( result, "," ) .. "}"
end
local toString = function( value )
	if type( value ) == "table" then
		return table.tostring( value )
	else
		return tostring( value )
	end
end
-----------------------------------------------
--- Inicia un nuevo objeto GGData.
-- @param id El nombre del GGData a crear o cargar (si ya existe).
-- @param ruta La ruta a GGData. Opcional, el valor predeterminado es "cuadros".
-- @param baseDir El directorio base para GGData. Opcional, el valor predeterminado es system.DocumentsDirectory.
-- @return El nuevo objeto.
function GGData:new( id, path, baseDir )
    local self = {}
    setmetatable( self, GGData_mt )
    self.id = id
    self.path = path or "boxes"
    self.baseDir = baseDir
    if self.id then
    	self:load()
    end
    return self
end
--- Carga o recarga este objeto GGData desde el disco.
-- @param id La identificación del objeto GGData.
-- @param ruta La ruta a GGData. Opcional, el valor predeterminado es "cuadros".
-- @param baseDir El directorio base para GGData. Opcional, el valor predeterminado es system.DocumentsDirectory.
function GGData:load( id, path, baseDir )
	-- Set up the path
	path = path or "boxes"
-- Predeclarar el nuevo objeto GGData
	local box
-- Si no se pasó ninguna identificación, supongamos que estamos trabajando con un objeto GGData precargado, así que use su identificación.
	if not id then
		id = self.id
		box = self
	end
	local data = {}
	local path = system.pathForFile( path .. "/" .. id .. ".box", baseDir or system.DocumentsDirectory )
	local file = io.open( path, "r" )
	if not file then
		return
	end
	data = json.decode( file:read( "*a" ) )
	io.close( file )
	-- Si no existe GGData, entonces estamos actuando sobre una función de clase, es decir, no sobre un objeto GGData precargado.
	if not box then
	-- Cree el nuevo objeto GGData.
		box = GGData:new()
	end
	-- Copie todas las propiedades.
	for k, v in pairs( data ) do
		box[ k ] = v
	end
	return box
end
--- Guarda este objeto GGData en el disco.
function GGData:save()
-- No quiero que esta clave se guarde
	local integrityKey = self.integrityKey
	self.integrityKey = nil
	local data = {}
-- Copiar en todas las propiedades que se pueden guardar.
	for k, v in pairs( self ) do
		if type( v ) ~= "function" and type( v ) ~= "userdata" then
			data[ k ] = v
		end
	end
-- Busque y cree si es necesario el directorio de cajas.
	local path = system.pathForFile( "", system.DocumentsDirectory )
	local success = lfs.chdir( path )
	if success then
		lfs.mkdir( self.path )
		path = self.path
	else
		path = ""
	end
	data = json.encode( data )
	path = system.pathForFile( self.path .. "/" .. self.id .. ".box", system.DocumentsDirectory )
	local file = io.open( path, "w" )
	if not file then
		return
	end
	file:write( data )
	io.close( file )
	file = nil
-- Vuelva a colocar la llave
	self.integrityKey = integrityKey
end
--- Establece un valor en este objeto GGData.
-- @param name El nombre del valor a establecer.
-- @param valor El valor a establecer.
function GGData:set( name, value )
	self[ name ] = value
	self:storeIntegrityHash( name, value )
end
--- Obtiene un valor de este objeto GGData.
-- @param name El nombre del valor a obtener.
-- @return El valor.
function GGData:get( name )
	return self[ name ] or self[ tostring( name) ]
end
--- Comprueba si un valor de este objeto GGData es mayor que otro valor.
-- @param name El nombre del primer valor a comprobar.
-- @param otherValue El nombre del otro valor a verificar. También puede ser un número.
-- @return Verdadero si el primer valor es mayor, falso en caso contrario.
function GGData:isValueHigher( name, otherValue )
	if type( otherValue ) == "string" then
		otherValue = self:get( otherValue )
	end
	return self[ name ] > otherValue
end
--- Comprueba si un valor de este objeto GGData es menor que otro valor.
-- @param name El nombre del primer valor a comprobar.
-- @param otherValue El nombre del otro valor a verificar. También puede ser un número.
-- @return Verdadero si el primer valor es menor, falso en caso contrario.
function GGData:isValueLower( name, otherValue )
	if type( otherValue ) == "string" then
		otherValue = self:get( otherValue )
	end
	return self[ name ] < otherValue
end
---------------------------------------------------------------------------------------------------
--- Comprueba si un valor de este objeto GGData es igual a otro valor.
-- @param name El nombre del primer valor a comprobar.
-- @param otherValue El nombre del otro valor a verificar. También puede ser un número.
-- @return Verdadero si el primer valor es igual, falso en caso contrario.
function GGData:isValueEqual( name, otherValue )
	if type( otherValue ) == "string" then
		otherValue = self:get( otherValue )
	end
	return self[ name ] == otherValue
end
--- Comprueba si este objeto GGData tiene una propiedad específica o no.
-- @param name El nombre del valor a verificar.
-- @return Verdadero si el valor existe y no es nulo; en caso contrario, falso.
function GGData:hasValue( name )
	return self[ name ] ~= nil and true or false
end
--- Establece un valor en este objeto GGData si es nuevo.
-- @param name El nombre del valor a establecer.
-- @param valor El valor a establecer.
function GGData:setIfNew( name, value )
	if self[ name ] == nil then
		self[ name ] = value
		self:storeIntegrityHash( name, value )
	end
end
--- Establece un valor en este objeto GGData si es mayor que el valor actual.
-- @param name El nombre del valor a establecer.
-- @param valor El valor a establecer.
function GGData:setIfHigher( name, value )
	if self[ name ] and value > self[ name ] or not self[ name ] then
		self[ name ] = value
		self:storeIntegrityHash( name, value )
	end
end
--- Establece un valor en este objeto GGData si es inferior al valor actual.
-- @param name El nombre del valor a establecer.
-- @param valor El valor a establecer.
function GGData:setIfLower( name, value )
	if self[ name ] and value < self[ name ] or not self[ name ] then
		self[ name ] = value
		self:storeIntegrityHash( name, value )
	end
end
--- Incrementa un valor en este objeto GGData.
-- @param name El nombre del valor a incrementar. Tiene que ser un número. Si no existe, se establecerá en 0 y luego se incrementará.
-- @param cantidad La cantidad a incrementar. Opcional, el valor predeterminado es 1.
function GGData:increment( name, amount )
	if not self[ name ] then
		self:set( name, 0 )
	end
	if self[ name ] and type( self[ name ] ) == "number" then
		self[ name ] = self[ name ] + ( amount or 1 )
		self:storeIntegrityHash( name, value )
	end
end
--- Disminuye un valor en este objeto GGData.
-- @param name El nombre del valor a disminuir. Tiene que ser un número. Si no existe, se establecerá en 0 y luego se reducirá.
-- @param cantidad La cantidad a disminuir. Opcional, el valor predeterminado es 1.
function GGData:decrement( name, amount )
	if not self[ name ] then
		self:set( name, 0 )
	end
	if self[ name ] and type( self[ name ] ) == "number" then
		self[ name ] = self[ name ] - ( amount or 1 )
		self:storeIntegrityHash( name, value )
	end
end
--- Borra este objeto GGData.
function GGData:clear()
	for k, v in pairs( self ) do
		if k ~= "integrityControlEnabled"
			and k ~= "integrityAlgorithm"
			and k ~= "integrityKey"
			and k ~= "id"
			and k ~= "path"
			and type( k ) ~= "function" then
				self[ k ] = nil
		end
	end
end
--- Elimina este objeto GGData del disco.
-- @param id La identificación del GGData que se va a eliminar. Opcional, solo es necesario si se llama a un objeto no cargado.
function GGData:delete( id )
-- Si no se pasó ninguna identificación, supongamos que estamos trabajando con un objeto GGData precargado, así que use su identificación.
	if not id then
		id = self.id
	end
	local path = system.pathForFile( self.path, system.DocumentsDirectory )
	local success = lfs.chdir( path )
	os.remove( path .. "/" .. id .. ".box" )
	if not success then
		return
	end
end
--- Activa o desactiva la sincronización de este cuadro.
-- @param habilitado Verdadero si se debe habilitar la sincronización, falso en caso contrario.
function GGData:setSync( enabled, id )
-- Si no se pasó ninguna identificación, supongamos que estamos trabajando con un objeto GGData precargado, así que use su identificación.
	if not id then
		id = self.id
	end
	native.setSync( self.path .. "/" .. id .. ".box", { iCloudBackup = enabled } )
end
--- Comprueba si la sincronización de esta casilla está habilitada o no.
-- @param habilitado Verdadero si la sincronización está habilitada, falso en caso contrario.
function GGData:getSync( id )
-- Si no se pasó ninguna identificación, supongamos que estamos trabajando con un objeto GGData precargado, así que use su identificación.
	if not id then
		id = self.id
	end
	return native.getSync( self.path .. "/" .. id .. ".box", { key = "iCloudBackup" } )
end
--- Habilita la verificación de integridad.
-- Algoritmo @param El algoritmo hash a utilizar; consulte esta página para conocer las posibilidades: http://docs.coronalabs.com/api/library/crypto/index.html
-- @param key La semilla que se utilizará para el algoritmo hash.
function GGData:enableIntegrityControl( algorithm, key )
	self.integrityAlgorithm = algorithm
	self.integrityKey = key
	self.hash = self.hash or {}
	self.integrityControlEnabled = true
end
--- Desactiva la comprobación de integridad.
function GGData:disableIntegrityControl()
	self.integrityAlgorithm = nil
	self.integrityKey = nil
	self.hash = nil
	self.integrityControlEnabled = false
end
--- Verifica que el valor pasado coincida con el hash almacenado.
-- @param name El nombre del valor a verificar.
-- @param value El valor a comprobar.
-- @return True si el valor coincide con el hash, false en caso contrario.
function GGData:verifyItemIntegrity( name, value )
-- ¡simplemente hash de la versión tostring() y compárala con eso!
	if toString( value ) then
		local generatedHash = crypto.hmac( self.integrityAlgorithm, toString( value ), self.integrityKey, false )
		local storedHash = self.hash[ name ]
		return generatedHash == storedHash
	end
end
--- Almacena el valor hash del valor dado que se utilizará para las comprobaciones de integridad.
-- @param name El nombre del valor a establecer.
-- @param valor El valor a establecer. Opcional, si no se incluye, simplemente extraerá el valor del nombre proporcionado.
function GGData:storeIntegrityHash( name, value )
	if not self.integrityControlEnabled then
		return
	end
	value = value or self[ name ]
	self.hash = self.hash or {}
	if value then
		self.hash[ name ] = crypto.hmac( self.integrityAlgorithm, toString( value ), self.integrityKey, false )
	end
end
--- Actualiza/establece el valor hash de todos los valores almacenados.
function GGData:updateAllIntegrityHashes()
	for k, v in pairs( self ) do
		if k ~= "integrityControlEnabled"
			and k ~= "integrityAlgorithm"
			and k ~= "integrityKey"
			and k ~= "hash"
			and k ~= "id"
			and k ~= "path"
			and  toString( v ) then
				self:storeIntegrityHash( k, v )
		end
	end
end
--- Comprueba las versiones hash de todos los datos almacenados. Eliminará cualquier valor que no coincida con sus hashes, es decir, que hayan sido manipulados.
function GGData:verifyIntegrity()
	if not self.integrityControlEnabled then
		return
	end
	local corruptEntries = {}
	for k, v in pairs( self ) do
		if k ~= "integrityControlEnabled"
			and k ~= "integrityAlgorithm"
			and k ~= "integrityKey"
			and k ~= "hash"
			and k ~= "id"
			and k ~= "path"
			and toString( v ) then
				if not self:verifyItemIntegrity( k, v ) then
					corruptEntries[ #corruptEntries + 1 ] = { name = k, value = v }
					self[ k ] = nil
					self.hash[ k ] = nil
				end
		end
	end
	for k, v in pairs( self.hash ) do
		if not self[ k ] then
			corruptEntries[ #corruptEntries + 1 ] = { name = k, value = v }
			self[ k ] = nil
			self.hash[ k ] = nil
		end
	end
	return corruptEntries
end
--- Obtiene la ruta al archivo almacenado. Útil si quieres subirlo.
-- @return Dos parámetros; la ruta completa y luego la ruta relativa.
function GGData:getFilename()
	local relativePath = self.path .. "/" .. self.id .. ".box"
	local fullPath = system.pathForFile( relativePath, system.DocumentsDirectory )
	return fullPath, relativePath
end
--- Destruye este objeto GGData.
function GGData:destroy()
	self:clear()
	self = nil
end
return GGData
