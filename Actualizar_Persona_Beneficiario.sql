SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE ACTUALIZAR_PERSONA_BENEFICIARIO
	@NumeroCuenta INT,
	@ValorDocu INT,
	@Nombre VARCHAR(50),
	@IDParentezco INT,
	@Porcentaje INT 

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Personas
	SET	Nombre = @Nombre
	WHERE ValorDocuIdentidad = @ValorDocu

	UPDATE Beneficiarios
	SET ParentezcoId = @IDParentezco, Porcentaje = @Porcentaje
	WHERE ValorDocuIdentidadBeneficiario = @ValorDocu AND NumeroCuenta = @NumeroCuenta

END
GO
