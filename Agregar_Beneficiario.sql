USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_BENEFICIARIO]    Script Date: 9/20/2021 3:04:56 PM ******/
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

	--variable para saber el numero de beneficiarios activos de una cuenta
	DECLARE @NumeroBeneficiarios INT; 

	SELECT @NumeroBeneficiarios = COUNT(*)
								  FROM Beneficiarios AS B
								  WHERE B.NumeroCuenta = @inNumCuenta AND Activo = 1;

	-- si tiene 3 o mas beneficiarios, el SP no continua
	IF @NumeroBeneficiarios >= 3
			RETURN;

	--si el beneficiario ya ha sido un beneficiario de la cuenta, solo pasa de inactivo a activo y se actualizan sus datos
	IF EXISTS (SELECT * FROM dbo.Beneficiarios AS B 
			   WHERE B.NumeroCuenta = @inNumCuenta AND B.ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario AND Activo = 0)
		UPDATE dbo.Beneficiarios 
		SET Activo = 1, ParentezcoId = @inParentezcoId, Porcentaje = @inPorcentaje
		WHERE NumeroCuenta = @inNumCuenta AND ValorDocuIdentidadBeneficiario = @inValorDocuIdentidadBeneficiario;
		
	--sino solo se inserta el beneficiario
	ELSE
		INSERT INTO dbo.Beneficiarios 
		VALUES(
				@inNumCuenta,
				@inValorDocuIdentidadBeneficiario,
				@inParentezcoId,
				@inPorcentaje,
				1);

	SET NOCOUNT OFF;
END