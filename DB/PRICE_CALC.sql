DECLARE @AdultPrice MONEY;
DECLARE @ChildPrice MONEY;

DECLARE @Adults INT;
DECLARE @Children INT;

DECLARE @MyCounter INT = 0;


SELECT @Adults = COUNT(*)
FROM Players 
WHERE RegistrarEmail = 'rorylinnane007@gmail.com' 
AND Payed=0
AND RoleId=1;

SELECT @Children = COUNT(*)
FROM Players 
WHERE RegistrarEmail = 'rorylinnane007@gmail.com' 
AND Payed=0
AND RoleId=2;


SELECT @AdultPrice = @Adults * 80;

WHILE(@MyCounter < @Children)
BEGIN;
	
	IF @MyCounter = 0
	BEGIN
		SET @ChildPrice = 50
	END
	ELSE IF @MyCounter = 1
	BEGIN
		SET @ChildPrice = @ChildPrice + 40
	END
	ELSE IF @MyCounter >= 2
	BEGIN
		SET @ChildPrice = @ChildPrice + 30
	END;

	SET @MyCounter = @MyCounter +1;
END;

SELECT  @AdultPrice + @ChildPrice AS 'Total';