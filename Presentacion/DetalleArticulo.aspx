<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="Presentacion.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="row " style="margin-top: 50px">
        <div class="col-6">

            <asp:UpdatePanel ID="UdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:Image ImageUrl="https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_1280.png" runat="server" ID="imgArticulo" class="img-fluid" />


                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <div class="col-6 ">
            <div class="mb-3 ">
                <lebel for="txtDescripcion" class="form-label">Descripción</lebel>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control"> </asp:TextBox>
            </div>

            <div class="mb-3">
                <lebel for="txtPrecio" class="form-label">Precio</lebel>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control"> </asp:TextBox>
            </div>


            <div class="mb-3">
                <lebel for="ddlMarca" class="form-label">Marca </lebel>
                <asp:TextBox runat="server" ID="txtMarca" CssClass="form-control"> </asp:TextBox>

            </div>
           

        </div>

    </div>



</asp:Content>
