-- Pre-run sanitization
/*
DELETE FROM Users;
DELETE FROM Receipts;
DELETE FROM Tickets;
DELETE FROM Passengers;
DELETE FROM Trips;
DELETE FROM Fare;
DELETE FROM Routes;
DELETE FROM Trains;
DELETE FROM AvailableSeats;
*/
-- Populate Tables
/*
INSERT INTO Routes
VALUES
	('TM','TORONTO','MONTREAL'),
	('TO','TORONTO','OTTAWA'),
	('TQ','TORONTO','QUEBEC CITY'),
	('TW','TORONTO','WINDSOR'),
	('TK','TORONTO','KINGSTON'),
	('TS','TORONTO','SARINA'),
	('TL','TORONTO','LONDON'),
	('TN','TORONTO','NIAGARA FALLS'),
	('OT','OTTAWA','TORONTO'),
	('OQ','OTTAWA','QUEBEC CITY'),
	('OM','OTTAWA','MONTREAL'),
	('OK','OTTAWA','KINGSTON'),
	('MT','MONTREAL','TORONTO'),
	('MQ','MONTREAL','QUEBEC CITY'),
	('MO','MONTREAL','OTTAWA');

INSERT INTO Trains (TrainNb,Capacity)
VALUES
	('1','90'),
	('2','90'),
	('3','90'),
	('4','90'),
	('5','90'),
	('6','90'),
	('7','90'),
	('8','90'),
	('9','90'),
	('10','90'),
	('11','90'),
	('12','90'),
	('13','90'),
	('14','90'),
	('15','90'),
	('16','90'),
	('17','90'),
	('18','90'),
	('19','90'),
	('20','90'),
	('21','90'),
	('22','90'),
	('23','90');

INSERT INTO Fare
VALUES
	('TM','Business', 'Adult', '200'),
	('TM','Economy', 'Adult', '100'),
	('TM','Business', 'Child', '100'),
	('TM','Economy', 'Child', '50'),
	('TO','Business', 'Adult', '160'),
	('TO','Economy', 'Adult', '80'),
	('TO','Business', 'Child', '80'),
	('TO','Economy', 'Child', '40'),
	('TQ','Business', 'Adult', '240'),
	('TQ','Economy', 'Adult', '120'),
	('TQ','Business', 'Child', '120'),
	('TQ','Economy', 'Child', '60'),
	('TW','Business', 'Adult', '140'),
	('TW','Economy', 'Adult', '70'),
	('TW','Business', 'Child', '70'),
	('TW','Economy', 'Child', '35'),
	('TK','Business', 'Adult', '140'),
	('TK','Economy', 'Adult', '70'),
	('TK','Business', 'Child', '70'),
	('TK','Economy', 'Child', '35'),
	('TN','Business', 'Adult', '100'),
	('TN','Economy', 'Adult', '50'),
	('TN','Business', 'Child', '50'),
	('TN','Economy', 'Child', '25'),
	('TS','Business', 'Adult', '136'),
	('TS','Economy', 'Adult', '68'),
	('TS','Business', 'Child', '68'),
	('TS','Economy', 'Child', '34'),
	('TL','Business', 'Adult', '100'),
	('TL','Economy', 'Adult', '50'),
	('TL','Business', 'Child', '50'),
	('TL','Economy', 'Child', '25'),
	('OT','Business', 'Adult', '160'),
	('OT','Economy', 'Adult', '80'),
	('OT','Business', 'Child', '80'),
	('OT','Economy', 'Child', '40'),
	('OQ','Business', 'Adult', '160'),
	('OQ','Economy', 'Adult', '80'),
	('OQ','Business', 'Child', '80'),
	('OQ','Economy', 'Child', '40'),
	('OM','Business', 'Adult', '100'),
	('OM','Economy', 'Adult', '50'),
	('OM','Business', 'Child', '50'),
	('OM','Economy', 'Child', '25'),
	('OK','Business', 'Adult', '100'),
	('OK','Economy', 'Adult', '50'),
	('OK','Business', 'Child', '50'),
	('OK','Economy', 'Child', '25'),
	('MT','Business', 'Adult', '200'),
	('MT','Economy', 'Adult', '100'),
	('MT','Business', 'Child', '100'),
	('MT','Economy', 'Child', '50'),
	('MQ','Business', 'Adult', '120'),
	('MQ','Economy', 'Adult', '60'),
	('MQ','Business', 'Child', '60'),
	('MQ','Economy', 'Child', '30'),
	('MO','Business', 'Adult', '100'),
	('MO','Economy', 'Adult', '50'),
	('MO','Business', 'Child', '50'),
	('MO','Economy', 'Child', '25');

INSERT INTO Users
VALUES 
	('1001','Sina','Kooshesh','SinaKooshesh@yahoo.ca','851segljns4','yes','G5H4K5','QUEBEC','CANADA','438-556-7845'),
	('1002','Allan','Sherwood','Allaherwood@gmail.com','rgd84g8dh','yes','S1D2G1','QUEBEC','CANADA','514-784-9642'),
	('1003','Barry','Zimmer','BarryZimmer@yahoo.com','wtjdvh574','no','L5R4D2','QUEBEC','CANADA','514-784-6982'),
	('1004','Mehdi','Aqdim','MehdiAqdim@gmail.com','ajgdhb658','yes','W1F4H5','QUEBEC','CANADA','438-624-3645'),
	('1005','Christine','Christine','ChristineChrist@hotmail.fr','ahfvc5454','yes','A3D4F5','ONTARIO','CANADA','647-326-4578'),
	('1006','David','Krushnisky','DavidKrushnisky@gmail.com','698s4ghf','yes','H7J9K7','ONTARIO','CANADA','647-894-1236'),
	('1007','David','Goldstein','DavidGoldstein@yahoo.com',',mhfb5445','yes','D4H6K9','ONTARIO','CANADA','647-459-3265'),
	('1008','Erin','Valentino','EriValentino@yahoo.com','nhfv6522hef','yes','X4C5V6','NEW BRUNSWIK','CANADA','661-456-9874'),
	('1009','Frank Lee','Wilson','FrankWilson@gmail.com','gndv35','yes','B6N7M8','QUEBEC','CANADA','438-457-3491'),
	('1010','Gary','Hernandez','GaryHernandez@yahoo.com','ahwtdgv351','yes','Z4X5C6','QUEBEC','CANADA','541-369-8521'),
	('1011','Heather','Esway','HeatherEsway@gmail.com','ythwgdvc965','yes','M8B7V5','QUEBEC','CANADA','514-753-9514'),
	('1012','James','Butt','JamesButt@yahoo.ca','5ejfbhc5','yes','Q4W5R6','NEW BRUNSWIK','CANADA','662-741-8523'),
	('1013','Josephine','Darakjy','JosephineDarkjy@yahoo.mx','agvdh52444','yes','J8G6F5','NEW BRUNSWIK','CANADA','662-842-8624'),
	('1014','Lenna','Paprocki','LennaPaprocki@hotmail.es','aeyfvchmdjzc','no','M8G7F5','ONTARIO','CANADA','666-789-4512'),
	('1015','Donette','Foller','DonetteFoller@yahoo.ca','uygf57r!','no','A4D6B7','ONTARIO','CANADA','647-123-4569'),
	('1016','Simona','Morasca','simona@yahoo.com','gndv35','yes','X4V5B7','ONTARIO','CANADA','646-743-9542'),
	('1017','Mitsue','Tollner','Tollner@gmail.com','eytdhfvzjh6','yes','C6V7B7','ONTARIO','CANADA','647-879-6541'),
	('1018','Kris','Marrier','marrier@yahoo.fr','asthcjvhjzd','yes','Q3E5F6','QUEBEC','CANADA','438-159-4873');

INSERT INTO Passengers
VALUES
	('10001','Sina', 'Kooshesh', 'Adult'),
	('10002','Allan', 'Sherwood', 'Adult'),
	('10003','Barry', 'Zimmer', 'Adult'),
	('10004','Mehdi', 'Aqdim', 'Adult'),
	('10005','Christine', 'Christine', 'Adult'),
	('10006','David', 'Krushnisky', 'Adult'),
	('10007','David', 'Goldstein', 'Child'),
	('10008','Erin', 'Valentino', 'Child'),
	('10009','Frank Lee', 'Wilson', 'Adult'),
	('10010','Gary', 'Hernandez', 'Adult'),
	('10011','Heather', 'Esway', 'Adult'),
	('10012','James', 'Butt', 'Adult'),
	('10013','Josephine', 'Darakjy', 'Adult'),
	('10014','Lenna', 'Paprocki', 'Child'),
	('10015','Donette', 'Foller', 'Adult'),
	('10016','Simona', 'Morasca', 'Adult'),
	('10017','Mitsue', 'Tollner', 'Child'),
	('10018','Kris', 'Marrier', 'Adult'),
	('10019','Abel', 'Maclead', 'Adult'),
	('10020','Kiley', 'Caldarera', 'Adult'),
	('10021','Graciela', 'Ruta', 'Adult'),
	('10022','Cammy', 'Albares', 'Adult'),
	('10023','Mattie', 'Poquette', 'Adult'),
	('10024','Meaghan', 'Garufi', 'Child'),
	('10025','Gladys', 'Rim', 'Adult'),
	('10026','Yuki', 'Whobrey', 'Adult'),
	('10027','Fletcher', 'Flosi', 'Child'),
	('10028','Bette', 'Nicka', 'Adult'),
	('10029','Veronika', 'Inouye', 'Adult'),
	('10030','Willard', 'Kolmetz', 'Adult'),
	('10031','Maryann', 'Royster', 'Child'),
	('10032','Alisha', 'Slusarski', 'Child');

INSERT INTO Receipts (ConfirmationNb,UserID,PaymentMethod,ReceiptDate)
VALUES
	('YXG619','1001','MasterCard','2021-02-07'),
	('MIO987','1002','Visa','2020-11-08'),
	('HEY890','1003','Interac','2021-02-09'),
	('LEA879','1004','MasterCard','2021-02-10'),
	('SIS567','1005','American Express','2020-05-11'),
	('MIA678','1006','Cash','2021-06-12'),
	('NCA908','1007','Visa','2021-12-13'),
	('WHY789','1008','MasterCard','2020-08-14'),
	('QUI908','1009','MasterCard','2021-01-15'),
	('WHO789','1010','Visa','2021-10-16'),
	('PIP123','1011','Cash','2021-02-17'),
	('REM567','1012','MasterCard','2021-04-18'),
	('TRD890','1013','Interac','2021-08-19'),
	('BRO687','1014','MasterCard','2021-07-20'),
	('MAX699','1015','Interac','2021-03-21'),
	('LOT098','1016','Interac','2020-09-22'),
	('TRE345','1017','Cash','2021-10-23'),
	('YES987','1018','Cash','2020-05-24'),
	('OUI987','1001','MasterCard','2021-05-24'),
	('NON345','1002','Visa','2021-09-08');

INSERT INTO Trips (TripNb,RouteID,TrainNb,TripDate,DepartureTime,ArrivalTime)
VALUES 
    ('MT12162108','MT','1','2021-12-16','08:00:00','15:00:00'),
    ('MT12162110','MT','3','2021-12-16','10:00:00','17:00:00'),
    ('MT12162112','MT','7','2021-12-16','12:00:00','19:00:00'),
    ('MT12162114','MT','8','2021-12-16','14:00:00','21:00:00'),
    ('MO12162110','MO','2','2021-12-16','10:00:00','13:00:00'),
    ('MO12162112','MO','4','2021-12-16','12:00:00','15:00:00'),
    ('MO12162114','MO','5','2021-12-16','14:00:00','17:00:00'),
    ('MQ12162109','MQ','9','2021-12-16','09:00:00','12:30:00'),
    ('MQ12162111','MQ','12','2021-12-16','11:00:00','14:30:00'),
    ('MQ12162115','MQ','10','2021-12-16','15:00:00','18:30:00'),
    ('TM12172108','TM','11','2021-12-17','08:00:00','15:00:00'),
    ('TQ12182108','TQ','13','2021-12-18','08:00:00','19:00:00'),
    ('TM12192112','TM','15','2021-12-19','12:00:00','19:00:00'),
    ('TO12202109','TO','14','2021-12-20','09:00:00','13:30:00'),
    ('TK12212109','TK','17','2021-12-21','09:00:00','11:30:00'),
    ('TL12222108','TL','18','2021-12-22','08:00:00','10:20:00'),
    ('TL12232112','TL','16','2021-12-23','12:00:00','14:45:00'),
    ('TN12242109','TN','19','2021-12-24','09:00:00','11:45:00'),
    ('TW12252108','TW','23','2021-12-25','08:00:00','12:30:00'),
    ('OQ12262108','OQ','6','2021-12-26','08:00:00','13:45:00'),
    ('OM12272109','OM','20','2021-12-27','09:00:00','12:00:00'),
    ('OT12272108','OT','21','2021-12-28','08:00:00','12:30:00'),
    ('OK12292111','OK','22','2021-12-29','11:00:00','13:00:00');

INSERT INTO AvailableSeats
VALUES
    ('MT12162108','Business','30'),
	('MT12162108','Economy','60'),
	('MT12162110','Business','30'),
	('MT12162110','Economy','60'),
	('MT12162112','Business','30'),
	('MT12162112','Economy','60'),
	('MT12162114','Business','30'),
	('MT12162114','Economy','60'),
	('MO12162110','Business','30'),
	('MO12162110','Economy','60'),
	('MO12162112','Business','30'),
	('MO12162112','Economy','60'),
	('MO12162114','Business','30'),
	('MO12162114','Economy','60'),
	('MQ12162109','Business','30'),
	('MQ12162109','Economy','60'),
	('MQ12162111','Business','30'),
	('MQ12162111','Economy','60'),
	('MQ12162115','Business','30'),
	('MQ12162115','Economy','60'),
	('TM12172108','Business','30'),
	('TM12172108','Economy','60'),
	('TQ12182108','Business','30'),
	('TQ12182108','Economy','60'),
	('TM12192112','Business','30'),
	('TM12192112','Economy','60'),
	('TO12202109','Business','30'),
	('TO12202109','Economy','60'),
	('TK12212109','Business','30'),
	('TK12212109','Economy','60'),
	('TL12222108','Business','30'),
	('TL12222108','Economy','60'),
	('TL12232112','Business','30'),
	('TL12232112','Economy','60'),
	('TN12242109','Business','30'),
	('TN12242109','Economy','60'),
	('TW12252108','Business','30'),
	('TW12252108','Economy','60'),
	('OQ12262108','Business','30'),
	('OQ12262108','Economy','60'),
	('OM12272109','Business','30'),
	('OM12272109','Economy','60'),
	('OT12272108','Business','30'),
	('OT12272108','Economy','60'),
	('OK12292111','Business','30'),
	('OK12292111','Economy','60');

="INSERT INTO Tickets VALUES ('"&A3&"','"&B3&"','"&C3&"','"&D3&"','"&E3&"','"&F3&"','"&G3&"',(SELECT Fare FROM Fare F JOIN Passengers P ON P.PassengerID = F.PassengerID WHERE F.RouteID = LEFT("&D3&",2) AND F.Class = "&E3&" AND  F.AgeCategory = P.AgeCategory));"
*/
/*
INSERT INTO Tickets VALUES ('109876543','YXG619','10001','MT12162108','Economy','4','48','0');
INSERT INTO Tickets VALUES ('126354756','MIO987','10002','MT12162108','Business','1','5','0');
INSERT INTO Tickets VALUES ('987645678','HEY890','10003','MT12162108','Business','1','6','0');
INSERT INTO Tickets VALUES ('719283746','LEA879','10004','MT12162108','Business','2','16','0');
INSERT INTO Tickets VALUES ('983682019','SIS567','10005','MT12162108','Business','2','17','0');
INSERT INTO Tickets VALUES ('293847564','MIA678','10006','MT12162108','Business','2','27','0');
INSERT INTO Tickets VALUES ('124536475','NCA908','10007','MT12162108','Economy','4','44','0');
INSERT INTO Tickets VALUES ('393847561','WHY789','10008','MT12162108','Economy','5','60','0');
INSERT INTO Tickets VALUES ('124343468','QUI908','10009','MT12162108','Economy','6','80','0');
INSERT INTO Tickets VALUES ('347521345','WHO789','10010','MT12162108','Economy','4','46','0');
INSERT INTO Tickets VALUES ('123786432','PIP123','10011','MT12162108','Economy','5','68','0');
INSERT INTO Tickets VALUES ('334567888','REM567','10012','MT12162108','Economy','6','78','0');
INSERT INTO Tickets VALUES ('334674212','TRD890','10013','MT12162108','Economy','4','55','0');
INSERT INTO Tickets VALUES ('543367865','BRO687','10014','MT12162108','Business','1','1','0');
INSERT INTO Tickets VALUES ('334456788','MAX699','10015','MT12162108','Business','2','23','0');
INSERT INTO Tickets VALUES ('446789977','LOT098','10016','MO12162112','Business','1','5','0');
INSERT INTO Tickets VALUES ('654322456','TRE345','10017','MQ12162109','Business','2','22','0');
INSERT INTO Tickets VALUES ('789098765','YES987','10018','TO12202109','Economy','4','43','0');
INSERT INTO Tickets VALUES ('456787698','OUI987','10019','MO12162112','Economy','5','78','0');
INSERT INTO Tickets VALUES ('132453467','NON345','10020','MQ12162109','Economy','4','64','0');
INSERT INTO Tickets VALUES ('768236457','PIP123','10021','TO12202109','Economy','6','89','0');
INSERT INTO Tickets VALUES ('890374578','YXG619','10022','MO12162112','Economy','5','77','0');
INSERT INTO Tickets VALUES ('348712987','YXG619','10023','OQ12262108','Economy','6','85','0');
INSERT INTO Tickets VALUES ('948372934','YES987','10024','TO12202109','Economy','5','70','0');
INSERT INTO Tickets VALUES ('457892134','PIP123','10025','TL12222108','Business','1','7','0');
INSERT INTO Tickets VALUES ('425678564','MAX699','10026','TO12202109','Business','2','21','0');
INSERT INTO Tickets VALUES ('423615243','NON345','10027','OK12292111','Business','1','9','0');
INSERT INTO Tickets VALUES ('362543789','YES987','10028','TM12172108','Business','2','18','0');
INSERT INTO Tickets VALUES ('435671245','YXG619','10029','OQ12262108','Business','2','16','0');
INSERT INTO Tickets VALUES ('57345234','NON345','10030','TL12222108','Economy','4','66','0');
INSERT INTO Tickets VALUES ('736452135','MAX699','10031','TO12202109','Economy','5','77','0');
INSERT INTO Tickets VALUES ('476523765','NON345','10032','MO12162112','Economy','6','88','0');
*/