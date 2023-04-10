
-- 1) Create script which creates 'Users' table with the following columns:
--Field name  Field Type
--Id          GUID, not null, primary key
--Username    string, max length 64 symbols, not null
--Email       string, max length 128 symbols, not null
--CreatedAt   Date & Time, not null
--ModifiedAt  Date & Time, null
--DeletedAt   Date & Time, null

drop table if exists [dbo].[users]
drop table if exists [dbo].[profiles]
GO

CREATE TABLE [dbo].[users](
	Id uniqueidentifier NOT NULL,
	Username varchar(64) NOT NULL,
	Email varchar (128) NOT NULL,
	CreatedAt datetime NOT NULL,
	ModifiedAt datetime NULL,
	DeletedAt datetime NULL,
	PRIMARY KEY (ID)
)
GO

--2) Create script which creates 'Profiles' table with the following columns:

--Id            GUID, not null, primary key
--UserId        GUID, not null, 1 to 1 relation with Users table - foreign key
--FirstName     string, max length 128 symbols, not null
--LastName      string, max length 128 symbols, not null
--Birthday      Date, not null
--Gender        Only 'male' or 'female' values are possible, null
--CreatedAt     Date & Time, not null
--ModifiedAt    Date & Time, null

CREATE TABLE [dbo].[profiles](
	Id uniqueidentifier NOT NULL PRIMARY KEY,
	UserId uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Users(Id),
	FirstName varchar (128) NOT NULL,
	LastName varchar (128) NOT NULL,
	Birthday date NOT NULL,
	Gender varchar(10) NOT NULL CHECK (Gender IN ('female', 'male')),
	CreatedAt datetime NOT NULL,
	ModifiedAt datetime NULL
	)
GO

INSERT INTO [dbo].[users] (Id, Username, Email, CreatedAt, ModifiedAt, DeletedAt)
VALUES
  ('3392B3C6-718A-4456-D769-9BC87C49569D','C_Hughes','quam.a.felis@icloud.edu','Aug 24, 2023', NULL, NULL),
  ('1D9DF7AB-5A61-35E1-0D42-37245767CC43','G_Lang','tellus@outlook.edu','May 2, 2023', NULL, NULL),
  ('91B19F5E-49A4-2769-8410-A95AA1125D44','B_Anthony','nulla.magna.malesuada@protonmail.edu','Aug 30, 2023', NULL, NULL),
  ('32B1ED73-FA91-32F5-C765-C34A957282B9','I_Beach','in@hotmail.ca','Nov 12, 2023', NULL, NULL),
  ('1D093202-AA18-E586-EC9A-232DB888887C','J_Slater','sit.amet@hotmail.org','Jul 30, 2023', NULL, NULL),
  ('C9B93978-D6E3-04F7-86D9-FE359212FEF9','M_Avery','dapibus.ligula@google.ca','Feb 26, 2023', NULL, NULL),
  ('791419C3-41BD-B12A-BF5D-A7CA67BCAA51','S_Mueller','dictum.eu@hotmail.edu','Mar 14, 2022', NULL, NULL),
  ('78556C4B-F744-E5B3-39CA-C36F932B5425','D_Knapp','in.felis.nulla@protonmail.edu','Jan 21, 2024', NULL, NULL),
  ('732D812D-399A-A1B4-3D43-6DCA7CAAAD8D','S_Barker','consectetuer.euismod@yahoo.couk','Feb 12, 2023', NULL, NULL),
  ('856D6867-F5E0-332E-9C84-75CCE49CE127','Q_Hammond','interdum@outlook.org','Jan 25, 2024', NULL, NULL);
GO

select *
from dbo.users

DELETE FROM dbo.users
DELETE FROM dbo.profiles

INSERT INTO [dbo].[profiles] (Id, UserId, FirstName, LastName, Birthday, Gender, CreatedAt, ModifiedAt)
VALUES
  ('591fa902-db7f-4f52-9661-e23cb8bf2914', '3392B3C6-718A-4456-D769-9BC87C49569D','Christian', 'Hughes', 'May 28, 1984','male', 'Aug 24, 2023', NULL),
  ('612886e7-bba3-42b8-86fe-2ffa410df6f8', '1D9DF7AB-5A61-35E1-0D42-37245767CC43','Galena', 'Lang','Nov, 1995','female', 'May 2, 2023', NULL),
  ('36beed1e-ae12-45d9-81bf-abc99bee67e6','91B19F5E-49A4-2769-8410-A95AA1125D44','Blythe', 'Anthony','Apr 12, 1990','male', 'Aug 30, 2023', NULL),
  ('61757163-5d45-4ce2-bd37-a156df885779','32B1ED73-FA91-32F5-C765-C34A957282B9','Ignatius','Beach','Dec 12, 1991','male', 'Nov 12, 2023', NULL),
  ('571d7f0c-a2d9-4ecc-a10a-106f2a2398a4', '1D093202-AA18-E586-EC9A-232DB888887C','Jada','Slater','Dec 14, 1998','female', 'Jul 30, 2023', NULL),
  ('7d1c0730-d3c8-4c4b-8708-10e0adfabaa8','C9B93978-D6E3-04F7-86D9-FE359212FEF9','Maryam','Avery','Mar 23, 1988','female','Feb 26, 2023', NULL),
  ('4fc93f3a-eeaa-40db-b82d-b133cb5d4896', '791419C3-41BD-B12A-BF5D-A7CA67BCAA51','Shaeleigh','Mueller','Dec 30, 2010','male', 'Mar 14, 2022', NULL),
  ('a810ecc7-0ebd-4e22-af31-7d59de66746c','78556C4B-F744-E5B3-39CA-C36F932B5425','Dalton', 'Knapp','Jun 12, 1980','male','Jan 21, 2024', NULL),
  ('4a8eee96-ac3f-49e2-b03b-04b03fe0246e', '732D812D-399A-A1B4-3D43-6DCA7CAAAD8D','Sybil','Barker','Aug 1, 2010','female','Feb 12, 2023', NULL),
  ('e5953e7d-628f-446e-a725-652aaa24690e','856D6867-F5E0-332E-9C84-75CCE49CE127','Quinn','Hammond','Feb 15,1999','female','Jan 25, 2024', NULL);
GO

select *
from dbo.profiles

select *
from dbo.users u
inner join dbo.profiles p
  on u.Id = p.UserId
