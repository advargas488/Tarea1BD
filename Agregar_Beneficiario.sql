SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE INSERTAR_BENEFICIARIO
	@inNumCuenta INT,
	@inValorDocuIdentidadBeneficiario INT,
	@inParentezcoId INT,
	@inPorcentaje INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @NumeroBeneficiarios INT 

	SELECT @NumeroBeneficiarios = COUNT(*)
								  FROM Beneficiarios AS B
								  WHERE B.NumeroCuenta = @inNumCuenta

	IF @NumeroBeneficiarios >= 3
			RETURN 

	IF EXISTS (SELECT * FROM dbo.Beneficiarios AS B 
			   WHERE B.NumeroCuenta = @inNumCuenta AND B.ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario AND Activo = 0)
		UPDATE dbo.Beneficiarios 
		SET Activo = 1, ParentezcoId = @inParentezcoId, Porcentaje = @inPorcentaje
		WHERE NumeroCuenta = @inNumCuenta AND ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario
		RETURN 

	INSERT INTO dbo.Beneficiarios 
	VALUES(
			@inNumCuenta,
			@inValorDocuIdentidadBeneficiario,
			@inParentezcoId,
			@inPorcentaje,
			1);

END
GO
