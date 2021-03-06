USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[INICIO_SESION2]    Script Date: 9/20/2021 3:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[INICIO_SESION2]
	@inUSER VARCHAR(50),
	@inPASS VARCHAR(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	--necesito que cuando el usuario inicie sesion, este SP me devuelva el numero de cuenta del usuario, para eso esta variable
	DECLARE @NumCuenta INT;

	SELECT @NumCuenta = NumeroCuenta
						FROM Usuarios_Ver,Usuarios
						WHERE Usuarios_Ver.Username = @inUSER AND Usuarios.Username = @inUSER AND Usuarios.Pass = @inPASS;
	SELECT @NumCuenta;

	SET NOCOUNT OFF;
END