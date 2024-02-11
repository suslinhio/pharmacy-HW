CREATE TABLE IF NOT EXISTS drugs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK(name <> ''),
    active_substance VARCHAR(100) NOT NULL CHECK(active_substance <> ''),
    dosage NUMERIC(6,3) NOT NULL CHECK(dosage > 0),
    price NUMERIC(8,2) NOT NULL CHECK(price > 0)
);

CREATE TABLE IF NOT EXISTS drugstores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK(name <> ''),
    adress TEXT NOT NULL CHECK(adress <> ''),
    tel_number CHAR(13)  NOT NULL UNIQUE CHECK(tel_number LIKE '+380_________')
);

CREATE TABLE IF NOT EXISTS drugs_to_drugstores (
    drug_id INT REFERENCES drugs(id),
    drugstore_id INT REFERENCES drugstores(id),
    PRIMARY KEY(drug_id, drugstore_id),
    quantity_available INT NOT NULL CHECK(quantity_available >= 0)
)

CREATE TABLE IF NOt EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK(name <> ''),
    tel_number CHAR(13)  NOT NULL UNIQUE CHECK(tel_number LIKE '+380_________')
);

CREATE TABLE IF NOt EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    drugstore_id INT REFERENCES drugstores(id),
    drug_id INT REFERENCES drugs(id),
    quantity_ordered INT NOT NULL CHECK(quantity_ordered > 0),
    created_at DATE NOT NULL CHECK(created_at <= CURRENT_DATE)
);

