USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[insertaNuevo]    Script Date: 06/05/2024 10:43:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[insertaNuevo] 
@email varchar(100),
@pass varchar(20)
as
insert into USERS (email, pass, admin) output inserted.id values (@email, @pass, 0)

GO


