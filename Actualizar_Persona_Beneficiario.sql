USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_PERSONA_BENEFICIARIO]    Script Date: 9/15/2021 10:19:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ACTUALIZAR_PERSONA_BENEFICIARIO]
	@NumeroCuenta INT,
	@ValorDocu INT,
	@Nombre VARCHAR(50),
	@IDParentezco INT,
	@Porcentaje INT, 
	@FechaNacimiento DATE,
	@Email VARCHAR(50),
	@Telefono1 INT,
	@Telefono2 INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Personas
	SET	Nombre = @Nombre, FechaNacimiento = @FechaNacimiento, Email = @Email, Telefono1 = @Telefono1, Telefono2 = @Telefono2
	WHERE ValorDocuIdentidad = @ValorDocu

	UPDATE Beneficiarios
	SET ParentezcoId = @IDParentezco, Porcentaje = @Porcentaje
	WHERE ValorDocuIdentidadBeneficiario = @ValorDocu AND NumeroCuenta = @NumeroCuenta

END
