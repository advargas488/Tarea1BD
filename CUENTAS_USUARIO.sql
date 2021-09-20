SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE CUENTAS_POR_USUARIO
	@InUser VARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT C.NumeroCuenta,C.ValorDocuIdentidadDelCliente,C.TipoCuentaId,C.FechaCreacion,C.Saldo
	FROM Cuentas AS C, Usuarios_Ver AS U
	WHERE C.NumeroCuenta = U.NumeroCuenta AND U.Username = @InUser
	ORDER BY U.Username
END
GO
