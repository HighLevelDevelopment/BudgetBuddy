-- =============================================
-- Author:		Lucas AUGUSTO
-- =============================================
CREATE PROCEDURE DeleteCompanyByDocument 
	@Document VARCHAR(255)
AS
BEGIN
	UPDATE Company SET Active = 0
	WHERE Document = @Document
END