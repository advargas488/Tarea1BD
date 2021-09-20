USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_BENEFICIARIO]    Script Date: 9/20/2021 1:35:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[INSERTAR_BENEFICIARIO]
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
								  WHERE B.NumeroCuenta = @inNumCuenta AND Activo = 1

	IF @NumeroBeneficiarios >= 3
			RETURN 
	IF EXISTS (SELECT * FROM dbo.Beneficiarios AS B 
			   WHERE B.NumeroCuenta = @inNumCuenta AND B.ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario AND Activo = 0)
		UPDATE dbo.Beneficiarios 
		SET Activo = 1, ParentezcoId = @inParentezcoId, Porcentaje = @inPorcentaje
		WHERE NumeroCuenta = @inNumCuenta AND ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario
			 
	ELSE
		INSERT INTO dbo.Beneficiarios 
		VALUES(
				@inNumCuenta,
				@inValorDocuIdentidadBeneficiario,
				@inParentezcoId,
				@inPorcentaje,
				1);

END
