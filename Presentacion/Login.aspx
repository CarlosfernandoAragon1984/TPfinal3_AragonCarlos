<%@ Page Title="" Language="C#" MasterPageFile="~/MImaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Presentacion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <style>

    .validacion {
            color: red;
            font-size: 12px;
        }

     .form-input {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
   </style>
    <script>   
        function Validar(){
            const txtEmail = document.getElementById("txtEmail");
           // const validarInBox = () => {
            if (txtEmail.value=="") {
                    alert("Ingrese el mail")
                    //txtEmail.classList.add("is-invalid")
                    //txtEmail.classList.remove("is-valid")
                    return false;
                } else {
                    //txtEmail.classList.add("is-valid")
                   // txtEmail.classList.remove("is-invalid")
                    return true;
                }
          //  }
          //  txtEmail.addEventListener('keyup', validarInBox)
            //txtEmail.addEventListener('Blur', validarInBox)
        }


       
    </script>

    <div class="row " style="margin-top: 50px" >
        <div class="col-4">
            <h2>Ingresar</h2>
            <div class="mb-3">
                <asp:Label ID="lblEmail" runat="server" CssClass="form-input" Text="Email"></asp:Label>
                <asp:TextBox  required   TextMode="Email"  runat="server" CssClass="form-control" ID="txtEmail" />
              
                <asp:RegularExpressionValidator ErrorMessage="Formato de email incorrecto.." CssClass="validacion" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtEmail" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPass" runat="server" CssClass="form-input" Text="Password"></asp:Label>
                <asp:TextBox  required runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" />
            </div>
            <asp:Button Text="Ingresar" OnClientClick="return Validar()" CssClass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
            <a href="/Inicio.aspx">Cancelar</a>

        </div>
    </div>
</asp:Content>
