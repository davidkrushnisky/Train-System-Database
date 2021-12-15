--Pre-run snitization

alter table receipt drop constraint if exists receipt_UserID_fk;
alter table ticket drop constraint if exists ticket_ConfirmationNb_fk
alter table ticket drop constraint if exists ticket_ConfirmationNb_fk
alter table ticket drop constraint if exists ticket_TripNb_fk
alter table trip drop constraint if exists trip_routeID_fk
alter table trip drop constraint if exists trip_trainNb_fk
alter table fare drop constraint if exists fare_TripNb_fk

DROP table if exists user;
DROP table if exists receipt;
DROP table if exists ticket;
DROP table if exists passenger;
DROP table if exists trip;
DROP table if exists fare;
DROP table if exists train;
DROP table if exists routes;

--create the tables

Create table user (
    UserID        varchar(20),                              
    FirstName     varchar(20)    Not Null,
    LastName      varchar(20)    Not Null,
    Email         varchar(30)    Not Null       Unique,
    UserPassword  varchar(20)    Not Null,
    Subscription  varchar(3),
    PostalCode    char(6)        Not Null,
    Province      varchar(15)    Not Null,
    Country       varchar(15)    Not Null,
    PhoneNumber   varchar(12)    Not Null,
    constraint user_UserID_pk Primary Key (UserID),
    constraint chk_user check (Subscription='Yes' or Subscription='No')
);

create table receipt (
    ConfirmationNb char(6) ,
    UserID         varchar(20),       
    TotalFare      money        not null, 
    PaymentMethod  varchar(20),    
    ReceiptDate    date         not null,
    constraint receipt_ConfirmationNb_pk primary key (ConfirmationNb),
    constraint receipt_UserID_fk foreign key (UserID) references user(UserID),
    constraint chk_receipt check (PaymentMethod in ('Mastercard', 'Visa', 'Interac', 'American Express'))
);

create table ticket (
    TicketNb        int,
    ConfirmationNb  char(6),
    PassengerID     int          identity,
    TripNb          char(10)     
    Class           varchar(8)   not null,
    Car             smallint,
    SeatNb          smallint,
    constraint ticket_TicketNb_pk primary key (TicketNb),
    constraint ticket_ConfirmationNb_fk foreign key (ConfirmationNb) references receipt(ConfirmationNb),
    constraint ticket_PassengerID_fk foreign key (PassengerID) references passenger(PassengerID),
    constraint ticket_TripNb_fk foreign key (TripNb) references trip(TripNb),
    constraint chk_ticket check (Class in ('Economy', 'Business'))
);

create table passenger (
    PasssengerID  int(100)          identity,
    FirstName     varchar(15),
    LastName      varchar(20),
    AgeCategory   varchar(20),
    constraint passenger_PassengerID_pk primary key (PassengerID),
    constraint chk_passenger check (AgeCategory in ('Adult', 'Child')
);

create table trip (
    tripNb          char(10),
    routeID         int          identity,
    trainNb         decimal(4),
    TripDate        date         not null,
    departureTime   time         not null,
    ArrivalTime     time         not null,
    constraint trip_tripNb_pk primary key (TripNb),
    constraint trip_routeID_fk foreign key (routeID) references routes(routeID),
    constraint trip_trainNb_fk foreign key (trainNb) references train(trainNb)
);

create table fare (
    TripNb              char(10),     
    Class               varchar(8)    not null,
    AgeCategory         varchar(5)    not null,
    NbOfAvailableSeats  decimal(3)    not null,
    Fare                money         not null,
    constraint pk_fare primary key (tripNb, Class, AgeCategory)
    constraint fare_TripNb_fk foreign key (TripNb) references trip(tripNb),
    constraint chk_fare check (Class in ('Economy', 'Business')),
    constraint chk_fare check (AgeCategory in ('Adult', 'Child')
);

create table train (
    TrainNb    decimal(4),
    Carrier    char(8)           not null    default 'Via Rail',
    Capacity   decimal(3)        not null,
    constraint train_TrainNb_pk primary key (TrainNb)
)

create table routes (
    routeID         int  identity,
    departureCity   varchar(15)          not null,
    arrivalCity     varchar(15)          not null,
    constraint routes_routeID_pk primary key (routeID)
)