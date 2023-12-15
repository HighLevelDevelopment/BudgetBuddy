-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-12
-- =============================================
CREATE PROCEDURE [dbo].[GetCompanyByDocument]
	@Document VARCHAR(15)
AS
BEGIN
	SELECT * FROM Company WITH(NOLOCK)
	WHERE Active = 1
	AND
	Document = @Document
END