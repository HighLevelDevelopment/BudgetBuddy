-- =============================================
-- Author:		Lucas AUGUSTO
-- Create date: 2023-10-12
-- =============================================
CREATE PROCEDURE [dbo].[ListAllCompany]
	@PageNumber INT = 1,
	@RowsPerPage INT = NULL,
	@Name VARCHAR(255) = NULL,
	@Trading VARCHAR(255) = NULL,
	@RemainingPages INT = 0 OUTPUT,
	@TotalItems INT = 0 OUTPUT
AS
BEGIN
	SELECT 
		*
	INTO #Company
	FROM Company WITH(NOLOCK)
	WHERE Active = 1
	AND Name = ISNULL(@Name, Name)
	AND Trading = ISNULL(@Trading, Trading)

	IF @RowsPerPage IS NOT NULL
	BEGIN
		DECLARE @TotalRows INT;
		SELECT @TotalRows = COUNT(*) FROM #Company;
		SET @RemainingPages = CEILING((@TotalRows - COALESCE(@PageNumber,1) * @RowsPerPage) / CAST(@RowsPerPage AS FLOAT));
	END
	ELSE
	BEGIN
		SET @RemainingPages = 0
	END

	SELECT @TotalItems = COUNT(*) FROM #Company;

	SELECT * FROM #Company
	ORDER BY Document
	OFFSET (COALESCE(@PageNumber,1) - 1) * COALESCE(@RowsPerPage,0) ROWS
	FETCH NEXT COALESCE(@RowsPerPage,2147483647) ROWS ONLY;
	
END