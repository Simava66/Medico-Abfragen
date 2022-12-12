
-- Fachrichtung - Vorlagen Zuordnung - x5811ded
-- Zuordnung Profil - Fachrichtung/Station - x9142pdw
-- Zuordnung Ressourcen zu Leistungsstelle - x8872crn
-- Erbringende Leistungsstellen mit Untersuchungen - x8805lae
-- Abrechnungsart-Fachrichtung-Station-Tarifziffer - x8303pla
-- Abrechnungsarten für Fachrichtung+Station - x8302cpi
-- Zentren/Fachrichtungen - x8111cep
-- Fachrichtungen/Stationen - x8112des
-- Fachrichtungen zeitabhängig - x8117dpt
-- Fachrichtungen - x8102dep


 
  
 
 


-- Fachrichtungen/Stationen - x8112des
select *
from x8117dpt
where dep Like 'J-CH-KU'and datt >= current_date;


update x8117dpt
set DATT='01.10.2021', CHD= current_date, CHUSER = 'SERRSI'
where dep = 'J-CH-KU'and DATT >= current_date;

insert into x8112des
select 'J-OR-WS', wds, datf, datt, sortseq, NOLABNO, NOLABLAB, dwt, MKLOCK, ctr, '01.03.2021', 'SERRSI', current_date, 'SERRSI', resk1, resk2, resk3, resk4, resk5, des, LSTKZ, pba, tcx, MKCSA,intsysk
from x8112des
where dep = 'J-ORTHO-WS'  and datf <= current_date and datt >= current_date;
--15 Zeilen

---- Zentren/Fachrichtungen - x8111cep
select *
from x8111cep
where cen='J-OR';

-- Abrechnungsarten für Fachrichtung+Station - x8302cpi
select *
from x8302cpi
where dep = 'J-IM-G' and datf <= current_date and datt>=current_date;

select cha, 'J-IM', WDS, '01.01.2020', datt, sortseq, '01.01.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where DEP='J-IM-G' and datf <=current_date and datt>=current_date;


insert into x8302cpi
select cha, 'J-OR-UC', WDS, '01.01.2020', datt, sortseq, '01.01.2020', 'J-SERRSI', current_date, 'J-SERRSI'
from x8302cpi
where DEP='J-CH-KU' and datf <=current_date and datt>=current_date;
-- 235 Zeilen

-- Abrechnungsart-Fachrichtung-Station-Tarifziffer - x8303pla
select *
from X8303PLA
where dep = 'J-CH-KU' and wds ='J-ZNA' and datf <= current_date and datt>=current_date;

select cha, 'J-OR-UC', wds, cat, tar, '01.03.2021', datt, autotar, current_date, 'SERRSI', current_date, 'SERRSI'
from x8303pla
where dep = 'J-CH-KU' and wds ='J-ZNA' and datf <= current_date and datt>=current_date;


insert into x8303pla
select cha, 'J-OR-UC', wds, cat, tar, '01.03.2021', datt, autotar, current_date, 'SERRSI', current_date, 'SERRSI'
from x8303pla
where dep = 'J-CH-KU' and wds ='J-ZNA' and datf <= current_date and datt>=current_date;
-- 493 Zeilen

-- Zuordnung Ressourcen zu Leistungsstelle - x8872crn
insert into x8872crn
select 'J-ORTHO-WS', 'J-ORTHO-WS', RTPCON, RESCON, SORTSEQ, des, CALKZ, RWMODE, EVTMODE , current_date, 'KALATU', current_date, 'KALATU'
from x8872crn
where rtp = 'J-ORTHO';
-- 7 Zeilen

--Diagnose-Fachrichtung-Zuordnung - x6008ddr
select *
from x6008ddr
where dep like 'J-OR%';

select dit, dep, cha, datf, datt, dca, app, sortseq, crd, 'SERRSI', current_date, 'SERRSI',art,daydist
from x6008ddr
where dep like 'J-OR-%'; and datf = '01.03.2021'  and datt >= current_date;

update x6008ddr
set DATF = '01.01.2021'
where dep = 'J-OR';

insert into x6008ddr
select dit, 'J-OR-WS', cha, current_date, '31-12-2099', dca, app, sortseq, current_date, 'SERRSI', current_date, 'SERRSI',art,daydist
from x6008ddr
where dep = 'J-ORTHO-WS' and datf <= current_date and datt >= current_date;

-- Zuordnung Profil - Fachrichtung/Station - x9142pdw
insert into x9142pdw
select prf, 'J-OR-WS', wds, sortseq, control, current_date, 'SERRSI', current_date, 'SERRSI'
from x9142pdw
where dep = 'J-ORTHO-WS';
-- 12 Zeilen


insert into x9142pdw
select prf, 'J-ORTHO-WS', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO'  and prf = 'ALLSJK';
-- 14 Zeilen

insert into x9142pdw
select 'J-ORTHO-WS' || substr(prf,8, length(prf)), 'J-ORTHO-WS', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO' and prf like 'J-ORTHO#%';
-- 14 Zeilen 

insert into x9142pdw
select prf, 'J-ORTHO-WS', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO' and prf like 'STATION#%';
-- 12 Zeilen 

-- Profile zur Zugriffsteuerung Fachrichtung/Station - x9140prf
insert into x9140prf
select 'J-ORTHO-WS' || substr(prf,8, length(prf)), 'J-ORTHO-WS' || substr(prf,8, length(prf)), 'J-ORTHO-WS' || substr(prf,8, length(prf)), abbr, desout, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9140prf
where prf like 'J-ORTHO#%';
-- 15 zeilen

-- Erbringende Leistungsstellen mit Untersuchungen - x8805lae
select *
from x8805lae;

-- Fachrichtung - Vorlagen Zuordnung - x5811ded
select *
from x5811ded
where dep='J-ORTHO';

--Infotafel Laborwerte zu dep/wds - n7026ldp
select*
from n7026ldp
where dep='J-ORTHO';

select icl,'J-OR', wds, '01.03.2021', 'SERRSI', current_date, 'SERRSI'
from n7026ldp
where dep='J-ORTHO';

insert into n7026ldp
select icl,'J-OR-WS', wds, '01.03.2021', 'SERRSI', current_date, 'SERRSI'
from n7026ldp
where dep='J-ORTHO';

--OP Leistungen
select *
from x8720srv
where srv like 'J-ORTHO%';

--KLIDO Zugriff
--Station
select *
from B5064FDW
where wds like 'J-%';

--Fachrrichtung
select *
from B5064FDW
where dep like 'J-%';

