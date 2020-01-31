DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS vets;

CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  experience INT
);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  contact_number VARCHAR(255)
);

CREATE TABLE pets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  dob VARCHAR(255),
  species VARCHAR(255),
  owner_details INT REFERENCES owners(id) ON DELETE CASCADE,
  vet_details INT REFERENCES vets(id) ON DELETE CASCADE,
  treatment_notes VARCHAR(255)
);
