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

CREATE TABLE
    vets (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        age INT,
        date_of_graduation DATE
    );

CREATE TABLE
    specializations (
        species_id INT,
        CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id),
        vets_id INT,
        CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets (id),
        PRIMARY KEY (species_id, vets_id)
    );

CREATE TABLE
    visits (
        id SERIAL PRIMARY KEY,
        animals_id INT,
        CONSTRAINT fk_animals_id FOREIGN KEY (animals_id) REFERENCES animals (id),
        vets_id INT,
        CONSTRAINT fk_animals FOREIGN KEY (vets_id) REFERENCES vets (id),
        visit_date DATE NOT NULL
    );