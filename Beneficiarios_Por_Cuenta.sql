USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[BENEFICIARIOS_POR_CUENTA]    Script Date: 9/20/2021 2:18:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BENEFICIARIOS_POR_CUENTA]
	@NumCuenta INT
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT * FROM Beneficiarios 
	WHERE NumeroCuenta = @NumCuenta AND Activo = 1

END
