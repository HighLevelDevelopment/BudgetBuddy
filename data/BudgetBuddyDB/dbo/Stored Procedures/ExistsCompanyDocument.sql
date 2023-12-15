-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-10
-- =============================================
CREATE PROCEDURE [dbo].[ExistsCompanyDocument]
	@Document varchar(15)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 1 FROM Company WITH(NOLOCK) WHERE Document = @Document
END