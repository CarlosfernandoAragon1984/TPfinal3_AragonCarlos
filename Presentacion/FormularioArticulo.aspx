<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="Presentacion.FormularioArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />    
    
    <div class="row">  
        <div class="col-6">  
            <div class="mb-3">   
              <lebel for="txtId" class ="form-label">ID </lebel>
              <asp:TextBox runat="server" ID="txtId"  CssClass="form-control" />  
            </div>
            <div class="mb-3">   
               <lebel for="txtCodigo" class ="form-label">Código </lebel>
               <asp:TextBox runat="server" ID="txtCodigo" Cssclass ="form-control"> </asp:TextBox> 
            </div>
            <div class="mb-3">   
               <lebel for="txtNombre" class ="form-label">Nombre</lebel>
               <asp:TextBox runat="server" ID="txtNombre" Cssclass ="form-control" > </asp:TextBox>   
            </div>
            
            <div class="mb-3">   
               <lebel for="txtPrecio" class ="form-label">Precio</lebel>
               <asp:TextBox runat="server" ID="txtPrecio" Cssclass ="form-control" > </asp:TextBox>   
            </div>
            
            <div class="mb-3">   
               <lebel for="ddlMarca" class ="form-label">Marca </lebel>
               <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"  ></asp:DropDownList>
            </div>
            <div class="mb-3">   
               <lebel for="ddlCategoria" class ="form-label">Categoria </lebel>
               <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select" ></asp:DropDownList>
            </div>
           
            <div class="mb-3 ">
               <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
               <a href="ListaArticulo.aspx">Cancelar</a>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>  
                     
                          <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" Onclick="btnEliminar_Click" runat="server" />
                             
                                 <% if (ConfirmaEliminacio)
                                       {%>

                                     
                                           <asp:CheckBox Text="Confirma Eliminar" ID="chkConfirmarEliminacion" runat="server" />
                                           <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger"  runat="server" />
                                     
              
                           
                                 <% } %>

                    </ContentTemplate>
                 </asp:UpdatePanel>
            </div>
        </div >
           
           




        <div class="col-6">
            <div class="mb-3">   
                 <lebel for="txtDescripcion" class ="form-label">Descripción </lebel>
                 <asp:TextBox runat="server" textMode="MultiLine" ID="txtDescripcion" Cssclass ="form-control" > </asp:TextBox>
            </div>
           
            <asp:UpdatePanel ID="UdatePanel1"   runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                      <label for="txtImagenUrl" class="form-label">Url imagen</label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged"/>
                    </div>
                    <asp:Image ImageUrl="https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_1280.png" runat="server" ID="imgArticulo" width="60%"/>


                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
        
    </div>
    <div class="row">   
        <div class="col-6">  
            
           

        </div>
        
    </div>
</asp:Content>
