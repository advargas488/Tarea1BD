USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[BENEFICIARIO_POR_CUENTA]    Script Date: 9/15/2021 10:33:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BENEFICIARIO_POR_CUENTA2]
	@NumeroCuenta INT,
	@ValorDocuBene INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT	P.Nombre, B.ParentezcoId, B.Porcentaje, P.FechaNacimiento, B.ValorDocuIdentidadBeneficiario, P.Email, P.Telefono1,P.Telefono2
	FROM Beneficiarios AS B,Personas AS P
	WHERE B.NumeroCuenta = @NumeroCuenta AND B.ValorDocuIdentidadBeneficiario = @ValorDocuBene AND P.ValorDocuIdentidad = B.ValorDocuIdentidadBeneficiario
END
