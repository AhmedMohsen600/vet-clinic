/* Database schema to keep the structure of entire database. */
CREATE TABLE
    animals (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        date_of_birth DATE,
        escape_attempts INT,
        neutered BOOLEAN,
        weight_kg DECIMAL
    );

CREATE TABLE
    owners (
        id SERIAL PRIMARY KEY,
        full_name VARCHAR(255),
        age INT
    );

CREATE TABLE
    species (id SERIAL PRIMARY KEY, name VARCHAR(255));

ALTER TABLE animals ADD species varchar(255);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT,
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners (id);