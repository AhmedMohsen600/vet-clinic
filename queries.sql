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

-- JOIN
SELECT
    owners.*,
    name AS animal_name
FROM
    owners
    JOIN animals ON animals.owner_id = owners.id
WHERE
    owners.id = 4;

SELECT
    animals.name
FROM
    animals
    JOIN species ON animals.species_id = species.id
WHERE
    species.id = 1;

SELECT
    *,
    animals.name
FROM
    owners
    LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT
    species.name,
    count(*) AS "Animal Count"
FROM
    species
    JOIN animals ON species.id = animals.species_id
GROUP BY
    species.name;

SELECT
    owners.full_name,
    animals.name AS animal_name,
    species.name AS species_name
FROM
    animals
    JOIN species ON animals.species_id = species.id
    JOIN owners ON owners.id = animals.owner_id
WHERE
    species.name = 'Digimon'
    AND owners.full_name = 'Jennifer Orwell';

SELECT
    owners.full_name,
    animals.name,
    animals.escape_attempts
FROM
    owners
    JOIN animals ON animals.owner_id = owners.id
WHERE
    animals.escape_attempts = 0
    AND owners.full_name = 'Dean Winchester';

SELECT
    owners.full_name,
    count(*)
FROM
    owners
    JOIN animals ON animals.owner_id = owners.id
GROUP BY
    owners.full_name
ORDER BY
    count(*) DESC
LIMIT
    1;

SELECT
    animals.name as animal_name
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.id = 1
ORDER BY
    visits.visit_date DESC
LIMIT
    1;

SELECT
    vets.name,
    COUNT(animals.name)
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.id = 3
GROUP BY
    vets.name;

SELECT
    vets.name AS vets_name,
    species.name
FROM
    vets
    LEFT JOIN specializations ON vets.id = specializations.vets_id
    LEFT JOIN species ON species.id = specializations.species_id;

SELECT
    animals.name AS animal_name,
    vets.name AS vets_name
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON visits.vets_id = vets.id
WHERE
    vets.id = 3
    AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT
    animals.name,
    COUNT(animals.name)
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
GROUP BY
    animals.name
ORDER BY
    COUNT(animals.name) DESC
LIMIT
    1;

SELECT
    animals.name,
    visits.visit_date
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.id = 2
ORDER BY
    visits.visit_date ASC
LIMIT
    1;

SELECT
    *
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
ORDER BY
    visits.visit_date DESC
LIMIT
    1;

SELECT
    COUNT(visits.id) as count
FROM
    visits
    LEFT JOIN animals ON visits.animals_id = animals.id
    LEFT JOIN vets ON visits.vets_id = vets.id
    LEFT JOIN specializations ON specializations.species_id = animals.species_id
    AND specializations.vets_id = vets.id
WHERE
    specializations.species_id IS NULL;

SELECT
    species.name as species
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
    JOIN species ON species.id = animals.species_id
WHERE
    vets.id = 2
GROUP BY
    species.name
ORDER BY
    COUNT(species.name) DESC
LIMIT
    1;