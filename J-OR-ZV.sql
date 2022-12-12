--Fachrichtung anlegen x8102dep
--Fachrichtung zeitabhängig x8117dpt (Kostenstelle!)

--Fachrichtung zu Station x8112des
select *
from x8112des
where dep = 'J-OR-PC' and datt >= current_date;


insert into x8112des
select 'J-OR-ZV', wds,'01.05.2021' ,datt,sortseq, nolabno,NOLABLAB, dwt, mklock, ctr,current_date, 'SERRSI', current_date, 'SERRSI', RESK1, resk2, resk3, resk4, resk5, 'J-OR-ZV', LSTKZ, pba, tcx, MKCSA, intsysk
from x8112des
where  dep = 'J-OR-PC' and datt >= current_date;
--10 Zeilen eingefügt.

--Abrechnungsart für Fachrichtung+Station x8302cpi
select *
from x8302cpi
where dep = 'J-OR-WS' and datt >= current_date and CHA like 'J-A%';

insert into x8302cpi
select cha, 'J-OR-ZV', wds, '01.05.2021',datt,sortseq,current_date, 'SERRSI', current_date, 'SERRSI'
from x8302cpi
where dep = 'J-OR-WS' and datt >= current_date and CHA like 'J-A%';
--65 Zeilen eingefügt.

--Abrechnungsart-Fachrichtung-Station-Tarifziffer-x8303pla

select *
from x8303pla
where dep = 'J-OR-WS' and datt >= current_date;

insert into x8303pla
select cha, 'J-OR-ZV', wds, cat, tar, '01.05.2021',datt,autotar,current_date, 'SERRSI', current_date, 'SERRSI'
from x8303pla
where  dep = 'J-OR-PC' and datt >= current_date;
--378 Zeilen eingefügt.


--Zuordnung Profil - Fachrichtung/Station - x9142pdw
select *
from X9142PDW
where dep = 'J-OR-ZV';

insert into x9142pdw
select prf, 'J-OR-ZV', wds, sortseq, control, '01.05.2021', 'SERRSI', current_date, 'SERRSI'
from x9142pdw
where dep = 'J-OR-PC' and prf='ALLSJK';
-- 10 Zeilen

insert into X9142PDW
select 'ALL#J-ORTHO', dep, wds, sortseq, control, '01.05.2021', 'SERRSI', current_date, 'SERRSI'
from x9142pdw
where dep = 'J-OR-ZV' and PRF='ALLSJK';
-- 10 Zeilen


--Profile zur Zugriffsteuerung Fachrichtung/Station - x9140prf
--von Hand angelegt
insert into x9140prf
select 'J-OR-ZV' || substr(prf,8, length(prf)), 'J-OR-ZV' || substr(prf,8, length(prf)), 'J-OR-ZV' || substr(prf,8, length(prf)), abbr, desout, sortseq, control, current_date, 'SERRSI', current_date, 'SERRSI'
from x9140prf
where prf like 'J-ORTHO#%';
-- 15 zeilen

-- Zentren/Fachrichtungen - x8111cep
select *
from x8111cep
where dep = 'J-OR-WS';

select cen,'J-OR-ZV','01.05.2021', '31.12.2099',SORTSEQ,ctr,crd,cruser,chd,chuser
from x8111cep
where dep = 'J-OR-WS';

insert into x8111cep
select cen,'J-OR-ZV','01.05.2021', '31.12.2099',SORTSEQ,ctr,crd,cruser,chd,chuser
from x8111cep
where dep = 'J-OR-WS';


--OP Leistungen
select *
from x8720srv
where srv like 'J-ORTHO%';


select *
from x8721sra
where srv like 'J-ORTHO%';



