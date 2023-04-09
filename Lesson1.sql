
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
  ('3392B3C6-718A-4456-D769-9BC87C49569D','Christian Hughes','quam.a.felis@icloud.edu','Aug 24, 2023', NULL, NULL),
  ('1D9DF7AB-5A61-35E1-0D42-37245767CC43','Galena Lang','tellus@outlook.edu','May 2, 2023', NULL, NULL),
  ('91B19F5E-49A4-2769-8410-A95AA1125D44','Blythe Anthony','nulla.magna.malesuada@protonmail.edu','Aug 30, 2023', NULL, NULL),
  ('32B1ED73-FA91-32F5-C765-C34A957282B9','Ignatius Beach','in@hotmail.ca','Nov 12, 2023', NULL, NULL),
  ('1D093202-AA18-E586-EC9A-232DB888887C','Jada Slater','sit.amet@hotmail.org','Jul 30, 2023', NULL, NULL),
  ('C9B93978-D6E3-04F7-86D9-FE359212FEF9','Maryam Avery','dapibus.ligula@google.ca','Feb 26, 2023', NULL, NULL),
  ('791419C3-41BD-B12A-BF5D-A7CA67BCAA51','Shaeleigh Mueller','dictum.eu@hotmail.edu','Mar 14, 2022', NULL, NULL),
  ('78556C4B-F744-E5B3-39CA-C36F932B5425','Dalton Knapp','in.felis.nulla@protonmail.edu','Jan 21, 2024', NULL, NULL),
  ('732D812D-399A-A1B4-3D43-6DCA7CAAAD8D','Sybil Barker','consectetuer.euismod@yahoo.couk','Feb 12, 2023', NULL, NULL),
  ('856D6867-F5E0-332E-9C84-75CCE49CE127','Quinn Hammond','interdum@outlook.org','Jan 25, 2024', NULL, NULL);
GO

select *
from dbo.users

DELETE FROM dbo.users
