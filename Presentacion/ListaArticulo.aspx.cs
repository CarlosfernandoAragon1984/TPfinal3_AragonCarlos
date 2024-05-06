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
    public partial class ListaArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HelperSecurity.Seguridad.EsAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permiso de admin para ingresar");
                Response.Redirect("Error.aspx", false);
            }
            ArticuloNegocio negocio = new ArticuloNegocio();
            Session.Add("ListaArticulos",negocio.Listar());
            dvgArticulo.DataSource = Session["ListaArticulos"];
            dvgArticulo.DataBind();
        }

        protected void dvgArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dvgArticulo.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id);
        }

        protected void dvgArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dvgArticulo.PageIndex = e.NewPageIndex;
            dvgArticulo.DataBind();
        }

        protected void txtfiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulos"];
            List<Articulo> fitrarLista = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtfiltro.Text.ToUpper()));
            dvgArticulo.DataSource = fitrarLista;
            dvgArticulo.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAvanzado.Checked)
            {
                txtfiltro.Enabled = !chkAvanzado.Checked;
            }
            else
            {
                txtfiltro.Enabled = !chkAvanzado.Checked;
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a $$");
                ddlCriterio.Items.Add("Menor a $$");
                ddlCriterio.Items.Add("Mayor a $$");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                dvgArticulo.DataSource = negocio.Filtrar
                    (ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text);
                
                dvgArticulo.DataBind();

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}