USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_PORCENTAJES2]    Script Date: 9/20/2021 2:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CHECK_PORCENTAJES2]
	@inNumCuenta INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @TOTAL INT;
	
	SELECT @TOTAL = SUM(Porcentaje)
					FROM Beneficiarios
					WHERE NumeroCuenta = @inNumCuenta AND Activo = 1;
	
	SELECT 'Result' = @TOTAL;

	SET NOCOUNT OFF;
END