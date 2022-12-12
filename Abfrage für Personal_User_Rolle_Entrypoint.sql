-- alle User mit a und b
alter session set nls_date_format = 'dd.mm.yyyy';
select a.psr, a.namechr, a.jog, b.usr, b.grp, c.rol, d.des, c.datt, e.enp, f.des
from x8201psr a, x9102usr b, x9171rus c, x9170rol d, x9172rep e, x9106enp f
where a.psr = b.psr
and b.usr = c.usr
and c.rol = d.rol
and c.rol = e.rol
and e.enp = f.enp
and (b.usr like 'J-A%' or b.usr like 'J-B%')
order by b.usr;

--ein bestimmter User
alter session set nls_date_format = 'dd.mm.yyyy';
select a.psr, a.namechr, a.jog, b.usr, b.grp, c.rol, d.des, c.datt, e.enp, f.des
from x8201psr a, x9102usr b, x9171rus c, x9170rol d, x9172rep e, x9106enp f
where a.psr = b.psr
and b.usr = c.usr
and c.rol = d.rol
and c.rol = e.rol
and e.enp = f.enp
and b.usr = 'J-BRECTA' 
order by e.enp;

-- Wer hat dieses Profile
select *
from x9141upr
where prf='J-CH#J-VWF';

-- alle mit dem Profile bekommen auch das Profile
insert into x9141upr
select usr, 'J-VW#J-VWF', datf, datt,sortseq,control,current_date,'J-SERRSI',current_date, 'J-SERRSI'
from X9141UPR
where prf='J-CH#J-VWF';


