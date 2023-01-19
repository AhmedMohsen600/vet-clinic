/*Queries that provide answers to the questions from all projects.*/
SELECT
    *
FROM
    animals
WHERE
    RIGHT (name, 3) = 'mon';

SELECT
    id,
    name,
    date_of_birth
FROM
    animals
WHERE
    date_of_birth BETWEEN '2016-01-1' AND '2019-01-1';

SELECT
    name,
    neutered,
    escape_attempts
FROM
    animals
WHERE
    neutered = TRUE
    AND escape_attempts < 3;

SELECT
    date_of_birth
FROM
    animals
WHERE
    name IN ('Agumon', 'Pikachu');

SELECT
    name,
    escape_attempts
FROM
    animals
WHERE
    weight_kg > 10.5;

SELECT
    *
FROM
    animals
WHERE
    neutered = TRUE;

SELECT
    *
FROM
    animals
WHERE
    name != 'Gabumon';

SELECT
    *
FROM
    animals
WHERE
    weight_kg >= 10.4
    AND weight_kg <= 17.3;

-- TRANSACTION  
BEGIN;

UPDATE animals
SET
    species = 'unspecified';

ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;

UPDATE animals
SET
    species = 'digimon'
WHERE
    RIGHT (name, 3) = 'mon';

UPDATE animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

COMMIT;

SELECT
    *
FROM
    animals;

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;

DELETE FROM animals
WHERE
    date_of_birth > '2022-01-1';

SAVEPOINT FIRSTPOINT;

UPDATE animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT FIRSTPOINT;

UPDATE animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    *
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    neutered,
    max(escape_attempts) as "max excapes"
FROM
    animals
GROUP BY
    neutered;

SELECT
    species,
    min(weight_kg) as "min weight",
    max(weight_kg) as "max weight"
FROM
    animals
GROUP BY
    species;

SELECT
    species,
    AVG(escape_attempts) as "average"
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-1' AND '2000-01-1'
GROUP BY
    species;