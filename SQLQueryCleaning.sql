
-- Delete the "index" column as it serves no necessary purpose

ALTER TABLE MentalHealth
DROP COLUMN index;



-- Remove the "%" character from column names using sp_rename

EXEC sp_rename 'MentalHealth.[Schizophrenia (%)]', 'Schizophrenia', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Bipolar disorder (%)]', 'Bipolar disorder', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Eating disorders (%)]', 'Eating disorders', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Anxiety disorders (%)]', 'Anxiety disorders', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Drug use disorders (%)]', 'Drug use disorders', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Depression (%)]', 'Depression', 'COLUMN';
EXEC sp_rename 'MentalHealth.[Alcohol use disorders (%)]', 'Alcohol use disorders', 'COLUMN';



-- Replace coulmn name Entity with Country
EXEC sp_rename 'MentalHealth.Entity', 'Country', 'COLUMN';



-- It seems like there are still some missing country code values

SELECT DISTINCT country
FROM MentalHealth
WHERE code IS NULL;



-- The simplest approach to address this issue is to drop columns that have null values in the code

DELETE FROM MentalHealth
WHERE code IS NULL;



-- Change data type for specific numeric columns

ALTER TABLE MentalHealth
ALTER COLUMN [Year] INT,
ALTER COLUMN [Schizophrenia] DECIMAL(10, 2),
ALTER COLUMN [Bipolar disorder] DECIMAL(10, 2),
ALTER COLUMN [Eating disorders] DECIMAL(10, 2),
ALTER COLUMN [Anxiety disorders] DECIMAL(10, 2),
ALTER COLUMN [Drug use disorders] DECIMAL(10, 2),
ALTER COLUMN [Depression] DECIMAL(10, 2),
ALTER COLUMN [Alcohol use disorders] DECIMAL(10, 2);

