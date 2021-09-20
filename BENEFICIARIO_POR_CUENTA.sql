USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[BENEFICIARIO_POR_CUENTA2]    Script Date: 9/20/2021 2:15:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BENEFICIARIO_POR_CUENTA2]
	@InNumeroCuenta INT,
	@InValorDocuBene INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT	P.Nombre, B.ParentezcoId, B.Porcentaje, P.FechaNacimiento, B.ValorDocuIdentidadBeneficiario, P.Email, P.Telefono1,P.Telefono2
	FROM Beneficiarios AS B,Personas AS P
	WHERE B.NumeroCuenta = @InNumeroCuenta AND B.ValorDocuIdentidadBeneficiario = @InValorDocuBene AND P.ValorDocuIdentidad = B.ValorDocuIdentidadBeneficiario

	SET NOCOUNT OFF
END
