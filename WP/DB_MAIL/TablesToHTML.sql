CREATE OR ALTER PROCEDURE [dbo].[tables_to_HTML](
	@embedHTML VARCHAR(MAX) OUTPUT
)
AS
BEGIN
	DECLARE @i INT
	DECLARE @queryAux VARCHAR(MAX)
	DECLARE @j INT

	SET @i = 0
	SET @j = 10
	SET @embedHTML = '<tr>'

	--SELECT ter_id, ter_serial, ter_nivel_bateria FROM Terminal ORDER BY ter_id ASC
	WHILE @i < @j
		BEGIN
			SELECT @queryAux = ter_id FROM Terminal ORDER BY ter_id ASC OFFSET @i ROWS FETCH NEXT 1 ROWS ONLY 
			SET @embedHTML = @embedHTML + '<td style="padding: 4px;"><span>' + @queryAux + '</span></td>'

			SELECT @queryAux = ter_serial FROM Terminal ORDER BY ter_id ASC OFFSET @i ROWS FETCH NEXT 1 ROWS ONLY
			SET @embedHTML = @embedHTML + '<td style="padding: 4px;"><span>' + @queryAux + '</span></td>'

			SELECT @queryAux = ter_nivel_bateria FROM Terminal ORDER BY ter_id ASC OFFSET @i ROWS FETCH NEXT 1 ROWS ONLY
			SET @embedHTML = @embedHTML + '<td style="padding: 4px;"><span>' + @queryAux + '</span></td></tr>'

			SET @i = @i + 1
		END
END
