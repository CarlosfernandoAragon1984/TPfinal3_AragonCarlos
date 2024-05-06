<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Presentacion.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        img {
            width: 100%;
            height: 300px;
        }
    </style>
    <nav class="navbar navbar-light bg-black  ">
        <div class="container-fluid  d-flex justify-content-center ">
            <div class=" row w-50 ">
                <div class="col-8">
                    <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />

                </div>
                <div class="col-4">
                    <button class="btn btn-outline-light " type="submit" onclick="btnBuscar">Buscar </button>
                </div>
            </div>
        </div>
    </nav>

    <div class="row row-cols-1 row-cols-md-4 g-4 mt-5  ">
        <asp:Repeater ID="repRepetidor" runat="server">

            <ItemTemplate>


                <div class="col ">

                    <div class="card  text-center ">

                        <img src="<%#Eval("ImagenUrl")  %>" class="card-img-top mx-auto d-block  " alt="...">

                        <div class="card-body row align-items-end">
                            <div class="text-no-wrap product-card-design6-vertical__price price font-6 line-clamp-1 mt-2 px-1 text-center" style="color: black">
                                <span class="mr-1" style="color: #000; font-weight: 600">$</span>
                                <span style="color: #000; font-weight: 600; font-style: italic"><%#Eval ("Precio") %></span>
                                <span class="mr-1" style="color: #000; font-weight: 800">-</span>
                            </div>
                            <h5 class="card-title" runat="server" id="txtNombre"><%#Eval("Nombre") %></h5>

                            <p class="card-text "><%#Eval("Descripcion") %></p>


                            <%-- <a href="DetalleArticulo.aspx?id=<%#Eval("Id") %>">ver detalle</a>--%>

                            <div class="row align-content-center">
                                <div class="col-6">
                                        <asp:Button Text="Detalle" CssClass="btn btn-primary" runat="server" ID="Button1" CommandArgument='<%#Eval("id") %>' CommandName="ArticulosId" OnClick="btnEjemplo_Click" />
                                     </div>

                                <% if (HelperSecurity.Seguridad.SessionActiva(Session["usuario"]))
                                    {%>
                                     <div class="col-6">
                                        <asp:Button Text="Favorito" CssClass="btn btn-success" runat="server" ID="btnFavorito" CommandArgument='<%#Eval("id") %>' CommandName="ArticulosId" OnClick="btnFavorito_Click" OnClientClick="alert('AGREGADO A FAVORITO')" />
                                     </div>
                                     

                                <% } %>



                            </div>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>














</asp:Content>
