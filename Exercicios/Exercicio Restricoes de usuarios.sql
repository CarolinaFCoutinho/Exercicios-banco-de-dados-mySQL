/*Carolina de Faria Coutinho PT3009718*/
/*Ex 2*/

CREATE TABLE company /*Ex 3*/
	(company_name varchar(80) not null,
	city varchar(80),
	PRIMARY KEY (company_name)
	);

CREATE TABLE employee /*Ex 4*/
	(person_name varchar(80) NOT NULL,
	street varchar(80),
	city varchar(80),
	PRIMARY KEY (person_name)
	);

CREATE TABLE manages /*Ex 5*/
	(person_name varchar(80) NOT NULL,
	manager_name varchar(80),
	PRIMARY KEY (person_name),
	FOREIGN KEY (person_name) REFERENCES employee(person_name)/*Ex 8*/
		on delete cascade
		on update CASCADE,	
	FOREIGN KEY (manager_name) REFERENCES employee(person_name)/*Ex 9*/
		on delete cascade
		on update cascade
	);

CREATE TABLE works /*Ex 6*/
	(person_name varchar(80) NOT NULL,
	company_name varchar(80),
	salary numeric(8,2) check(salary > 0),
	PRIMARY KEY (person_name),
	FOREIGN KEY (person_name) REFERENCES employee(person_name)/*Ex 7*/
		on delete cascade
		on update cascade,
	FOREIGN KEY (company_name) REFERENCES company(company_name)
		on delete cascade
		on update cascade
	);



















