USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[GET_NUMERO_BENEFICIARIOS]    Script Date: 9/20/2021 3:00:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GET_NUMERO_BENEFICIARIOS]
	@inNumCuenta INT
AS
BEGIN
	SET NOCOUNT ON;

	--variable que guardara el numero de beneficiarios
	DECLARE @NumeroBeneficiarios INT;

	--con este select puedo acceder al numero de veces que se repite un beneficiario que este activo
	SELECT @NumeroBeneficiarios = COUNT(*)
								  FROM Beneficiarios AS B
								  WHERE B.NumeroCuenta = @inNumCuenta
								  AND Activo = 1;
	
	SELECT @NumeroBeneficiarios;

	SET NOCOUNT OFF;
END