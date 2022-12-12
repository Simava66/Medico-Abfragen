--Abrechnungsart-Fachrichtung-Station-Tarifziffer - x8303pla
--Abrechnungsart-Debitorenart-Katalog - x8317coa




select *
from x8303pla
where DEP like 'P-%' and CHA = 'P-SZ' and DATT > current_date;


update x8303pla
set DATT='01.05.2022', CHD= current_date, CHUSER = 'SERRSI'
where DEP like 'J-ORT%' and DATT > current_date;

select *
from x8317coa
where CHA = 'P-S-PRIV';

insert into x8317coa
select 'P-A-PRIV',det, CAT, DIC, COD, CTDRANK, SETLDEF, SETLGRP,SETL3, DEB,'01.01.2022', 'J-SERRSI', current_date, 'J-SERRSI',CGREQ, ACC,ACCSGR,DEFFACT1P,DEFFACT2P,DEFFACT3P,HELPP1,HELPP2,HELPMK1,HELPMK2
from x8317coa
where CHA='P-S-PRIV';

insert into x8303pla
select 'P-A-PRIV', dep,wds,cat,tar,datf,datt,autotar,current_date,'SERRSI',current_date,'SERRSI'
from x8303pla
where DEP like 'P-%' and CHA = 'P-SZ' and DATT > current_date;

select *
from x8302cpi
where cha like 'J-AMB%' and wds = 'J-3' and DATT > current_date;


insert into x8302cpi
select cha, dep,'J-ZNA','01.01.2022',datt,sortseq, current_date, 'SERRSI',current_date,'SERRSI'
from x8302cpi
where cha like 'J-AMB-%' and wds = 'J-3' and datt > current_date;





