create view BoardingPassDavid as 
Select TicketNb, p.FirstName, p.LastName, p.AgeCategory, trn.Carrier, trp.TrainNb, t.Class, t.Car, t.SeatNb, 
trp.TripDate, r.DepartureCity, trp.DepartureTime, r.ArrivalCity, trp.ArrivalTime, t.ConfirmationNb
From Tickets t join Passengers p on t.PassengerID = p.PassengerID
join Trips trp on t.TripNb = trp.TripNb
join Routes r on trp.RouteID = r.RouteID
join Trains trn on trp.TrainNb = trn.TrainNb
where p.FirstName = 'David' and p.LastName = 'Krushnisky'
