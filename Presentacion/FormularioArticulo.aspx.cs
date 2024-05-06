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

    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmaEliminacio { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminacio = false;
            try
            {


                if (!IsPostBack)
                {



                    //configuaración de la pantalla De los deplegables Atributos o propiedades Marca y Categoria
                    MarcaNegocio negocioMarca = new MarcaNegocio();
                    List<Marca> listaMarca = negocioMarca.Listar();
                    ddlMarca.DataSource = listaMarca;
                    ddlMarca.DataValueField = "id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    CategoriaNegocio negocioCategoria = new CategoriaNegocio();
                    List<Categoria> listaCategoria = negocioCategoria.Listar();
                    ddlCategoria.DataSource = listaCategoria;
                    ddlCategoria.DataValueField = "id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();
                }

                //configuración si estamos modificando

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    List<Articulo> lista = negocio.Listar(id);
                    Articulo modificado = lista[0];

                    txtId.Text = id;
                    txtCodigo.Text = modificado.Codigo;
                    txtNombre.Text = modificado.Nombre;
                    txtPrecio.Text = modificado.Precio.ToString();
                    txtDescripcion.Text = modificado.Descripcion;
                    txtImagenUrl.Text = modificado.ImagenUrl;

                    ddlMarca.SelectedValue = modificado.marca.id.ToString();
                    ddlCategoria.SelectedValue = modificado.categoria.id.ToString();

                    //logro que cuando selecciones modificar y entre a la páginca de formulario la imagen este cargada.
                    txtImagenUrl_TextChanged(sender, e);

                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.ImagenUrl = txtImagenUrl.Text;

                nuevo.marca = new Marca();
                nuevo.marca.id = int.Parse(ddlMarca.SelectedValue);
                nuevo.categoria = new Categoria();
                nuevo.categoria.id = int.Parse(ddlCategoria.SelectedValue);





                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.Modificar(nuevo);
                }
                else
                {

                    negocio.Agregar(nuevo);

                }

                Response.Redirect("ListaArticulo.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.Message);
                Response.Redirect("Error.aspx", false);
            }
        }

       

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacio = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmarEliminacion.Checked)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    negocio.Eliminar(int.Parse(txtId.Text));
                    Response.Redirect("ListaArticulo.aspx");

                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
            }
        }
    }
}