USE [Tarea1_BD]
GO

--Archivo XML para la insercion
DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\DatosTarea-1.xml', SINGLE_BLOB) 
		AS xmlData
		);

USE [Tarea1_BD]
GO

--Archivo XML para la insercion
DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\Dell\OneDrive\Desktop\DatosTarea-1.xml', SINGLE_BLOB) 
		AS xmlData
		);

--Tipo de documento
INSERT INTO dbo.TipoDocuIdentidad(Id,Nombre)
SELECT 
		T.Item.value('@Id','INT'),
		T.Item.value('@Nombre','VARCHAR(50)')
FROM @xmlData.nodes('Datos/Tipo_Doc/TipoDocuIdentidad') AS T(Item)


--Tipo monedas
INSERT INTO dbo.TipoMoneda(Id,Nombre)
SELECT 
		T.Item.value('@Id','INT'),
		T.Item.value('@Nombre','VARCHAR(50)')
FROM @xmlData.nodes('Datos/Tipo_Moneda/TipoMoneda') AS T(Item)

--Parentezcos
INSERT INTO dbo.Parentezcos(Id,Nombre)
SELECT 
		T.Item.value('@Id','INT'),
		T.Item.value('@Nombre','VARCHAR(50)')
FROM @xmlData.nodes('Datos/Parentezcos/Parentezco') AS T(Item)

--Tipo cuenta ahorros
INSERT INTO dbo.TipoCuentaAhorros(Id,Nombre,IdTipoMoneda,SaldoMinimo,MultaSaldoMin,CargoAnual,NumRetirosHumanos,NumRetirosAutomaticos,ComisionHumano,ComisionAutomatico,Interes)
SELECT 
		T.Item.value('@Id','INT'),
		T.Item.value('@Nombre','VARCHAR(50)'),
		T.Item.value('@IdTipoMoneda','INT'),
		T.Item.value('@SaldoMinimo','NVARCHAR(30)'),
		T.Item.value('@MultaSaldoMin','NVARCHAR(30)'),
		T.Item.value('@CargoAnual','INT'),
		T.Item.value('@NumRetirosHumano','INT'),
		T.Item.value('@NumRetirosAutomatico','INT'),
		T.Item.value('@ComisionHumano','INT'),
		T.Item.value('@ComisionAutomatico','INT'),
		T.Item.value('@Interes','INT')
FROM @xmlData.nodes('Datos/Tipo_Cuenta_Ahorros/TipoCuentaAhorro') AS T(Item)
