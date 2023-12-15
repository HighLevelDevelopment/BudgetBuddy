-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-10
-- =============================================
CREATE PROCEDURE [dbo].[InsCompany]
	@IdCompany int
	, @Name varchar(255)
	, @Trading varchar(255)
	, @Document varchar(15)
AS
BEGIN
	IF (@IdCompany = 0)
	BEGIN
		INSERT INTO Company VALUES
		(
			@Name
			, @Trading
			, @Document
			, GETDATE()
			, 1
		)
	END	
	ELSE
	BEGIN
		UPDATE Company SET Name = @Name, Trading = @Trading, Document = @Document
		WHERE IdCompany = @IdCompany
	END
END