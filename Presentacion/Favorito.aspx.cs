using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace Presentacion
{
    public partial class Favorito : System.Web.UI.Page
    {


        public List<Articulo> listaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                Trainee user = (Trainee)Session["usuario"];
              

                listaProductos = new List<Articulo>();

                if (user != null)
                {
                    ArticuloNegocio negocioArticulo = new ArticuloNegocio();
                    List<int> idArticulosFav = negocioArticulo.listarFavoritos(user.Id);

                    if (idArticulosFav.Count > 0)
                    {
                        ArticuloNegocio favorito = new ArticuloNegocio();
                        listaProductos = favorito.listarArticuloConID(idArticulosFav);
                        dvgArticulo.DataSource = listaProductos;
                        dvgArticulo.DataBind();

                    }


                }
                else
                {
                    Session.Add("error", "Debe ser usuario para ingresar");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("error",ex.Message);
                Response.Redirect("Error.aspx", false);
            }

               










        }


        protected void dvgArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            Trainee user = (Trainee)Session["usuario"];


            string id = dvgArticulo.SelectedDataKey.Value.ToString();
            int Id = int.Parse(id.ToString());
            int IdUser = user.Id; ;
            negocio.eliminarFavorito(Id, IdUser);

            Response.Redirect("Favorito.aspx", false);
        }
    }

}   //protected void dvgArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    dvgArticulo.PageIndex = e.NewPageIndex;
    //    dvgArticulo.DataBind();
    //}
















