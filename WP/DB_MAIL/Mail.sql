USE [dbo]
GO

DECLARE @embedHTML VARCHAR(MAX)
DECLARE @HTMLBODY VARCHAR(MAX)

EXEC [dbo].[tables_to_HTML]
	@embedHTML OUTPUT

SET @HTMLBODY = '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
</head>
<body>
    <main style="box-sizing: border-box;padding: 0;margin: 0;font-family: Ubuntu;width: 540px;padding: 4px;border-radius: 4px;margin: auto;text-align: center;
    color: #ffffff;display: flex;flex-direction: column;align-items: center;">
        <h1>Correo de prueba</h1>
        <span>Descripción de prueba para datos adjuntos</span>
        <div>
            <table style="text-align: left;margin-top: 24px;">
                <tr>
                    <td style="padding: 4px;"><strong>ID</strong></td>
                    <td style="padding: 4px;"><strong>SERIAL</strong></td>
                    <td style="padding: 4px;"><strong>PORCENTAJE DE BATERIA</strong></td>
                </tr>' + @embedHTML +
            '</table>
        </div>
    </main>
</body>
</html>'

EXEC msdb.dbo.sp_send_dbmail
	@profile_name = 'perfil',
	@recipients = 'destinos',
	@body = @HTMLBODY,
	@body_format = 'HTML',
	--@from_address = 'Notificaciones',
	@subject = 'Notificaciones enviadas desde DB'
	
