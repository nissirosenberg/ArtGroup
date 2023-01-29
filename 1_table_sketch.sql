/*
	ArtGroupId int id pk
	FirstName varchar(25) not null not blank
	LastName varchar(25) not null not null not blank
	PhoneNumber char(10) not null 10 digits
	GroupType varchar(7) not null in('pastel','paint 1','paint 2')
	NumLessons int not null >= 0
	Package varchar(8) not null in('painting','pastels')
	PricePaid int not null >= 0
	IsCurrent char(1) not null in('*','-')
	PricePerLesson as case Package when 'painting' then 32 else 15 end persisted,
	StudentPriceSupplies as case Package when 'painting' then 70 else 12 end persisted,
	PriceFull as (NumLessons * PricePerLesson) + StudentPriceSupplies persisted,
	PriceOwes as PriceFull - PricePaid persisted >= 0
	PriceSupplies as case Package when 'painting' then 50 else 7 end persisted,
	constraint (Package = 'painting' and GroupType in('paint 1','paint 2')) or (Package = 'pastels' and GroupType = 'pastel')
)
*/