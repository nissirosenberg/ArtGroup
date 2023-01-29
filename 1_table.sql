use ArtDB
go
drop table if exists dbo.ArtGroup
go
create table ArtGroup(
	ArtGroupId int not null identity primary key,
	FirstName varchar(25) not null constraint ck_ArtGroup_first_name_cannot_be_blank check(FirstName>''),
	LastName varchar(25) not null constraint ck_ArtGroup_last_name_cannot_be_blank check(LastName>''),
-- SM "PhoneNumber not like '%[^0-9]%'" is using regex (Regular Expression) to enforce that only digits. I found this the easiest way. Maybe you wont understand it, but regex is a basic search pattern for all programing languages and more. see https://en.wikipedia.org/wiki/Regular_expression
	PhoneNumber char(10) not null constraint ck_ArtGroup_phone_number_must_be_10_digits check(len(PhoneNumber) = 10 and PhoneNumber not like '%[^0-9]%'),
	GroupType varchar(7) not null constraint ck_ArtGroup_group_must_be_in_pastel_paint1_and_paint2 check(GroupType in('pastel','paint 1','paint 2')),
	NumLessons int not null constraint ck_ArtGroup_num_lessons_cannot_be_negative check(NumLessons >= 0),
	Package varchar(8) not null constraint ck_ArtGroup_package_can_only_be_painting_or_pastels check(Package in('painting','pastels')),
	PricePaid int not null constraint ck_ArtGroup_price_paid_cannot_be_negative check(PricePaid >= 0),
	IsCurrent char(1) not null constraint ck_ArtGroup_is_current_must_be_star_or_dash check(IsCurrent in('*','-')),
	PricePerLesson as case Package when 'painting' then 32 else 15 end persisted,
	StudentPriceSupplies as case Package when 'painting' then 70 else 12 end persisted,
	PriceFull as (NumLessons * case Package when 'painting' then 32 else 15 end) + case Package when 'painting' then 70 else 12 end persisted,
	PriceOwes as (NumLessons * case Package when 'painting' then 32 else 15 end) + case Package when 'painting' then 70 else 12 end - PricePaid persisted constraint ck_ArtGroup_price_owed_cannot_be_negative check(PriceOwes >= 0),
	PriceSupplies as case Package when 'painting' then 50 else 7 end persisted,
	constraint ck_ArtGroup_Package_must_be_same_as_GroupType check((Package = 'painting' and GroupType in('paint 1','paint 2')) or (Package = 'pastels' and GroupType = 'pastel'))
)