USE [CATALOGO_WEB_DB]
GO

/****** Object:  StoredProcedure [dbo].[storedListar]    Script Date: 06/05/2024 10:45:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   procedure [dbo].[storedListar] as

Select A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Marca, C.Descripcion Categoria, A.IdMarca, A.IdCategoria, ImagenUrl, Precio 
from ARTICULOS A, MARCAS M, CATEGORIAS C 
where A.IdMarca = M.Id and A.IdCategoria = C.Id

GO


