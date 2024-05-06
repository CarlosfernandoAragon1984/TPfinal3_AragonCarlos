using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using HelperSecurity;

namespace Presentacion
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            imgAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
            if (Page is Inicio)
            {
                if (Seguridad.SessionActiva(Session["usuario"]))
                {
                    Trainee user = (Trainee)Session["usuario"];
                    lblUser.Text = user.Email;
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;
                }
            }
            if (!(Page is Login || Page is Registro || Page is Inicio || Page is DetalleArticulo|| Page is Error))
            {
               
                
                    if (!Seguridad.SessionActiva(Session["usuario"]))
                    {
                        Response.Redirect("Login.aspx", false);
                    }

                
                else
                {
                    Trainee user = (Trainee)Session["usuario"];
                    if (user.Nombre != null && user.Apellido != null)
                    {
                        lblUser.Text = user.Nombre + " " + user.Apellido;
                    }
                    else
                    {
                        lblUser.Text = user.Email;
                    }

                    // IsNullOrEmpty es preguntar si es null o es vacio="";
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;
                }

            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx", false);
        }
    }
}