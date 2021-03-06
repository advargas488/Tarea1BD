USE [Tarea1_BD]
GO

--Archivo XML para la insercion
DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\DatosTarea-1.xml', SINGLE_BLOB) 
		AS xmlData
		);

--Personas

INSERT INTO dbo.Personas(ValorDocuIdentidad,TipoDocuIdentidad,Nombre,FechaNacimiento,Email,Telefono1,Telefono2)
SELECT	
		T.Item.value('@ValorDocumentoIdentidad','INT'),
		T.Item.value('@TipoDocuIdentidad','INT'),
		T.Item.value('@Nombre','VARCHAR(50)'),
		T.Item.value('@FechaNacimiento','DATE'),
		T.Item.value('@Email','VARCHAR(50)'),
		T.Item.value('@Telefono1','INT'),
		T.Item.value('@Telefono2','INT')
FROM @xmlData.nodes('Datos/Personas/Persona') AS T(Item)

--Cuentas
DECLARE @TempCuentas TABLE
(
	ValorDocuIdentidadDelCliente INT,
	TipoCuentaId INT,
	NumeroCuenta INT,
	FechaCreacion DATE,
	Saldo NVARCHAR(30)
)

INSERT INTO @TempCuentas(ValorDocuIdentidadDelCliente,TipoCuentaId,NumeroCuenta,FechaCreacion,Saldo)
SELECT 
		T.Item.value('@ValorDocumentoIdentidadDelCliente','INT'),
		T.Item.value('@TipoCuentaId','INT'),
		T.Item.value('@NumeroCuenta','INT'),
		T.Item.value('@FechaCreacion','DATE'),
		T.Item.value('@Saldo','NVARCHAR(30)')
FROM @xmlData.nodes('Datos/Cuentas/Cuenta') AS T(Item)


INSERT dbo.Cuentas(NumeroCuenta,ValorDocuIdentidadDelCliente,TipoCuentaId,FechaCreacion,Saldo)
	SELECT C.NumeroCuenta,C.ValorDocuIdentidadDelCliente, C.TipoCuentaId,C.FechaCreacion,C.Saldo
	FROM @TempCuentas AS C, Personas AS P
	WHERE C.ValorDocuIdentidadDelCliente = P.ValorDocuIdentidad

--Beneficiarios
DECLARE @TempBeneficiarios TABLE
(
	NumeroCuenta INT,
	ValorDocuIdentidadBeneficiario INT,
	ParentezcoId INT,
	Porcentaje INT
)


INSERT INTO @TempBeneficiarios(NumeroCuenta,ValorDocuIdentidadBeneficiario,ParentezcoId,Porcentaje)
SELECT 
		T.Item.value('@NumeroCuenta','INT'),
		T.Item.value('@ValorDocumentoIdentidadBeneficiario','INT'),
		T.Item.value('@ParentezcoId','INT'),
		T.Item.value('@Porcentaje','INT')
FROM @xmlData.nodes('Datos/Beneficiarios/Beneficiario') AS T(Item)

INSERT INTO dbo.Beneficiarios(NumeroCuenta,ValorDocuIdentidadBeneficiario,ParentezcoId,Porcentaje)
SELECT C.NumeroCuenta, P.ValorDocuIdentidad,T.ParentezcoId,T.ParentezcoId
FROM @TempBeneficiarios AS T, Cuentas AS C, Personas AS P
WHERE T.NumeroCuenta = C.NumeroCuenta AND T.ValorDocuIdentidadBeneficiario = P.ValorDocuIdentidad

--Usuarios
DECLARE @TempUsers TABLE
(
	Username VARCHAR(50),
	Pass VARCHAR(50),
	ValorDocuIdentidad INT,
	EsAdministrador INT
)

INSERT INTO @TempUsers(Username,Pass,ValorDocuIdentidad,EsAdministrador)
SELECT 
		T.Item.value('@Usuario','VARCHAR(50)'),
		T.Item.value('@Pass','VARCHAR(50)'),
		T.Item.value('@ValorDocumentoIdentidad','INT'),
		T.Item.value('@EsAdministrador','INT')
FROM @xmlData.nodes('Datos/Usuarios/Usuario') AS T(Item)

INSERT INTO dbo.Usuarios(Username,ValorDocuIdentidad,Pass,EsAdministrador)
SELECT T.Username,P.ValorDocuIdentidad,T.Pass,T.EsAdministrador
FROM @TempUsers AS T, Personas AS P
WHERE T.ValorDocuIdentidad = P.ValorDocuIdentidad

--Usuarios cuentas
DECLARE @TempUsers_Ver TABLE
(
	Username VARCHAR(50),
	NumeroCuenta INT
)


INSERT INTO @TempUsers_Ver(Username,NumeroCuenta)
SELECT 
		T.Item.value('@Usuario','VARCHAR(50)'),
		T.Item.value('@NumeroCuenta','INT')
FROM @xmlData.nodes('Datos/Usuarios_Ver/UsuarioPuedeVer') AS T(Item)

INSERT INTO Usuarios_Ver(Username,NumeroCuenta)
SELECT U.Username, C.NumeroCuenta
FROM @TempUsers_Ver AS T, Cuentas AS C, Usuarios AS U
WHERE T.NumeroCuenta = C.NumeroCuenta AND T.Username = U.Username

