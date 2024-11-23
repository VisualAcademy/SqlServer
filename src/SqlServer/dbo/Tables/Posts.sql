CREATE TABLE [Posts] (
     [Id] int NOT NULL IDENTITY,
     [Title] nvarchar(max) NOT NULL,
     [Contents] nvarchar(max) NOT NULL,
     [Tags] nvarchar(max) NOT NULL,
     [Visits] nvarchar(max) NOT NULL,
     CONSTRAINT [PK_Posts] PRIMARY KEY ([Id])
);
