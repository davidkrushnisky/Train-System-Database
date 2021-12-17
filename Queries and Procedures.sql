-- Pre-run sanitization
 DROP procedure IF EXISTS ListTicketsPurchasedBy;
 DROP procedure IF EXISTS FareTableByRoute;
 DROP procedure IF EXISTS GetTicketsByLastName;
 DROP procedure IF EXISTS TimeTableByArrivalCity;
 DROP procedure IF EXISTS GetReceiptByFirstAndLastName;
DROP procedure IF EXISTS GetTripInfoByTripNb;

-- Procedure to list all puchases made by a user with his full name as argument
DELIMITER $$
CREATE PROCEDURE ListTicketsPurchasedBy(IN FullName varchar(61))
BEGIN
SELECT Ti.TicketNb, CONCAT(P.FirstName, " ", P.LastName) AS "Passenger name",
Ro.DepartureCity, Ro.ArrivalCity, Tr.TripDate, Tr.DepartureTime, Tr.ArrivalTime,
P.AgeCategory, Ti.Class, Ti.Car, Ti.SeatNb, Ti.Fare
FROM Users U
JOIN Receipts Re ON Re.UserID = U.UserID
JOIN Tickets Ti ON Ti.ConfirmationNb = Re.ConfirmationNb
JOIN Passengers P ON P.PassengerID = Ti.PassengerID
JOIN Trips Tr ON Tr.TripNb = Ti.TripNb
JOIN Routes Ro ON Ro.RouteID = Tr.RouteID
WHERE CONCAT(U.FirstName, " ", U.LastName) = 'Sina Kooshesh';
END$$
DELIMITER ;
-- CALL GetTicketsPurchasedBy('Sina Kooshesh');

-- Procedure to list fare table for a specific route with departure city and arrival city as argument
DELIMITER $$
CREATE PROCEDURE FareTableByRoute(IN DC varchar(30), IN AC varchar(30))
BEGIN
select DepartureCity,ArrivalCity,Class,AgeCategory,Price
from Fare F join Routes R on F.RouteID=R.RouteID
where R.DepartureCity=DC and R.ArrivalCity=AC;
END$$
DELIMITER ;
-- CALL FareTableByRoute('Montreal','Toronto');

-- Procedure to list a passenger's tickets with his last name as argument
DELIMITER $$
CREATE PROCEDURE GetTicketsByLastName(IN lname varchar(30))
BEGIN
select T.TicketNb,P.PassengerID,P.FirstName,P.LastName,P.AgeCategory,T.Class,T.TripNb,
Car, SeatNb, TrainNb,DepartureCity,ArrivalCity,Fare,TripDate,DepartureTime,ArrivalTime
from Tickets T join Passengers P on T.PassengerID=P.PassengerID
join Trips TR on T.TripNb=TR.TripNb
join Routes R on R.RouteID=TR.RouteID
where P.LastName = lname;
END$$
DELIMITER ;
-- CALL GetTicketsByLastName('Krushnisky');

-- Procedure to list the trains arriving to a city passed as argument
DELIMITER $$
CREATE PROCEDURE TimeTableByArrivalCity(IN city varchar(30))
BEGIN
select DepartureCity, ArrivalCity, TripDate, DepartureTime, ArrivalTime, TrainNb
from Trips TR join Routes R on R.RouteID =TR.RouteID
where ArrivalCity = city
ORDER BY TripDate, DepartureTime;
END$$
DELIMITER ;
-- CALL TimeTableByArrivalCity('Montreal');

-- Procedure to list the trains departing from a city passed as argument
DELIMITER $$
CREATE PROCEDURE TimeTableByDepartureCity(IN city varchar(30))
BEGIN
select DepartureCity, ArrivalCity, TripDate, DepartureTime, ArrivalTime, TrainNb
from Trips TR join Routes R on R.RouteID =TR.RouteID
where DepartureCity = city
ORDER BY TripDate, DepartureTime;
END$$
DELIMITER ;
-- CALL TimeTableByDepartureCity('Montreal');

-- Procedure to add a new user
DELIMITER $$
CREATE PROCEDURE AddNewUser(
IN id INT,
in fname varchar(30),
in lname  varchar(30),
in email  VARCHAR(100),
in pass VARCHAR(30),
in subsc CHAR(3),
in PostalC CHAR(6),
in Provin	VARCHAR(50),
in Country	VARCHAR(50)	,
in PhoneN	VARCHAR(12)	
)
BEGIN
Insert INTO Users Values (id,fname,lname,email,pass,subsc,PostalC,Provin,Country,PhoneN);
END$$
DELIMITER ;
-- CALL AddNewUser('1020','Anne','Dupont','a.dupont@gmail.com','dgb4sr6bfgb','no','D4K5J3','BRITISH COLUMBIA','CANADA','345-546-9746');

-- Procedure to generate receipts
DELIMITER $$
CREATE PROCEDURE `GetReceiptByFirstAndLastName`(in FullName varchar(61))
BEGIN
Select r.ConfirmationNb, u.FirstName, u.LastName, ts.TripNb, tr.TrainNb, tr.TripDate, Routes.DepartureCity, tr.DepartureTime, Routes.ArrivalCity, 
tr.ArrivalTime, tn.Carrier, ts.TicketNb, p.FirstName, p.LastName, p.AgeCategory, ts.Class, ts.Fare, r.TotalFare, r.PaymentMethod, r.ReceiptDate
From Receipts r join Users u on r.UserID = u.UserID
join Tickets ts on r.ConfirmationNb = ts.ConfirmationNb
join Trips tr on ts.TripNb = tr.TripNb
join Routes on tr.RouteID = Routes.RouteID
join Trains tn on tr.TrainNb=tn.TrainNb
join Passengers p on ts.PassengerID=p.PassengerID
where concat(u.FirstName, " ", u.LastName) = FullName;
END$$
DELIMITER ;
-- Example: Donette Foller

--Procedure to get information on a trip by passing trip Number
DELIMITER $$
CREATE PROCEDURE `GetTripInfoByTripNb` (TripNumber char(10))
BEGIN
select TripNb, TrainNb, TripDate, DepartureCity, DepartureTime, ArrivalCity, ArrivalTime
From Trips t join Routes r on t.RouteID=r.RouteID
where TripNb = TripNumber;
END$$
DELIMITER ;