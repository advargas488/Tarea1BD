SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE AGREGAR_BENEFICIARIO
	@NumeroCuenta INT,
	@DocumentoIdentidadBeneficiario INT,
	@IdParentezco INT,
	@Porcentaje INT
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO Beneficiarios VALUES
	(
		@NumeroCuenta,
		@DocumentoIdentidadBeneficiario,
		@IdParentezco,
		@Porcentaje,
		1
	)
END
GO
