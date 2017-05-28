<%-- 
    Document   : index
    Created on : 28/05/2017, 01:56:04
    Author     : Ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        
        
        <script type="text/javascript" src="js/js-jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="js/js-jquery-ui-1.8.21.custom.min.js"></script>
        
        <title>Login</title>
        
        <script type="text/javascript">            
            $(document).ready(function() {                   
                $("#ValidarUsuario").submit(function() {
                   $.post("ValidarUsuario", $("#ValidarUsuario").serialize(), function(data) {
                       perfil = jQuery.trim(data);
                       if(perfil =="1") document.location.href = "page/Administrador/inicio.jsp";
                       else if(perfil == "2") document.location.href = "";
                       else $("#mensaje-ingreso").html("Usuario o Clave invalida"); 
                   });
                   return false;
                });
            });
        </script>              
    </head>
    <body>        
        <div class="container">
          <div id="login-form">
            <h3>Iniciar Sesión</h3>
            <fieldset>
                <form name="ValidarUsuario" id="ValidarUsuario" action="ValidarUsuario" method="POST">
                    <input type="text" required value="Usuario" onBlur="if(this.value=='')this.value='Usuario'" onFocus="if(this.value=='Usuario')this.value='' " name="usuario" id="usuario" /> 
                    <input type="password" required value="Password" onBlur="if(this.value==''){this.value='Password'}" onFocus="if(this.value=='Password'){this.value=''}" name="clave" id="clave" /> 
                    <input type="submit" value="Ingresar" name="ingresar" id="ingresar"/>
                </form>   
            </fieldset>
            
            <div id="mensaje-ingreso">                
            </div>  
          </div> 
        </div>        
    </body>
</html>
