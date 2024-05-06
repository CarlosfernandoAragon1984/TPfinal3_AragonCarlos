using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Conexion;
using Dominio;

namespace Negocio
{
   public class ArticuloNegocio
    {
        public List<Articulo> Listar(string id ="")
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "select Codigo,Nombre,A.id,A.Descripcion,M.Descripcion as Marca,C.Descripcion as Categoria,ImagenUrl,Precio,A.IdMarca,A.IdCategoria from ARTICULOS A,CATEGORIAS C, MARCAS M where IdMarca=M.Id and C.Id=IdCategoria  ";
                if (id != "")
                {
                    consulta += " and A.id = " + id;
                }
                
                datos.SetConsulta(consulta);
                datos.EjecutarLectura();
                
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["id"];
                    if (!(datos.Lector["Codigo"] is DBNull))
                    {
                        aux.Codigo = (string)datos.Lector["Codigo"];
                    }
                    if (!(datos.Lector["Nombre"] is DBNull))
                    {
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    }
                    if (!(datos.Lector["Descripcion"] is DBNull))
                    {
                        aux.Descripcion = (string)datos.Lector["Descripcion"];
                    }


                    aux.marca = new Marca();

                    aux.marca.id = (int)datos.Lector["IdMarca"];
                    if (!(datos.Lector["Marca"] is DBNull))
                    {
                        aux.marca.Descripcion = (string)datos.Lector["Marca"];
                    }

                    aux.categoria = new Categoria();

                    aux.categoria.id = (int)datos.Lector["IdCategoria"];
                    if (!(datos.Lector["Categoria"] is DBNull))
                    {
                        aux.categoria.Descripcion = (string)datos.Lector["Categoria"];
                    }
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                    {
                        aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    }
                    if (!(datos.Lector["Precio"] is DBNull))
                    {
                        aux.Precio = (decimal)datos.Lector["Precio"];
                    }


                    lista.Add(aux);

                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }

        }
        public List<int> listarFavoritos(int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            List<int> lista = new List<int>();

            try
            {
                datos.SetConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.SetParametros("idUser", idUser);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
                    lista.Add(aux);
                }

                datos.CerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
       
        public void Agregar(Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetConsulta("insert into ARTICULOS (Codigo,Nombre,Descripcion,IdMarca,IdCategoria,ImagenUrl,Precio)values(@Codigo,@Nombre,@Descripcion,@IdMarca,@IdCategoria,@ImagenUrl,@Precio)");
                datos.SetParametros("@Codigo", nuevo.Codigo);
                datos.SetParametros("@Nombre", nuevo.Nombre);
                datos.SetParametros("@Descripcion", nuevo.Descripcion);
                datos.SetParametros("@IdMarca", nuevo.marca.id);
                datos.SetParametros("@IdCategoria", nuevo.categoria.id);
                datos.SetParametros("@ImagenUrl", nuevo.ImagenUrl);
                datos.SetParametros("@Precio", nuevo.Precio);

                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void Modificar(Articulo modificado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetConsulta("update ARTICULOS set Codigo=@Codigo,Nombre=@Nombre,Descripcion=@Desc,IdMarca=@IdMarca,IdCategoria=@IdCategoria,ImagenUrl=@Url,Precio=@Precio where id=@id");
                datos.SetParametros("@Codigo", modificado.Codigo);
                datos.SetParametros("@Nombre", modificado.Nombre);
                datos.SetParametros("@Desc", modificado.Descripcion);
                datos.SetParametros("@IdMarca", modificado.marca.id);
                datos.SetParametros("@IdCategoria", modificado.categoria.id);
                datos.SetParametros("@Url", modificado.ImagenUrl);
                datos.SetParametros("@Precio", modificado.Precio);
                datos.SetParametros("@id", modificado.Id);

                datos.EjecutarAccion();
            }

            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void Eliminar(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.SetConsulta("delete from ARTICULOS where id =@id ");
                datos.SetParametros("@id", id);
                datos.EjecutarAccion();
                datos.CerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }

        }
        public List<Articulo> Filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consultas = "select Codigo,Nombre,A.Descripcion,M.Descripcion as Marca,C.Descripcion as Categoria,Precio from ARTICULOS A,CATEGORIAS C, MARCAS M where IdMarca=M.Id and C.Id=IdCategoria and ";

                switch (campo)
                {
                    case "":
                        switch (criterio)
                        {
                            case "Menor a":
                                consultas = consultas + " A.id <" + filtro;
                                break;
                            case "Igual a":
                                consultas = consultas + " A.id =" + filtro;
                                break;
                            case "Mayor a":
                                consultas = consultas + " A.id >" + filtro;
                                break;
                            default:
                                break;
                        }
                        break;
                    case "Precio":
                        switch (criterio)
                        {
                            case "Menor a $$":
                                consultas = consultas + " Precio <" + filtro;
                                break;
                            case "Igual a $$":
                                consultas = consultas + " Precio =" + filtro;
                                break;
                            case "Mayor a $$":
                                consultas = consultas + " Precio > " + filtro;
                                break;
                            default:
                                break;
                        }
                        break;
                    case "Nombre":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consultas = consultas + " Nombre like'" + filtro + "%'";
                                break;
                            case "Contiene ...":
                                consultas = consultas + " Nombre like'%" + filtro + "%'";
                                break;
                            case "Termina con":
                                consultas = consultas + " Nombre like'%" + filtro + "'";
                                break;
                            default:
                                break;
                        }
                        break;
                    case "Marca":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consultas = consultas + " Marca like'" + filtro + "%'";
                                break;
                            case "Contiene ...":
                                consultas = consultas + " Marca like'%" + filtro + "%'";
                                break;
                            case "Termina con":
                                consultas = consultas + " Marca like'%" + filtro + "'";
                                break;
                            default:
                                break;
                        }
                        break;
                    case "Categoría":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consultas = consultas + " Categoria like'" + filtro + "%'";
                                break;
                            case "Contiene ...":
                                consultas = consultas + " Categoria like'%" + filtro + "%'";
                                break;
                            case "Termina con":
                                consultas = consultas + " Categoria like'%" + filtro + "'";
                                break;
                            default:
                                break;
                        }
                        break;




                    default:

                        break;
                }

                datos.SetConsulta(consultas);
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                   
                    if (!(datos.Lector["Codigo"] is DBNull))
                    {
                        aux.Codigo = (string)datos.Lector["Codigo"];
                    }
                    if (!(datos.Lector["Nombre"] is DBNull))
                    {
                        aux.Nombre = (string)datos.Lector["Nombre"];

                    }
                    if (!(datos.Lector["Descripcion"] is DBNull))
                    {
                        aux.Descripcion = (string)datos.Lector["Descripcion"];
                    }


                    aux.marca = new Marca();

                    
                    if (!(datos.Lector["Marca"] is DBNull))
                    {
                        aux.marca.Descripcion = (string)datos.Lector["Marca"];
                    }

                    aux.categoria = new Categoria();

                   
                    if (!(datos.Lector["Categoria"] is DBNull))
                    {
                        aux.categoria.Descripcion = (string)datos.Lector["Categoria"];
                    }
                   
                    if (!(datos.Lector["Precio"] is DBNull))
                    {
                        aux.Precio = (decimal)datos.Lector["Precio"];
                    }


                    lista.Add(aux);

                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Articulo> listarArticuloConID(List<int> listaArtId)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = "Select A.Id, Codigo, Nombre, A.Descripcion, M.Descripcion Marca, C.Descripcion Categoria, A.IdMarca, A.IdCategoria, ImagenUrl, Precio from ARTICULOS A, MARCAS M, CATEGORIAS C where A.IdMarca = M.Id and A.IdCategoria = C.Id and A.Id IN (" + string.Join(",", listaArtId) + ")";
                datos.SetConsulta(consulta);

                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    if (!(datos.Lector["Descripcion"] is DBNull))
                    {
                        aux.Descripcion = (string)datos.Lector["Descripcion"];
                    }
                    aux.marca = new Marca();
                    aux.marca.id = (int)datos.Lector["idMarca"];
                    aux.marca.Descripcion = (string)datos.Lector["Marca"];

                    aux.categoria = new Categoria();
                    aux.categoria.id = (int)datos.Lector["idCategoria"];
                    aux.categoria.Descripcion = (string)datos.Lector["Categoria"];

                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    lista.Add(aux);

                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public void insertarFavorito(ArticuloFavorito nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetConsulta("Select count(*) FROM FAVORITOS Where IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.SetParametros("idUser", nuevo.IdUser);
                datos.SetParametros("idArticulo", nuevo.IdArticulo);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    if (cantidad > 0)
                    {
                        datos.CerrarConexion();
                        return;
                    }
                }

                datos.CerrarConexion();
                datos = new AccesoDatos();
                datos.SetConsulta("Insert into FAVORITOS (IdUser, IdArticulo) VALUES (@idUser, @idArticulo)");
                datos.SetParametros("@idUser", nuevo.IdUser);
                datos.SetParametros("idArticulo", nuevo.IdArticulo);
                datos.EjecutarAccion();
                datos.CerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public void eliminarFavorito(int idArticulo, int idUser)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.SetConsulta("Delete from FAVORITOS Where IdArticulo = @idArticulo AND IdUser = @idUser");
                datos.SetParametros("idArticulo", idArticulo);
                datos.SetParametros("idUser", idUser);
                datos.EjecutarLectura();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
