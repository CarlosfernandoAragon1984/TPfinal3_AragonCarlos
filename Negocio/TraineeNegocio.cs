using Conexion;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
     public class TraineeNegocio
    {
        public int InsertarNuevo(Trainee nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProsedimiento("insertaNuevo");
                datos.SetParametros("@email", nuevo.Email);
                datos.SetParametros("@pass", nuevo.Pass);
                return datos.EjecutarAccionScalar();
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
        public bool Login(Trainee trainee)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetConsulta("Select id, email, pass, admin, nombre, apellido, urlImagenPerfil from USERS Where email = @email And pass = @pass");
                datos.SetParametros("@email", trainee.Email);
                datos.SetParametros("@pass", trainee.Pass);
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    trainee.Id = (int)datos.Lector["id"];
                    trainee.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                    {
                        trainee.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];
                    }
                    if (!(datos.Lector["nombre"] is DBNull))
                    {
                        trainee.Nombre = (string)datos.Lector["nombre"];
                    }
                    if (!(datos.Lector["apellido"] is DBNull))
                    {
                        trainee.Apellido = (string)datos.Lector["apellido"];
                    }
                  /*  if (!(datos.Lector["fechaNacimiento"] is DBNull))
                    {
                        trainee.FechaNacimiento = (DateTime)datos.Lector["fechaNacimiento"];
                    }*/

                    return true;
                }
                return false;
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
        public void actualizar(Trainee user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetConsulta("Update USERS set urlImagenPerfil = @imagen, Nombre = @nombre, Apellido = @apellido Where Id = @id");
                //datos.setearParametro("@imagen", user.ImagenPerfil != null ? user.ImagenPerfil : (object)DBNull.Value);
                datos.SetParametros("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);//operador null coalescing
                datos.SetParametros("@nombre", user.Nombre);
                datos.SetParametros("@apellido", user.Apellido);
                //datos.SetParametros("@fecha", user.FechaNacimiento);
                datos.SetParametros("@id", user.Id);
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
    }
}
