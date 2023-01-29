use ArtDB
go
-- 1) I need an update statement for each girl for every lesson she comes.
update a
set a.NumLessons = a.NumLessons + 1
--select a.NumLessons, a.NumLessons + 1
from ArtGroup a
-- 2) I need a a report that separates the girls between the groups they're in. I want it to be separate tables(meaning in the report, it should come up as 3 separate tables. (3 selects.)).
select *
from ArtGroup a
where a.GroupType = 'Pastel'

select *
from ArtGroup a
where a.GroupType = 'Paint 1'

select *
from ArtGroup a
where a.GroupType = 'Paint 2'
-- 3) Total of how much profit I'm making(after expenses of supplies), total of how much I'm owed, and total of how much I was paid already
select TotalProfit = sum(a.PriceFull - a.PriceSupplies), TotalOwed = sum(a.PriceOwes), TotalPaid = sum(a.PricePaid)
from ArtGroup a
-- 4) Order the girls that I see first all the girls in the pastel group, then from the paint group(doesn't matter which one), then sort them by who came the most lessons and who came the least.
select *
from ArtGroup a
order by case a.GroupType when 'Pastel' then 0 else 1 end, a.NumLessons desc
-- 5) How many students do I currently have?
select NumStudents = count(*)
from ArtGroup a
-- 6) I want a report of who is on top of payment and who's not. If a girl owes more than half of the total she needs to pay, then she's not on top of it.
select *, OnTopOfPayment = case when a.PriceOwes < (a.PriceFull / 2) then 'Yes' else 'No' end
from ArtGroup a