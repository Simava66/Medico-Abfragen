
-- Abrechnungsarten für Fachrichtung+Station - x8302cpi
select *
from x8302cpi
where cha = 'J-ABSAG' and datf <=current_date and datt>=current_date;

update x8302cpi
set DATt = '01.06.2022'
where DEP='J-IM-G' and CHA = 'J-ABSAG' and datf <=current_date and datt>=current_date;

--testen
select 'J-ABSAGSV',DEP,WDS, '01.12.2020', datt, 'SV ABSAGE',current_date, 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where cha = 'J-ABSAG' and datf <= current_date and datt >= current_date;
--12 zeilen


--einfügen
insert into x8302cpi
select 'J-ABSAGSN',DEP,WDS, '01.12.2020', datt, 'SV ABSAGE',current_date, 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where cha = 'J-SV'  and datf <= current_date and datt >= current_date;

--zimmer
select *
from x8105rom
where WDS= 'J-3A' and datf <=current_date and datt>=current_date;

select 'J-3', rom, '01.12.2020', datt, sortseq, des, desxl, abbr, desout, bedplan, bedacc, koroom, bedirom, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI', septic, para1, para2, para3, para4, para5, para6, para7, para8, para9
from x8105rom
where WDS='J-3A' and datf <=current_date and datt>=current_date;

--Zimmer neu zurodnen
insert into x8105rom
select 'J-5', rom, '01.12.2020', datt, sortseq, des, desxl, abbr, desout, bedplan, bedacc, koroom, bedirom, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI', septic, para1, para2, para3, para4, para5, para6, para7, para8, para9
from x8105rom
where WDS='J-5A' and datf <=current_date and datt>=current_date;

--Betten
select *
from x8106bed
where WDS= 'J-BALDY' and datf <=current_date and datt>=current_date;

select 'J-4', rom, bed,'01.12.2020', datt, 'C', des, desxl, abbr, desout, cag, cen, dep,dic, phone, telvid, freoc, extbed, lockedf,lockedt, lockedtext, reserv1, reserv2, reserv3, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8106bed
where WDS='J-BALDY' and datf <=current_date and datt>=current_date;

--Bett neu zurodnen
insert into x8106bed
select 'J-4', rom, bed,'01.12.2020', datt, 'C', des, desxl, abbr, desout, cag, cen, dep,dic, phone, telvid, freoc, extbed, lockedf,lockedt, lockedtext, reserv1, reserv2, reserv3, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8106bed
where WDS='J-BALDY' and datf <=current_date and datt>=current_date;

--abrechnungsart
select *
from x8302cpi
where WDS= 'J-3A' and datf <=current_date and datt>=current_date;

select cha, dep, 'J-3', '01.12.2020', datt, sortseq, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where WDS='J-3A' and datf <=current_date and datt>=current_date;

--Abrechnungsart zurodnen
insert into x8302cpi
select cha, dep, 'J-5', '01.12.2020', datt, sortseq, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where WDS='J-5A' and datf <=current_date and datt>=current_date;

--Tarif
select *
from x8303pla
where WDS= 'J-3A' and datf <=current_date and datt>=current_date;

select cha, dep, 'J-3', cat, tar, '01.12.2020', datt, autotar, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8303pla
where WDS='J-3A' and datf <=current_date and datt>=current_date;

--Tarif zurodnen
insert into x8303pla
select cha, dep, 'J-3', cat, tar, '01.12.2020', datt, autotar, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8303pla
where WDS='J-3A' and datf <=current_date and datt>=current_date;

--Profil
select *
from x9142pdw
where WDS='J-3A' and prf='ALLSJK';

select PRF, dep, 'J-3','ALLSJK', control, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x9142pdw
where WDS='J-3A' and prf='ALLSJK';

--Tarif zurodnen
insert into x9142pdw
select PRF, dep, 'J-5',sortseq, control, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x9142pdw
where WDS='J-5A' and prf='ALL';

--Profile zuordnen

select *
from x9142pdw
where WDS='J-3A' and prf='ALL';

select PRF, dep, 'J-3','ALLSJK', control, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x9142pdw
where WDS='J-3A' and prf='ALLSJK';

insert into x9142pdw
select PRF, dep, 'J-5','ALLSJK', control, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x9142pdw
where WDS='J-5A' and prf='ALLSJK';