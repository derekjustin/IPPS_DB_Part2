--
-- CS 3810 - Principles of Database Systems - Fall 2019
-- DBA03: The "ipps" database
-- Date: 11/3/2019
-- Name(s): DEREK HOLSAPPLE, JUSTIN STRELKA
--

-- create database
CREATE DATABASE ipps2;

-- use database
USE ipps2;

-- create table DRGs
CREATE TABLE DRGs (
  drgCode INT NOT NULL PRIMARY KEY,
  drgDesc VARCHAR(70) NOT NULL
);

-- create table HRRs
CREATE TABLE HRRs (
  hrrId INT NOT NULL PRIMARY KEY,
  hrrState CHAR(2) NOT NULL,
  hrrName VARCHAR(25) NOT NULL
);

-- create table Providers
CREATE TABLE Providers (
  prvId INT NOT NULL PRIMARY KEY,
  prvName VARCHAR(50) NOT NULL,
  prvAddr VARCHAR(50),
  prvCity VARCHAR(20),
  prvState CHAR(2),
  prvZip INT,
  hrrId INT NOT NULL,
  FOREIGN KEY (hrrId) REFERENCES HRRs (hrrId)
);

-- create table ChargesAndPayments
CREATE TABLE ChargesAndPayments (
  prvId INT NOT NULL,
  drgCode INT NOT NULL,
  PRIMARY KEY (prvId, drgCode),
  FOREIGN KEY (prvId) REFERENCES Providers (prvId),
  FOREIGN KEY (drgCode) REFERENCES DRGs (drgCode),
  totalDischarges INT NOT NULL,
  avgCoveredCharges DECIMAL(10, 2) NOT NULL,
  avgTotalPayments DECIMAL(10, 2) NOT NULL,
  avgMedicarePayments DECIMAL(10, 2) NOT NULL
);

-- populate table DRGs
LOAD DATA INFILE 'DRGs.csv' INTO TABLE DRGs FIELDS TERMINATED BY ',' ENCLOSED BY '"';

-- populate table HRRs
LOAD DATA INFILE 'HRRs.csv' INTO TABLE HRRs FIELDS TERMINATED BY ',' ENCLOSED BY '"';

-- populate table Providers
LOAD DATA INFILE 'Providers.csv' INTO TABLE Providers FIELDS TERMINATED BY ',' ENCLOSED BY '"';

-- populate table ChargesAndPayments
LOAD DATA INFILE 'ChargesAndPayments.csv' INTO TABLE ChargesAndPayments FIELDS TERMINATED BY ',' ENCLOSED BY '"';

-- TODO: answer the following queries

-- a) List all diagnostic names in alphabetical order (no repetition).
SELECT drgDesc AS "Diagnostic Name" FROM drgs GROUP BY drgDesc ORDER BY drgDesc ASC;


-- b) List the names and correspondent states of all of the providers 
--    in alphabetical order (state first, provider name next, no repetition).



-- c) List the number of (distinct) providers.



-- d) List the number of (distinct) providers per state in alphabetical 
--    order (also printing out the state).



-- e) List the number of (distinct) hospital referral regions (HRR).



-- f) List the number (distinct) of HRRs per state (also printing out the state).



-- g) List all of the (distinct) providers in the state of Pennsylvania 
--    in alphabetical order.



-- h) List the top 10 providers (with their correspondent state) that charged the most for 
--    the clinical condition with code 308. Output should display the provider, their state, 
--    and the average charged amount in descending order.



-- i) List the average charges of all providers per state for the clinical condition with 
--    code 308. Output should display the state and the average charged amount per state in 
--    descending order (of the charged amount) using only two decimals.



-- j) Which hospital and clinical condition pair had the highest difference between the 
--    amount charged and the amount covered by health insurance?
