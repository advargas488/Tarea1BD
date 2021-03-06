USE [Tarea1_BD]
GO
/****** Object:  StoredProcedure [dbo].[RESET_TABLE]    Script Date: 9/20/2021 3:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RESET_TABLE]
	
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DELETE FROM [dbo].[Cuentas];

	DELETE FROM [dbo].[Beneficiarios];

	DELETE FROM [dbo].[Usuarios_Ver];

	DELETE FROM [dbo].[Usuarios];

	DELETE FROM [dbo].[Personas];

	DELETE FROM [dbo].[Parentezcos];

	DELETE FROM [dbo].[TipoCuentaAhorros];

	DELETE FROM	[dbo].[TipoDocuIdentidad];

	DELETE FROM [dbo].[TipoMoneda];

	SET NOCOUNT OFF;
END
