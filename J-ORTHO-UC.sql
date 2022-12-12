select *
from x8112des
where dep = 'J-OR-PC' and datt >= current_date;


insert into x8112des
select 'J-OR-ZV', wds,'01.05.2021' ,datt,sortseq, nolabno,NOLABLAB, dwt, mklock, ctr,current_date, 'SERRSI', current_date, 'SERRSI', RESK1, resk2, resk3, resk4, resk5, 'J-OR-ZV', LSTKZ, pba, tcx, MKCSA, intsysk
from x8112des
where  dep = 'J-OR-PC' and datt >= current_date;
--15 Zeilen eingefügt.


select *
from x8302cpi
where dep = 'J-ORTHO-WS' and datt >= current_date;

insert into x8302cpi
select cha, 'J-ORTHO-UC', wds, datf,datt,sortseq,current_date, 'KALATU', current_date, null
from x8302cpi
where  dep = 'J-ORTHO-WS' and datt >= current_date;
--265 Zeilen eingefügt.



select *
from x8303pla
where dep = 'J-ORTHO-WS' and datt >= current_date;

insert into x8303pla
select cha, 'J-ORTHO-UC', wds, cat, tar, datf,datt,autotar,current_date, 'KALATU', current_date, 'KALATU'
from x8303pla
where  dep = 'J-ORTHO-WS' and datt >= current_date;
--492 Zeilen eingefügt.


insert into x9142pdw
select prf, 'J-ORTHO-UC', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO-WS' and prf = 'ALL';
-- 12 Zeilen

insert into x9142pdw
select 'ALL#J-ORTHO-UC', 'J-ORTHO-UC', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO-WS' and prf = 'ALL#J-ORTHO-WS';
-- 15 Zeilen 

insert into x9142pdw
select prf, 'J-ORTHO-UC', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO-WS'  and prf = 'ALLSJK';
-- 14 Zeilen

insert into x9142pdw
select 'J-ORTHO-UC' || substr(prf,8, length(prf)), 'J-ORTHO-UC', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO' and prf like 'J-ORTHO#%';
-- 14 Zeilen 

insert into x9142pdw
select prf, 'J-ORTHO-UC', wds, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9142pdw
where dep = 'J-ORTHO-WS' and prf like 'STATION#%';
-- 12 Zeilen 

insert into x9140prf
select 'J-ORTHO-UC' || substr(prf,8, length(prf)), 'J-ORTHO-UC' || substr(prf,8, length(prf)), 'J-ORTHO-UC' || substr(prf,8, length(prf)), abbr, desout, sortseq, control, current_date, 'KALATU', current_date, 'KALATU'
from x9140prf
where prf like 'J-ORTHO#%';
-- 15 zeilen



--OP Leistungen
select *
from x8720srv
where srv like 'J-ORTHO%';


select *
from x8721sra
where srv like 'J-ORTHO%';



