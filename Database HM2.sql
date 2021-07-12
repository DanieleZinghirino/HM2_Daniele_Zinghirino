create database homework2;
use homework2;

CREATE TABLE Gyms(
         ID integer primary key auto_increment,
         name varchar(20));    
CREATE TABLE Directors(
         ID integer primary key auto_increment,
         name varchar(20),
         surname varchar(20),
         birth date);
CREATE TABLE Offices(
         ID integer primary key auto_increment,
         gym_id integer,
         city varchar(20),
         address varchar(50),
         director_id integer,
         foreign key(gym_id) references Gyms(ID), foreign key(director_id) references Directors(ID));
CREATE TABLE Users(
		ID varchar(20) primary key,
		name varchar(20),
		surname varchar(20),
		birth date, 
		age integer,
		Password varchar(255));
CREATE TABLE Subscriptions(	
		user_id varchar(20) primary key,   
		gym_id integer,    
		price float,    
		duration integer,    
		date_in date,   
		date_out date,       
		foreign key(user_id) references Users(ID),foreign key(gym_id) references Gyms(ID));
CREATE TABLE Cards(
		ID integer primary key auto_increment,    
		duration integer,   
		difficulty integer,    
		type varchar(50));
CREATE TABLE PTs(	
		gym_id integer auto_increment,   
		ID integer primary key,    
		name varchar(20),    
		surname varchar(20),    
		birth date,	  
		foreign key(gym_id) references Gyms(ID));
CREATE TABLE Trainings (    
		ID integer primary key auto_increment,
		pt_id integer,    
		card_id integer,    
		user_id varchar(20),    
		foreign key (pt_id) references PTs(ID),foreign key (card_id) references Cards(ID),    
		foreign key (user_id) references Users(ID));
CREATE TABLE Courses(	
		ID integer primary key auto_increment,    
		name varchar(20),     
		time varchar(5),     
		day varchar(20),
		image varchar(255),
		description varchar(2555));
CREATE TABLE course_user(	
		ID integer primary key auto_increment,
		user_id varchar(20),     
		course_id integer,    
		foreign key(user_id) references Users(ID), foreign key(course_id) references Courses(ID));
CREATE TABLE Comments(
		ID integer primary key auto_increment,
		text varchar(1000),
		user_id varchar(20),
		day date,
		time varchar(5),
		foreign key(user_id) references Users(ID));

INSERT INTO Gyms(ID, name)
VALUES (1,"BeFit");

INSERT INTO Users(ID, name, surname, birth, age, password)
VALUES ('ZNGDNL99H06C351F','Daniele','Zinghirino','1999-06-06',22,'aaaaaaaa'),
('SCADUTO','Mario','Rossi','1991-07-01',30,'aaaaaaaa'),
('PROVA','Maria','Verdi','2000-01-05',21,'aaaaaaaa');

INSERT INTO Subscriptions(user_id, gym_id, price, duration, date_in, date_out)
VALUES ('ZNGDNL99H06C351F',1,300,12,'2021-01-04','2022-01-04'),
('SCADUTO',1,120,3,'2021-03-10','2021-06-10'),
('PROVA',1,300,12,'2020-12-12','2021-12-12');

INSERT INTO PTs(gym_id, ID, name, surname, birth)
VALUES (1,1,'Giovanni','Longo','1980-08-08'),
(1,2,'Carlo','Rossi','1976-04-20'),
(1,3,'Giorgia','Bruni','1989-01-14'),
(1,4,'Federica','Bianchi','1992-12-21'),
(1,5,'Luigi','Verde','1984-07-02');

INSERT INTO Cards(ID, duration, difficulty, type)
VALUES(1,2,2,'Risveglio muscolare'),
(2,3,3,'Dimagrimento'),
(3,4,3,'Definizione'),
(4,4,4,'Aumento massa muscolare');

INSERT INTO Trainings(ID, pt_id, card_id, user_id)
VALUES(1,1,1,'ZNGDNL99H06C351F'),
(2,4,2,'SCADUTO'),
(3,3,4,'PROVA');

INSERT INTO Courses(ID, name, time, day, image, description)
VALUES(1,'PUGILATO',19.00,'Martedi','immagini/Pugilato.jpg',"L’allenamento comprende un veloce riscaldamento  a cui seguono esercizi mirati alo sviluppo di coordinazione, forza, velocità e resistenza. Si passa poi alle tecniche e tattiche specifiche, che comprendono la tecnica pugilistica, la scelta di tempo e delle distanze. Il contatto tra gli atleti avviene sempre  in sicurezza."),
(2,'WORKOUT',17.00,'Lunedi','immagini/Workout.jpg',"Il Total Body workout è un tipo di allenamento in cui si praticano esercizi che coinvolgono tutto il corpo. L’allenamento è composto da un mix di esercizi: statici, dinamici, di equilibrio funzionale, forza e definizione muscolare. Nel workout si usano grandi e piccoli attrezzi fitness, e macchine cardio fitness."),
(3,'AEROBICA',18.30,'Mercoledi','immagini/Aerobica.jpg',"Si tratta di ginnastica a corpo libero con elementi coreografici a ritmo di musica, il cui obiettivo è l’allenamento delle funzioni cardiovascolari e respiratorie, la tonificazione e il consumo calorico. La diversità delle tecniche usate, così come l’impiego di attrezzi (step, cavigliere, manubri, ecc.) permette ai partecipanti di diversificare l'allenamento cardiovascolare rendendolo vario e stimolante allo stesso tempo."),
(4,'KARATE',17.45,'Giovedi','immagini/Karate.jpg',"Al pari di altre arti marziali, il karate, è uno sport completo che coinvolge tutti i muscoli e le articolazioni del corpo. Per questa ragione è uno sport consigliato allo stesso modo per bambini, adolescenti e adulti, ai quali è offerta la possibilità di elevarsi, all'interno di questa disciplina, attraverso sette gradi culminanti nella cintura nera."),
(5,'YOGA',19.30,'Giovedi','immagini/Yoga.jpg',"Lo yoga ha diversi benefici: il corpo viene tonificato, reso flessibile e forte, ne giovano articolazioni, muscoli, organi interni, migliora l’elasticità della colonna vertebrale; la mente che diventa più calma, aperta e ricettiva, siamo più rilassati, migliora la qualità del sonno, del riposo e la concentrazione; il respiro viene migliorato perchè si impara a respirare correttamente e a fondo, usando tutta la propria capacità respiratoria, questo porta ad una migliore ossigenazione del sangue, con conseguenze positive su tutto il corpo e sulla mente"),
(6,'SPINNING',14.30,'Giovedi','immagini/Spinning.jpg',"Una pedalata di gruppo su una cyclette particolare (detta bike da indoor) e sotto la guida attenta di un istruttore, che usa una base musicale per impostare il lavoro");

INSERT INTO course_user(ID, user_id, course_id)
VALUES(1,'ZNGDNL99H06C351F',1),
(2,'ZNGDNL99H06C351F',3),
(3,'PROVA',3),
(4,'PROVA',4),
(5,'PROVA',6);

INSERT INTO Comments(ID,text,user_id,day,time)
VALUES (1,'Ottima struttura!','SCADUTO','2021-04-05','18.30'),
(2,'Un ambiente perfetto per allenarsi','PROVA','2021-06-12','15.13'),
(3,'Personale super competente!','ZNGDNL99H06C351F','2021-06-18','10.57');

INSERT INTO Directors(ID,name,surname,birth)
VALUES (1,'Orazio','Neri','1965-04-17'),
(2,'Carmela','Gialli','1976-11-01'),
(3,'Luisa','Viola','1982-03-30');

INSERT INTO Offices(ID,gym_id,city,address,director_id)
VALUES(1,1,'Catania','Via XXXI Maggio',1),
(2,1,'Palermo','Via Roma',2),
(3,1,'Roma','Via Flaminia',3);
    
    
