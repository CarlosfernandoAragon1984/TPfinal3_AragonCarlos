<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="ListaArticulo.aspx.cs" Inherits="Presentacion.ListaArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align: center">Lista de Artículos</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <%-- Filtro común --%>
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtfiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtfiltro_TextChanged" />
            </div>
        </div>
        <%-- Filtro Avanzado --%>
        <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" ID="chkAvanzado" runat="server"
                    AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" />
            </div>
        </div>


    </div>
    <%if (chkAvanzado.Checked)
        { %>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                <asp:DropDownList runat="server" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Marca" />
                    <asp:ListItem Text="Categoria" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio" ID="lblCriterio" runat="server" />
                <asp:DropDownList runat="server" ID="ddlCriterio" AutoPostBack="true" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro" ID="Label1" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />

            </div>
        </div>
       <%-- <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Estado" ID="btnEstado" runat="server" />
                <asp:DropDownList runat="server" ID="ddlEstado" AutoPostBack="true" CssClass="form-control">
                     <asp:ListItem Text="Todos" />
                    <asp:ListItem Text="Activo" />
                    <asp:ListItem Text="Inactivo" />
                </asp:DropDownList>
            </div>--%>
      </div>
   
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Button Text="Buscar" runat="server" ID="btnBuscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
            </div>

        </div>
    </div>



    <%  } %>



    <asp:GridView ID="dvgArticulo" runat="server" DataKeyNames="Id"
        CssClass="table" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dvgArticulo_SelectedIndexChanged"
        OnPageIndexChanging="dvgArticulo_PageIndexChanging"
        AllowPaging="True" PageZise="5">



        <Columns>
           <%-- Columnas con propiedades de Articulos  --%>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />
            
       
           
            
            <%-- Columnas agregada para modificar Articulo valuar si se cambia por boton único  --%>
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true"  SelectText="Actualizar" />
            

        </Columns>
    </asp:GridView>
   
    <%-- Boton Agregar --%>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
