CREATE FUNCTION dbo.fn_getfirstname( @str NVARCHAR(4000) )
RETURNS NVARCHAR(2000)
AS
BEGIN
    DECLARE @retval NVARCHAR(2000);
    SET @str=RTRIM(LTRIM(@str));
    SET @retval=LEFT(@str,1);
    WHILE CHARINDEX(' ',@str,1)>0 
    BEGIN
        SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
        SET @retval+='.'+(LEFT(@str,1));
    END
    RETURN @retval;
END
GO

DECLARE @empname VARCHAR(50)
SET @empname = 'Michael Dennis Stocks'

SELECT  @empname AS full_name, 
left(@empname,len(@empname)+1-charindex(' ',reverse(@empname))) as initals,
REVERSE(LEFT( REVERSE(@empname), CHARINDEX(' ', REVERSE(@empname))-1 )) as last_name,
dbo.fn_getfirstname(left(@empname,len(@empname)+1-charindex(' ',reverse(@empname))))+' '+
REVERSE(LEFT( REVERSE(@empname), CHARINDEX(' ', REVERSE(@empname))-1 )) as initals_last_name


