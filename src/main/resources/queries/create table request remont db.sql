CREATE TABLE roles(
	id int primary key generated always as identity,
	name varchar(1000)
);

CREATE TABLE users(
	id int primary key generated always as identity,
	last_name varchar(1000),
	first_name varchar(1000),
	middle_name varchar(1000),
	login varchar(1000),
	password varchar(1000),
	role_id int,
	FOREIGN KEY (role_id) REFERENCES roles(id)
);
CREATE TABLE statuses_request (
	id int primary key generated always as identity,
	name varchar(1000)
);

CREATE TABLE prioritets (
	id int primary key generated always as identity,
	name varchar(1000)
);

CREATE TABLE type_of_malfunctions (
	id int primary key generated always as identity,
	name varchar(1000)
);

CREATE TABLE cause_of_malfunctions (
	id int primary key generated always as identity,
	name varchar(1000)
);

CREATE TABLE statuses_remont (
	id int primary key generated always as identity,
	name varchar(1000)
);
CREATE TABLE statuses_equipment (
	id int primary key generated always as identity,
	name varchar(1000)
);
CREATE TABLE types_equipment (
	id int primary key generated always as identity,
	name varchar(1000)
);
CREATE TABLE materials (
	id int primary key generated always as identity,
	name varchar(1000),
	description varchar(1000),
	price varchar(1000)
);

CREATE TABLE remonts (
	id int primary key generated always as identity,
	name varchar(1000),
	description varchar(1000),
	time_remont time,
	price_of_remont int,
	status_remont_id int,
	cause_of_malfunction_id int,
	FOREIGN KEY (status_remont_id) REFERENCES statuses_remont(id),
	FOREIGN KEY (cause_of_malfunction_id) REFERENCES cause_of_malfunctions(id)
);

CREATE TABLE materials_remonts (
	id int primary key generated always as identity,
	remont_id int,
	material_id int,
	FOREIGN KEY (remont_id) REFERENCES remonts(id),
	FOREIGN KEY (material_id) REFERENCES materials(id)
);

CREATE TABLE equipments (
	id int primary key generated always as identity,
	name varchar(1000),
	description varchar(1000),
	type_equipment_id int, 
	serial_number varchar(1000),
	date_of_purchase date,
	date_of_last_repair date,
	status_of_equipment_id int,
	remont_id int,
	other varchar(1000),
	FOREIGN KEY (type_equipment_id) REFERENCES types_equipment(id),
	FOREIGN KEY (status_of_equipment_id) REFERENCES statuses_equipment(id),
	FOREIGN KEY (remont_id) REFERENCES remonts(id)
);
CREATE TABLE requests (
	id int primary key generated always as identity,
	date_update date,
	equipment_id int,
	type_of_malfunction_id int,
	description_of_problem varchar(1000),
	user_id int,
	prioritet_id int,
	status_request_id int,
	FOREIGN KEY (equipment_id) REFERENCES equipments(id),
	FOREIGN KEY (type_of_malfunction_id) REFERENCES type_of_malfunctions(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (prioritet_id) REFERENCES prioritets(id),
	FOREIGN KEY (status_request_id) REFERENCES statuses_request(id)
);