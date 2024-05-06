using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;
                Trainee user = new Trainee();
                TraineeNegocio traineeNegocio = new TraineeNegocio();
                //EmailServicio emailService = new EmailServicio();
                if (Validacion.validaTextoVacio(txtEmail) || Validacion.validaTextoVacio(txtPassword))
                {
                    Session.Add("error", "Debe completar ambos campos");
                    Response.Redirect("Error.aspx", false);
                }
                user.Email = txtEmail.Text;
                user.Pass = txtPassword.Text;
                
                user.Id = traineeNegocio.InsertarNuevo(user);
                Session.Add("usuario", user);

                //  emailService.ArmarCorreo(user.Email, "Bienvenida Trainee", "Hola te damos la bienvenida a la aplicación...");
                // emailService.EnviarMail();
                Response.Redirect("Inicio.aspx", false);
            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}