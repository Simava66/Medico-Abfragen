-- Fachrichtungen - x8102dep
select *
from x8102dep
where dep like 'J-ORTHO%';


-- Fachrichtungen zeitabhängig - x8117dpt
select *
from x8117dpt
where dep like 'J-ORTHO%';


-- Fachrichtungen/Stationen - x8112des
select *
from x8112des
where dep like 'J-ORTHO%';

-- Zentren/Fachrichtungen - x8111cep
select *
from x8111cep
where cen like 'J-OR%';

-- Abrechnungsarten für Fachrichtung+Station - x8302cpi
-- Abrechnungsart-Fachrichtung-Station-Tarifziffer - x8303pla
-- Erbringende Leistungsstellen mit Untersuchungen - x8805lae
-- Zuordnung Ressourcen zu Leistungsstelle - x8872crn
-- Zuordnung Profil - Fachrichtung/Station - x9142pdw
-- Fachrichtung - Vorlagen Zuordnung - x5811ded
-- Diagnose-Fachrichtung-Zuordnung - x6008ddr


select *
from x8102dep
where dep like 'J-ORTHO%';

insert into x8112des
select 'J-ORTHO-WS', wds, datf, datt, sortseq, NOLABNO, NOLABLAB, dwt, MKLOCK, ctr, current_date, 'KALATU', current_date, 'KALATU', resk1, resk2, resk3, resk4, resk5, des, LSTKZ, pba, tcx, MKCSA 
from x8112des
where dep = 'J-ORTHO'  and datf <= current_date and datt >= current_date;
--15 Zeilen

insert into x8302cpi
select cha, 'J-ORTHO-WS', wds, datf, datt, sortseq, current_date, 'KALATU', current_date, 'KALATU'
from x8302cpi
where dep = 'J-ORTHO'  and datf <= current_date and datt >= current_date;
-- 235 Zeilen

insert into x8303pla
select cha,  'J-ORTHO-WS', wds, cat, tar, datf, datt, autotar, current_date, 'KALATU', current_date, 'KALATU'
from x8303pla
where  dep = 'J-ORTHO'  and datf <= current_date and datt >= current_date;
-- 493 Zeilen

insert into x8872crn
select 'J-ORTHO-WS', 'J-ORTHO-WS', RTPCON, RESCON, SORTSEQ, des, CALKZ, RWMODE, EVTMODE , current_date, 'KALATU', current_date, 'KALATU'
from x8872crn
where rtp = 'J-ORTHO';
-- 7 Zeilen

insert into x9142pdw
select prf, 'J-ORTHO-WS', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO' and prf = 'ALL';
-- 12 Zeilen

insert into x9142pdw
select 'ALL#J-ORTHO-WS', 'J-ORTHO-WS', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO' and prf = 'ALL#J-ORTHO';
-- 15 Zeilen 

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

insert into x9140prf
select 'J-ORTHO-WS' || substr(prf,8, length(prf)), 'J-ORTHO-WS' || substr(prf,8, length(prf)), 'J-ORTHO-WS' || substr(prf,8, length(prf)), abbr, desout, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9140prf
where prf like 'J-ORTHO#%';
-- 15 zeilen

--OP Leistungen
select *
from x8720srv
where srv like 'J-ORTHO%';


