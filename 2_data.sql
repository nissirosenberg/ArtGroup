use ArtDB
go
delete dbo.ArtGroup
go
insert dbo.ArtGroup(FirstName, LastName, PhoneNumber, GroupType, NumLessons, Package, PricePaid, IsCurrent)
select 'Ratzi', 'Kalman', '8453527694', 'Paint 1',  7, 'Painting', 200, '*'
union select 'Chumi', 'Sanders', '8459123569', 'Paint 1', 16, 'Painting', 0, '*'
union select 'Goldy', 'Morris', '8456463522', 'Pastel', 7, 'Pastels', 90, '*'
union select 'Hendy', 'Morris', '8456463522', 'Pastel', 7, 'Pastels', 0, '-'
union select 'Noami', 'Nachman', '8454254521', 'Paint 2', 9, 'Painting', 210, '*'
union select 'Libby', 'Glick', '8453784266', 'Paint 2', 8, 'Painting', 150, '-'
union select 'Malky', 'Nachman', '8454254521', 'Paint 2', 8, 'Painting', 100, '-'
union select 'Chana Ruchy', 'Kromarsky', '8456563255', 'Pastel', 6, 'Pastels', 98, '*'
union select 'Roizy', 'Glick', '8453784266', 'Paint 1', 10, 'Painting', 250, '*'
union select 'Esty', 'Davidson', '8453232582', 'Pastel', 8, 'Pastels', 60, '*'
union select 'Miriam', 'Rosner', '8459565689', 'Paint 1', 9, 'Painting', 200, '*'
union select 'Miri', 'Rabinowitz', '7183234572', 'Paint 1', 12, 'Painting', 170, '*'
union select 'Rachy', 'Godinger', '8452563487', 'Pastel', 4, 'Pastels', 50, '*'
union select 'Zeldy', 'Wienreb', '8456592541', 'Pastel', 6, 'Pastels', 100, '*'
union select 'Malka', 'Lowinger', '8457536498', 'Paint 2', 8, 'Painting', 150, '*'
union select 'Esther', 'Pollak', '8453251479', 'Paint 2', 12, 'Painting', 260, '*'
union select 'Etty', 'Reich', '8456593274', 'Paint 2', 8, 'Painting', 225, '-'

-- SM I left the last 2, because there were no group.