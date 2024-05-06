using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Inicio : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("ListaArticulos", negocio.Listar());
                ListaArticulo = negocio.Listar();
                repRepetidor.DataSource = ListaArticulo;
                repRepetidor.DataBind();
                
            }


            
           

        }

        protected void btnEjemplo_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("DetalleArticulo.aspx?id=" + id);
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            List<Articulo> fitrarLista = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            repRepetidor.DataSource = fitrarLista;
            repRepetidor.DataBind();
            
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            Session.Add("idFavorito",id);
            Trainee user = (Trainee)Session["usuario"];
            if (id != "" && user!=null)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                ArticuloFavorito nuevo = new ArticuloFavorito();

                nuevo.IdUser = user.Id;
                nuevo.IdArticulo = int.Parse(id);

                negocio.insertarFavorito(nuevo);
                
                Session["idFavorito"] = null;
            }
            else
            {
                Response.Redirect("Login.aspx",false);
            }
        }


           
            
    }
}