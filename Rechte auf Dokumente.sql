--Rechte auf Dokumente
-- Grants=0 Alle Dokumente
-- Grants=1 Fachrichtung Dokumente
-- Grants=2 Eigene Dokumente

--Personalstamm - x8201psr
--Freigabe-Hierarchie der Aerzte der Arztbriefschrei - x5803frh

select *
from x5800ugr
where USR like 'J-%' and GRANTS ='1';

update x5800ugr
set Grants = '1'
where USR like 'J-%' and GRANTS='0';

select *
from x5803frh
where usr like 'J-%';

select *
from x8201psr
where depdef = 'J-OR';

select *
from x8201psr psr, x9102usr usr
where usr.psr = psr.psr and psr.psr like '7500%' and usr.GRP like 'J-AR%' and psr.DATT > current_Date;

select *
from x8201psr psr, x9102usr usr, x5803frh frh
where usr.psr = psr.psr and psr.psr like '7500%' and usr.usr = frh.usr and psr.DEPDEF = 'J-OR' and psr.DATT > current_Date;

