<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="Favorito.aspx.cs" Inherits="Presentacion.Favorito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="justify-content:center;background-color:wheat;text-align:center">Lista de Favoritos </h1>

    <asp:GridView ID="dvgArticulo" runat="server" DataKeyNames="Id"
        CssClass="table" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dvgArticulo_SelectedIndexChanged">
        <%--OnPageIndexChanging="dvgArticulo_PageIndexChanging"--%>
        <%--AllowPaging="True" PageZise="5"--%>



        <Columns>
            <%-- Columnas con propiedades de Articulos  --%>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
            <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" />



            <%-- Columnas agregada para modificar Articulo valuar si se cambia por boton único  --%>
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="Eliminar" />


        </Columns>
    </asp:GridView>

    <%-- Boton Agregar --%>
</asp:Content>
