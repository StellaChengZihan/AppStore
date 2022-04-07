create table Catalog (
	ID_place BIGSERIAL PRIMARY KEY,
	ID_account INT REFERENCES Account(ID),
	title VARCHAR(50) NOT NULL,
	rating DECIMAL(3,1) CHECK (rating BETWEEN 0 AND 10),
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	price_per_night INT NOT NULL CHECK (price_per_night > 0),
	type VARCHAR(11) CHECK (type IN ('House', 'Apartment', 'Condominium')),
	address VARCHAR(50) NOT NULL,
	guests INT NOT NULL CHECK (guests > 0),
	bedrooms INT NOT NULL CHECK (bedrooms > 0),
	kitchen VARCHAR(3) NOT NULL CHECK (kitchen IN ('Yes', 'No')),
	parking VARCHAR(3) NOT NULL CHECK (parking IN ('Yes', 'No')),
	wifi VARCHAR(3) NOT NULL CHECK (wifi IN ('Yes', 'No')),
	smoking_allowed VARCHAR(3) NOT NULL CHECK (smoking_allowed IN ('Yes', 'No')),
	pets_allowed VARCHAR(3) NOT NULL CHECK (pets_allowed IN ('Yes', 'No')),
	air_conditioning VARCHAR(3) NOT NULL CHECK (air_conditioning IN ('Yes', 'No')),
	TV VARCHAR(3) NOT NULL CHECK (TV IN ('Yes', 'No')),
	washing_machine VARCHAR(3) NOT NULL CHECK (washing_machine IN ('Yes', 'No')),
	UNIQUE (ID_account, country, city, type, address, guests, bedrooms)

);
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (26, 'Super Host Apartment', 10.0, 'Morocco', 'Rabat', 68, 'Apartment', '32986 Nelson Crossing', 4, 6, 'Yes', 'No', 'No', 'Yes', 'No', 'No', 'No', 'Yes');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (37, 'Homestay at Shang Hai', 9.6, 'China', 'Shang Hai', 462, 'Apartment', '343 Marcy Court', 4, 6, 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (44, 'Apartment away from town', 7.8, 'Indonesia', 'Bali', 423, 'Apartment', '1321 Stuart Way', 6, 2, 'No', 'Yes', 'Yes', 'No', 'No', 'No', 'Yes', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (51, 'Premium Single Room with services', 2.6, 'Indonesia', 'Yogyakarta', 410, 'House', '43547 Old Shore Park', 3, 1, 'No', 'No', 'No', 'No', 'No', 'No', 'Yes', 'Yes');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (73, 'Large,  clean & comfy, easy to city', 5.7, 'Paraguay', 'Asunción', 123, 'Condominium', '32807 Arrowood Alley', 1, 5, 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'Yes', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (83, 'Central Condo, reasonable price', 6.6, 'Serbia', 'Belgrade', 274, 'Condominium', '59 Spaight Alley', 1, 4, 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'No', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (88, 'Simple Private Room for Two', 1.1, 'Colombia', 'Cali', 288, 'Apartment', '841 Cardinal Plaza', 2, 1, 'No', 'No', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (89, 'Walking Distance to MRT', 5.5, 'Canada', 'Toronto', 412, 'Apartment', '307 Sugar Terrace', 1, 4, 'Yes', 'No', 'Yes', 'No', 'Yes', 'No', 'No', 'No');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (96, 'Balcony room for 2', 6.4, 'Norway', 'Oslo', 317, 'House', '3 Crownhardt Park', 2, 1, 'No', 'No', 'No', 'Yes', 'No', 'Yes', 'Yes', 'Yes');
insert into Catalog (ID_account, title, rating, country, city, price_per_night, type, address, guests, bedrooms, kitchen, parking, wifi, smoking_allowed, pets_allowed, air_conditioning, TV, washing_machine) values (100, 'Affordable Common Room in City', 3.4, 'Indonesia', 'Jarkata', 150, 'Condominium', '36662 Mccormick Pass', 5, 6, 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'No', 'No');
