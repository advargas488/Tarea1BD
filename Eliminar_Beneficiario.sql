SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ELIMINAR_BENEFICIARIO

	@NumeroCuenta INT,
	@DocumentoBene INT

AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.Beneficiarios
	SET Activo = 0
	WHERE NumeroCuenta = @NumeroCuenta AND ValorDocuIdentidadBeneficiario = @DocumentoBene
END
GO
