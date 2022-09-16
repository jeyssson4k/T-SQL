USE [dbo]

CREATE FUNCTION split_data
(
	@str_data nvarchar(max),
	@separator nvarchar(max)
)

RETURNS @info TABLE (
	id int,
	data_info nvarchar(max)
)

AS
BEGIN
	DECLARE @i AS INT
	DECLARE @j AS INT
	DECLARE @index AS INT
	DECLARE @len AS INT
	DECLARE @index_separator AS INT
	DECLARE @element AS NVARCHAR(MAX)
	DECLARE @str_as AS NVARCHAR(MAX)

	SET @i = 1
	SET @index_separator = CHARINDEX(@separator, @str_data)
	SET @str_as = @str_data
	SET @len = LEN(@str_data)
	SET @j = @len

	WHILE @i <= @j
		BEGIN
			IF CHARINDEX(@separator, @str_data) = 0
				BEGIN
					SET @j = 0
					INSERT INTO @info VALUES(@i, @str_data)
					BREAK
				END	
			ELSE	
				SET @element = SUBSTRING(@str_data,1,@index_separator)

				SET @str_data =  STUFF(@str_data,1,LEN(@element),'')
				SET @element = REPLACE(@element,@separator,'')

				INSERT INTO @info VALUES(@i, @element)

				SET @i = @i + 1
				SET @index_separator = CHARINDEX(@separator, @str_data)
				SET @len = LEN(@str_data)
		END
RETURN
END
