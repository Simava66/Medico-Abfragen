-Tabelle anzeigen
select *
from x8103wds;

--Tabelle anzeigen mit bedingung
select *
from x8103wds
where WDS= 'J-3' and datf <=current_date and datt>=current_date;

--Tabelle anzeigen mit variabler suche
select *
from x8720srv
where srv like 'J-ORTHO%';

--testen
select dep, 'J-4', '01.12.2020', datt, 'J-4', NOLABNO, NOLABLAB, dwt, MKLOCK, ctr, current_date, 'J-SERRSI', current_date, 'J-SERRSI', resk1, resk2, resk3, resk4, resk5, dep, LSTKZ, pba, tcx, MKCSA 
from x8112des
where wds = 'J-4A'  and datf <= current_date and datt >= current_date;

--einfügen
insert into x8112des
select dep, 'J-4', '01.12.2020', datt, 'J-4', NOLABNO, NOLABLAB, dwt, MKLOCK, ctr, current_date, 'J-SERRSI', current_date, 'J-SERRSI', resk1, resk2, resk3, resk4, resk5, dep, LSTKZ, pba, tcx, MKCSA 
from x8112des
where wds = 'J-4A'  and datf <= current_date and datt >= current_date;

--Zimmer neu zurodnen
insert into x8105rom
select 'J-5', rom, '01.12.2020', datt, sortseq, des, desxl, abbr, desout, bedplan, bedacc, koroom, bedirom, '01.12.2020', 'J-SERRSI', current_date, 'J-SERRSI', septic, para1, para2, para3, para4, para5, para6, para7, para8, para9
from x8105rom
where WDS='J-5A' and datf <=current_date and datt>=current_date;

--Wenn du bestehende Datensätze aktualisieren willst, kannst du den Befehl UPDATE dafür verwenden:
-- Betten ungültig machen
update x8106bed
set DATt = '18.01.2021'
where WDS='J-5A' and datf <=current_date and datt>=current_date;

mehrere ändern
update x8302cpi
set DATT='01.10.2021', CHD= current_date, CHUSER = 'SERRSI'
where dep = 'J-CH-KU'and DATT >= current_date;

--Löschen VORSICHT!!!
delete x8303pla
where WDS='J-3' and TAR='J-C1Premium' and CAT='S2';

--mehrere Tabellen abfragen
select * 
from X9172REP rep, x9171rus rus
where rus.usr like 'J-A%';

Select tbs.tbs, tbs.desxl, txt.buf
From x5830tbs tbs, x5852txt txt, x5851dme dme
Where tbs.tbs Like 'AHC%'
And dme.dre = tbs.dre
And txt.name = dme.dme

Select tbs.tbs, tbs.desxl, txt.buf, tbs.tbg
From x5830tbs tbs, x5852txt txt, x5851dme dme
Where tbs.tbg Like '%CH%'
And dme.dre = tbs.dre
And txt.name = dme.dme;