DROP SCHEMA test;

CREATE SCHEMA test;

CREATE TABLE test.phonebook(phone VARCHAR(32), firstname VARCHAR(32), lastname VARCHAR(32), address VARCHAR(64));

INSERT INTO test.phonebook (phone, firstname, lastname, address) VALUES('+1 000 000 001', 'John', 'Doe', 'FL');
INSERT INTO test.phonebook (phone, firstname, lastname, address) VALUES('+1 000 000 002', 'Alex', 'Marx', 'CA');
INSERT INTO test.phonebook (phone, firstname, lastname, address) VALUES('+1 000 000 003', 'Charles', 'Brown', 'NY');
INSERT INTO test.phonebook (phone, firstname, lastname, address) VALUES('+1 000 000 004', 'Diana', 'Blue', 'CA');