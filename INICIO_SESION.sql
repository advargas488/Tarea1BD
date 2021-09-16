USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[INICIO_SESION]    Script Date: 9/15/2021 8:24:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[INICIO_SESION2]
	@USER VARCHAR(50),
	@PASS VARCHAR(50)
AS
BEGIN
	DECLARE @NumCuenta INT

	SELECT @NumCuenta = NumeroCuenta
						FROM Usuarios_Ver,Usuarios
						WHERE Usuarios_Ver.Username = @USER AND Usuarios.Username = @USER AND Usuarios.Pass = @PASS
	SELECT @NumCuenta
END