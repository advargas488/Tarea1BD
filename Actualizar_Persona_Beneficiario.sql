USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_PERSONA_BENEFICIARIO]    Script Date: 9/20/2021 2:35:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ACTUALIZAR_PERSONA_BENEFICIARIO]
	@inNumeroCuenta INT,
	@inValorDocu INT,
	@inNombre VARCHAR(50),
	@inIDParentezco INT,
	@inPorcentaje INT, 
	@inFechaNacimiento DATE,
	@inEmail VARCHAR(50),
	@inTelefono1 INT,
	@inTelefono2 INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Personas
	SET	Nombre = @inNombre, FechaNacimiento = @inFechaNacimiento, Email = @inEmail, Telefono1 = @inTelefono1, Telefono2 = @inTelefono2
	WHERE ValorDocuIdentidad = @inValorDocu;

	UPDATE Beneficiarios
	SET ParentezcoId = @inIDParentezco, Porcentaje = @inPorcentaje
	WHERE ValorDocuIdentidadBeneficiario = @inValorDocu AND NumeroCuenta = @inNumeroCuenta;

	SET NOCOUNT OFF;

END
