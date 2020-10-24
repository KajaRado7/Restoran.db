create table uzdrzavana_osoba(ID_uz_osoba integer primary key,ime text,prezime text,datum_rodenja_uz_osoba text,veza text);
create table zaposlenik(ID_zap integer primary key,ID_uz_osoba integer,ime text,prezime text,placa real,kontakt_broj text,datum_rodenja_zap text,foreign key(ID_uz_osoba) references uzdrzavana_osoba(ID_uz_osoba));
create table restoran(ID_res integer primary key,ID_zap integer,ID_rezerv integer,naziv text,foreign key(ID_zap) references zaposlenik(ID_zap) foreign key(ID_rezerv) references rezervacija(ID_rezerv));
create table rezervacija(ID_rezerv integer primary key,ID_racun integer,ime text,prezime text,broj_osoba integer,foreign key(ID_racun) references zaglavlje_racuna(ID_racun));
create table zaglavlje_racuna(ID_racun integer primary key,datum text,nacin_placanja text);
create table stavke_racuna(ID_stav_racun integer primary key,ID_racun integer,ID_narudzba integer,kolicina integer,foreign key(ID_racun) references zaglavlje_racuna(ID_racun) foreign key(ID_narudzba) references narudzba(ID_narudzba));
create table narudzba(ID_narudzba integer primary key,naziv text,cijena real);

insert into uzdrzavana_osoba values(120,"Ivona","Komel",'10-03-2004',"Kæer"),(121,"Klara","Boliæ",'23-01-1921',"Baka"),(122,"Ivica","Anðeliæ",'01-10-1945',"Otac"),(123,"Mauro","Ivankoviæ",'22-06-2003',"Sin"),
(124,"David","Cvetko",'17-06-2008',"Sin"),(125,"Marija","Capiæ",'05-11-2006',"Kæer"),(126,"Nicol","Rojniæ",'19-02-2010',"Kæer");

insert into zaposlenik values(3001,121,"Lucija","Boliæ",7000,'0951234567','02-03-1993'),(3002,120,"Nika","Komel",6000,'052223680','12-05-1972'),(3003,NULL,"Marta","Cerin",6000,'0912003123','11-04-1990'),
(3004,122,"Marko","Horvat",7000,'0919874332','30-08-1986'),(3005,123,"Petar","Ivankoviæ",7000,'0977073253','26-03-1990'),(3006,125,"Luka","Capiæ",5500,'052379340','17-04-1982'),(3007,124,"Hana","Cvetko",6000,'0974432111','07-06-1979'),
(3008,NULL,"Julia","Rudan",5500,'0918883179','09-08-1994'),(3009,126,"Erik","Rojniæ",6000,'051697331','03-12-1980'),(3010,NULL,"Alen","Rovis",6000,'09577002007','21-07-1992');

insert into restoran values(201,3001,301,"More"),(202,3002,302,"Užina"),(203,3003,303,"Kadena"),(204,3004,304,"Orca"),(205,3005,305,"Perla"),(206,3006,306,"Oaza"),(207,3007,307,"Lotus"),
(208,3008,308,"Dolce Vita"),(209,3009,309,"Karla"),(210,3010,310,"Ulika");

insert into rezervacija values(301,401,"Patricija","Renka",4),(302,402,"Petar","Benèiæ",2),(303,403,"Nina","Zatel",2),(304,404,"Katarina","Jahiæ",3),(305,405,"Vanesa","Percan",3),(306,406,"Damir","Vareško",6),
(307,407,"Željko","Butina",2),(308,408,"Karin","Pliško",5),(309,409,"Ivo","Nikoliæ",7),(310,410,"Korina","Cukon",4);

insert into zaglavlje_racuna values(401,'06-06-2019',"Kartica"),(402,'07-06-2019',"Gotovina"),(403,'12-06-2019',"Gotovina"),(404,'07-06-2019',"Gotovina"),(405,'18-06-2019',"Kartica"),
(406,'20-06-2019',"Kartica"),(407,'06-06-2019',"Gotovina"),(408,'21-06-2019',"Kartica"),(409,'15-06-2019',"Gotovina"),(410,'13-06-2019',"Gotovina");

insert into stavke_racuna values(501,401,602,4),(502,402,615,2),(503,403,613,2),(504,404,609,3),(505,405,605,3),(506,406,601,6),(507,407,604,2),(508,408,603,5),(509,409,610,7),(510,410,609,4);

insert into narudzba values(601,"Domaæe kobasice",35),(602,"Pljukanci sa špinatom",55),(603,"Rižoto sa gljivama",60),(604,"Istarski pršut i sir sa tartufima",120),(605,"Riblja juha",30),(606,"Tjestenina sa morskim plodovima",70),
(607,"Riba na žaru",60),(608,"Mesna plata",90),(609,"Pizza",50),(610,"Ombolo sa pommesom",40),(611,"Salata",25),(612,"Gulaš od divljaèi",70),(613,"Škampi na žaru",90),(614,"Školjke",90),(615,"Punjene lignje",80);


select*from uzdrzavana_osoba;
select*from zaposlenik;
select*from restoran;
select*from rezervacija;
select*from zaglavlje_racuna;
select*from stavke_racuna;
select*from narudzba;


select naziv,cijena from narudzba where cijena < 50 ;

select ime,prezime from zaposlenik where datum_rodenja_zap > '03-12-1980' and ime glob 'H*';

select AVG(placa) as prosjecna_placa_zap from zaposlenik;

select rezervacija.ime,rezervacija.prezime,narudzba.naziv from rezervacija inner join stavke_racuna on stavke_racuna.ID_racun=rezervacija.ID_racun inner join narudzba on narudzba.ID_narudzba=stavke_racuna.ID_narudzba;

select naziv,MAX(cijena) from narudzba;

select zaglavlje_racuna.nacin_placanja from zaglavlje_racuna union select rezervacija.prezime from rezervacija;

select ID_zap from zaposlenik intersect select ID_zap from restoran;






















