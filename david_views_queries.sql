--View of David's boarding pass
USE `team05`;
CREATE  OR REPLACE VIEW `BoardingPassDavid` AS
Select TicketNb, p.FirstName, p.LastName, p.AgeCategory, trn.Carrier, trp.TrainNb, t.Class, t.Car, t.SeatNb, 
trp.TripDate, r.DepartureCity, trp.DepartureTime, r.ArrivalCity, trp.ArrivalTime, t.ConfirmationNb
From Tickets t join Passengers p on t.PassengerID = p.PassengerID
join Trips trp on t.TripNb = trp.TripNb
join Routes r on trp.RouteID = r.RouteID
join Trains trn on trp.TrainNb = trn.TrainNb
where p.FirstName = 'David' and p.LastName = 'Krushnisky'

--Procedure to generate receipts
USE `team05`;
DROP procedure IF EXISTS `GetReceiptByFirstAndLastName`;

DELIMITER $$
USE `team05`$$
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

--View of all users without receipts 
USE `team05`;
CREATE  OR REPLACE VIEW `UsersWithNoReceipt` AS
Select u.UserID, FirstName, LastName, Email, PostalCode, Province, Country, PhoneNumber
From Users u left join Receipts r on u.UserID = r.UserID
where ConfirmationNb is null;

