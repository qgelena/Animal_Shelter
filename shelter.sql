CREATE	TABLE	ADOPTION_CENTER
(
    id VARCHAR(15)	NOT NULL,
    name VARCHAR(50),
    City_name VARCHAR(45) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Hours VARCHAR(100) NOT NULL,
    Contact VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE	TABLE	EMPLOYEE
(
    id	VARCHAR(15)	NOT NULL,
    Fname VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Phone_No VARCHAR(30) NOT NULL,
    Salary INT NOT NULL,
    Adoption_center_id VARCHAR(15) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (Adoption_center_id) REFERENCES ADOPTION_CENTER(id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ANIMAL
(
    id VARCHAR(15) NOT NULL,
    Animal_name VARCHAR(45),
    Cage_Number INT NOT NULL, 
    Date_taken_in DATE NOT NULL,
    Adoption_center_id VARCHAR(15) NOT NULL,
    Temporary_adopter_id VARCHAR(15),
    PRIMARY KEY(id),
    FOREIGN KEY(Adoption_center_id) REFERENCES Adoption_center(id),
    FOREIGN KEY(Temporary_adopter_id) REFERENCES TEMPORARY_ADOPTER(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ANIMAL_DETAIL
(
    Animal_id VARCHAR(15) NOT NULL,
    Animal_gender VARCHAR(10),
    HeightCM INT,
    WeightG INT,
    AgeWhenTakenIn INT,
    Diet VARCHAR(30) NOT NULL,
    Feed_Time VARCHAR(30) NOT NULL,
    Neutered INT,
    Breed_name VARCHAR(45),
    Species_name VARCHAR(45),
    PRIMARY KEY(Animal_id),
    FOREIGN KEY (Animal_id) REFERENCES ANIMAL(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Diet = 'Carnivore' OR Diet = 'Herbivore' OR Diet = 'Omnivore')
);

CREATE TABLE TEMPORARY_ADOPTER
(
    id VARCHAR(15) NOT NULL,
    Fname VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    PRIMARY KEY	(id)
);


CREATE TABLE ADOPTER
(
    id	VARCHAR(15)	NOT NULL,
    Fname VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Phone_No VARCHAR(30) NOT NULL,
    Date_of_birth DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE APPLICATION
(
    id VARCHAR(15)  NOT NULL,
    Animal_id VARCHAR(15) NOT NULL,
    Adopter_id VARCHAR(15) NOT NULL,
    Adoption_status VARCHAR(45) NOT NULL,
    Application_date DATE NOT NULL,
    PRIMARY KEY(id) 
    FOREIGN KEY (Animal_id) REFERENCES ANIMAL(id), 
    FOREIGN KEY (Adopter_id) REFERENCES ADOPTER(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ADOPTION_EVENT
(
    id VARCHAR(15) NOT NULL,
    Event_date DATE,
    Employee_id VARCHAR(15) NOT NULL,
    Application_id VARCHAR(15) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (Employee_id) REFERENCES EMPLOYEE(id),
    FOREIGN KEY (Application_id) REFERENCES APPLICATION(id)
);

CREATE TABLE DONATOR
(
    id VARCHAR(15) NOT NULL,
    Fname VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
    Credit_Card_Info VARCHAR(100) DEFAULT NULL,
    Email VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE DONATION
(
    id	VARCHAR(15)	NOT NULL,
    Donator_id VARCHAR(15)	NOT NULL,
    Adoption_center_id VARCHAR(15) NOT NULL,
    Amount INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(Donator_id) REFERENCES DONATOR(id), 
    FOREIGN KEY(Adoption_center_id) REFERENCES ADOPTION_CENTER(id)
);
