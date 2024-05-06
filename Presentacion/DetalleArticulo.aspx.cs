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
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                   
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    List<Articulo> lista = negocio.Listar(id);
                    Articulo modificado = lista[0];

                    txtPrecio.Text = modificado.Precio.ToString();
                    txtDescripcion.Text = modificado.Descripcion;
                    imgArticulo.ImageUrl = modificado.ImagenUrl;
                    txtMarca.Text = modificado.marca.Descripcion;
                    
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }

               

                   

                    









        }


    }
}