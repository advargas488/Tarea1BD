USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_BENEFICIARIO]    Script Date: 9/20/2021 3:00:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ELIMINAR_BENEFICIARIO]

	@inNumeroCuenta INT,
	@inDocumentoBene INT

AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.Beneficiarios
	SET Activo = 0
	WHERE NumeroCuenta = @inNumeroCuenta AND ValorDocuIdentidadBeneficiario = @inDocumentoBene;

	SET NOCOUNT OFF;
END
