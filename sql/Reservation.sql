create table Reservation (
	ID_place BIGINT REFERENCES Catalog(ID_place),
	ID_guest INT REFERENCES Account(ID),
	number_of_guests INT NOT NULL,
	checkin_date DATE NOT NULL CHECK (checkin_date > '2022-04-03'),
	checkout_date DATE NOT NULL CHECK (checkout_date > checkin_date)
);
insert into Reservation (ID_place, ID_guest, number_of_guests, checkin_date, checkout_date) values (1, 73, 3, '2023-03-13', '2023-03-19');
insert into Reservation (ID_place, ID_guest, number_of_guests, checkin_date, checkout_date) values (4, 80, 2, '2022-11-01', '2022-11-11');
insert into Reservation (ID_place, ID_guest, number_of_guests, checkin_date, checkout_date) values (7, 2, 5, '2022-05-04', '2022-07-03');
