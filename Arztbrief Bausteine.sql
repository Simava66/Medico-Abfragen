



select *
from x8112des
where wds='J-APOZ' and datf <= current_date and datt>= current_date;

select *
from x5830tbs
where CRUSER like'J-S%';

select *
from x5831tbf;

select *
from x5832tbg;

select *
from x5852txt;

Select tbs.tbs, tbs.CRUSER, tbs.desxl, txt.buf
From x5830tbs tbs, x5852txt txt, x5851dme dme
where dme.dre = tbs.dre
and tbs.cruser like 'J-SAU%'
And txt.name = dme.dme;

Select tbs.tbs, tbs.desxl, txt.buf, tbs.tbg
From x5830tbs tbs, x5852txt txt, x5851dme dme
Where tbs.tbg Like '%CH%'
And dme.dre = tbs.dre
And txt.name = dme.dme;

--Zuordnung User - Profil - x5802upr

select*
from x5802upr
where PRF='J-ABNT-CH';

--Ändern des Profils
update x5802upr
set PRF = 'AB%SJKALL#CH'
where PRF='J-ABNT-CH';

--Personalstamm - x8201psr
--Standardfachrichtung und Berufsgruppe
select *
from x8201psr
where DEPDEF = 'J-HNO' and JOG='PFL';

update x8201psr
set JOG ='ANA_PFL'
where DEPDEF = 'J-ANAE' and JOG='PFL';
