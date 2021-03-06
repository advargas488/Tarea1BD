USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[CUENTAS_POR_USUARIO]    Script Date: 9/20/2021 2:59:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CUENTAS_POR_USUARIO]
	@InUser VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT C.NumeroCuenta,C.ValorDocuIdentidadDelCliente,C.TipoCuentaId,C.FechaCreacion,C.Saldo
		   FROM Cuentas AS C, Usuarios_Ver AS U
		   WHERE C.NumeroCuenta = U.NumeroCuenta AND U.Username = @InUser
		   ORDER BY U.Username;

	SET NOCOUNT OFF;
END
