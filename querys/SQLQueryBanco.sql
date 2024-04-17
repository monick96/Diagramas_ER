/*Cliente*/

CREATE TABLE cliente(
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(100),
	cuil INT UNIQUE
)

/*telefono*/

CREATE TABLE telefono(
	idTelefono INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT FOREIGN KEY REFERENCES cliente(idCliente),
	tipoTelefono VARCHAR(20),
	nroTelefono INT
)

/*banco*/

CREATE TABLE banco(
	idBanco INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(100)
)

/*cuenta*/
/*podria haber declarado nro de cuenta como UNIQUE NOT NULL y tomarlo como id de la tabla*/

CREATE TABLE cuenta (
	idCuenta INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT FOREIGN KEY REFERENCES cliente(idCliente),
	idBanco INT FOREIGN KEY REFERENCES banco(idBanco),
	nroCuenta TINYINT,
	tipoCuenta VARCHAR(4) CHECK(tipoCuenta IN('CC','CA','CVU','CBU'))
)

/*tipo operacion*/
CREATE TABLE tipoOperacion(
	idTipoOperacion INT PRIMARY KEY IDENTITY(1,1),
	nombreTipoOperacion VARCHAR(50)
)

/*operacion*/

CREATE TABLE operacion(
	idOperacion INT PRIMARY KEY IDENTITY (1,1),
	monto DECIMAL(12,2),
	descripcion VARCHAR(50),
	idCuentaOrigen INT FOREIGN KEY REFERENCES cuenta(idCuenta),
	idCuentaDestino INT FOREIGN KEY REFERENCES cuenta(idCuenta),
	idTipoOperacion INT FOREIGN KEY REFERENCES tipoOperacion(idTipoOperacion),
	CONSTRAINT CHK_cuentasDiferentes CHECK(idCuentaOrigen <> idCuentaDestino)

)

