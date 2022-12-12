select *
from x8112des
where wds='J-APOZ' and datf <= current_date and datt>= current_date;

select *
from x5830tbs
where CRUSER like'J-S%';

select *
from x5831tbf;


--Anforderungen
select *
from x1510ops
where cat ='J-ZUSATZ';

--Anforderungen
select *
from x6822eat
where cat = 'J-ZUSATZ';

--Betten
select * 
from x8106bed
where wds ='J-3' and datt > '1.1.2022';

select * 
from h1102sta
where wds ='J-3' and datt > '1.1.2022';

--bewegungstabelle stationen
select * 
from x1102sta
where wds ='J-3' and datt > '1.1.2022';

---station verbunden mit Bett
select * 
from x1102sta sta, x8106bed bed
where sta.rom = bed.rom 
and sta.bed = bed.bed
and sta.wds = bed.wds
and sta.DEP like 'J-%'
and sta.datf > '1.7.2022';


---station verbunden mit Bett nur bestimmte felder
select sta.PAT, sta.wds, bed.rom, bed.cag
from x1102sta sta, x8106bed bed
where sta.rom = bed.rom
and sta.bed = bed.bed
and sta.DEP like 'J-%';
and sta.datf  > '01.06.2022';

select *
from x1204upa;

select *
from x5832tbg;

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

-- Infektionen
select*
from x1005pex
where mkr = 'infper';