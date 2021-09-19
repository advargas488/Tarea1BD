SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE GET_NUMERO_BENEFICIARIOS
	@inNumCuenta INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @NumeroBeneficiarios INT;

	SELECT @NumeroBeneficiarios = COUNT(*)
								  FROM Beneficiarios AS B
								  WHERE B.NumeroCuenta = @inNumCuenta
	
	SELECT @NumeroBeneficiarios;

	SET NOCOUNT OFF;
END
GO

