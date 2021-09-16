USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_PORCENTAJES]    Script Date: 9/15/2021 11:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CHECK_PORCENTAJES2]
	@NumCuenta INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @TOTAL INT
	
	SELECT @TOTAL = SUM(Porcentaje)
					FROM Beneficiarios
					WHERE NumeroCuenta = @NumCuenta AND Activo = 1
	
	SELECT 'Result' = @TOTAL
END
