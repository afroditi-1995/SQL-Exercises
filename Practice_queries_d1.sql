#1
select avg(pprice) from product;
#2
-- select * from product;
-- select sum(pprice) from product
-- where pdescr like '%printer%';
select * from product
where pprice > (select sum(pprice) from product
where pdescr like '%printer%');
#3
select avg(pprice) from product
where pdescr like '%printer%';
#4
-- select * from product;
select * from product
where pcode not in (select distinct pcode from sales);
#5
-- select * from salesman;
select * from salesman 
where scomm > (select scomm from salesman 
               where sname = 'Raptis');
#6
select * from salesman
where scity<>'Athens' and scomm > 0.15;
#7
-- select * from family;
select * from salesman
where scode not in (select salesman from family);
#8
select * from customer
where cname like '%los';
#9
select * from customer 
order by cname;
#10
select count(*) from sales
where ccode = (select ccode from customer
               where cname = 'Aleksiadis');
#11
select avg(cost) from sales
where smcode = 104;
#12
select count(*) from sales
where pcode = 1311;
#13
select sum(quant) from sales
where pcode = 1311 and sdate like '1992%';
#14
select pcode, sum(quant) from sales
group by pcode;
#15
select ccode from sales 
group by ccode
having count(*) > 2;
#16
select * from salesman
where scode in (select distinct smcode from sales 
                where sdate like '1993%');
#17
/* ???? */

#18
select max(cost) as maximum, min(cost) as minimum,
       avg(cost) as average, sum(cost) as sum from sales;
#19
select * from sales
where sdate in (select sdate from sales
				where sdate like '1992-12%' or sdate like '1993-01%' or sdate like '1993-02%' or sdate like '1993-03%');
#20
-- select scode from salesman where sname = 'Raptis';
insert into family
values(3, 'Kathrine', 'daughter' , '2001-03-15' , (select scode from salesman where sname = 'Raptis') );
-- select * from family;



