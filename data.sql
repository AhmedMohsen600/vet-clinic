/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', 'Feb 3rd, 2020', 0, TRUE, 10.23),
    ('Gabumon', 'Nov 15th, 2018', 2, TRUE, 8),
    ('Pikachu', 'Jan 7th, 2021', 1, FALSE, 15.04),
    ('Devimon', ' May 12th, 2017', 5, TRUE, 11);