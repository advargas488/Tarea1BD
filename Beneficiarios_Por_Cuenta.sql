USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[BENEFICIARIOS_POR_CUENTA]    Script Date: 9/20/2021 2:57:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BENEFICIARIOS_POR_CUENTA]
	@inNumCuenta INT
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT * FROM Beneficiarios 
	WHERE NumeroCuenta = @inNumCuenta AND Activo = 1;

	SET NOCOUNT OFF;

END
