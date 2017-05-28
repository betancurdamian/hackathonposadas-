<%-- 
    Document   : Usuarios
    Created on : 28/05/2017, 01:56:04
    Author     : Ariel
--%>

    <%@page import="model.Usuario"%>
<%@page import="database.BaseDatos"%>
<jsp:include page="structPage/head.jsp"></jsp:include>
        <title>Administrador</title>  
            </head>
        <body>
     
    <%
        // variable que muestra los mensajes del sistema
         String mensaje="";
        //Identificamos el boton que el usuario presiono
        boolean consultar = false;
        boolean nuevo = false;
        boolean modificar = false;
        boolean borrar = false;
        boolean limpiar = false;
        boolean listar = false;
    
        if(request.getParameter("consultar")!=null) consultar=true;
        if(request.getParameter("nuevo")!=null) nuevo=true;
        if(request.getParameter("modificar")!=null) modificar=true;
        if(request.getParameter("borrar")!=null) borrar=true;
        if(request.getParameter("limpiar")!=null) limpiar=true;
        if(request.getParameter("listar")!=null) listar=true;
        
                 
        // Obtenemos el valor como fue llamado el formulario
        String ID_Usuario="";
        String nombres="";
        String apellidos="";
        String password="";
        String Confirmacion_password="";
        String perfil="";
        String foto="";       
        
        if(request.getParameter("ID_Usuario")!=null) ID_Usuario=request.getParameter("ID_Usuario");
        if(request.getParameter("nombres")!=null) nombres=request.getParameter("nombres");
        if(request.getParameter("apellidos")!=null) apellidos=request.getParameter("apellidos");
        if(request.getParameter("password")!=null) password=request.getParameter("password");
        if(request.getParameter("Confirmacion_password")!=null) Confirmacion_password=request.getParameter("Confirmacion_password");
        if(request.getParameter("perfil")!=null) perfil=request.getParameter("perfil");
        if(request.getParameter("foto")!=null) foto=request.getParameter("foto");
        
        // Si presiona el boton consultar
        if(consultar){
            if(ID_Usuario==""){
                mensaje = "debe ingresar un usuario";
            }else{
                BaseDatos misDatos = new BaseDatos();
                Usuario miUsuario = misDatos.getUsuario(ID_Usuario);
                if(miUsuario==null){
                    mensaje = "usuario no existe";
                }else{
                    ID_Usuario = miUsuario.getIdUsuario();                    
                    nombres = miUsuario.getNombres();
                    apellidos = miUsuario.getApellidos();
                    password = miUsuario.getClave();
                    Confirmacion_password = miUsuario.getClave();
                    perfil = ""+miUsuario.getIdPerfil();
                    foto = miUsuario.getFoto();
                    mensaje = "usuario consultado";
                }
                misDatos.cerrarConexion();
            }
        }
        
        if(limpiar){
                    ID_Usuario = "";                    
                    nombres = "";
                    apellidos = "";
                    password = "";
                    Confirmacion_password = "";
                    perfil = "";
                    foto = "";
                    mensaje = "";          
        }
    %>
    <jsp:include page="structPage/headers/header.jsp"></jsp:include>
    <jsp:include page="structPage/navs/nav.jsp"></jsp:include>                   
    
    <section>
    <div class="container" role="document">
    
        <div class="row">
            
          <div>
            <h3 style="border-bottom: 1px solid #ddd;">Registrar Usuario</h3>
          </div>
            
          <div class="col-md-6">            
            <form class="simple_form new_user" name="usuarios" id="usuarios" action="Usuarios.jsp" method="POST">

                <div class="form-group">
                  <label class="text optional control-label" for="ID_Usuario">ID Usuario</label>
                  <input autofocus="autofocus" class="string email required form-control" id="ID_Usuario" name="ID_Usuario" placeholder="Ingrese el Usuario"  type="text" value="<%=ID_Usuario%>" size="10"/>
                </div>
                
                <div class="form-group">
                  <label class="text optional control-label" for="nombres">Nombres</label>
                  <input class="string email required form-control" id="nombres" name="nombres" placeholder="Ingrese el Nombre"  type="text" value="<%=nombres%>" size="30" />
                </div>
                
                <div class="form-group">
                  <label class="text optional control-label" for="apellidos">Apellidos</label>
                  <input class="string email required form-control" id="apellidos" name="apellidos" placeholder="Ingrese el Apellido"  type="text" value="<%=apellidos%>" size="30" />
                </div>                                

                <div class="form-group">
                  <label class="password optional control-label" for="password">Password</label>
                  <input class="form-control" id="password" name="password" placeholder="Ingrese el password"  type="password" value="<%=password%>" size="10" />
                </div>
                
                <div class="form-group">
                  <label class="password optional control-label" for="Confirmacion_password">Confirmación Password</label>
                  <input class="form-control" id="Confirmacion_password" name="Confirmacion_password" placeholder="Ingrese el password nuevamente"  type="password" value="<%=Confirmacion_password%>" size="10" />
                </div>
                
                <div class="form-group">
                  <label class="text optional control-label" for="perfil">Perfil</label>
                  
                  <select class="string email required form-control" name="perfil" id="perfil" placeholder="Ingrese el Perfil"  >
                      <option value="0" <%=(perfil.equals("") ? "selected": "")%> >
                          Seleccione perfil...
                      </option>
                      <option value="1" <%=(perfil.equals("1") ? "selected": "")%> >
                          Administrador
                      </option>
                      <option value="2" <%=(perfil.equals("2") ? "selected": "")%> >
                          Cajero
                      </option>
                      <option value="3" <%=(perfil.equals("3") ? "selected": "")%> >
                          Encargado de Sucursal
                      </option>
                      <option value="4" <%=(perfil.equals("4") ? "selected": "")%> >
                          Encargado de Deposito
                      </option>
                  </select>
                </div>
                
                <div class="form-group">
                  <label class="text optional control-label" for="foto">Foto</label>
                  <input class="string email required form-control" id="foto" name="foto" placeholder="Ingrese la foto"  type="file" value="<%=foto%>" size="60" />
                </div>
                <br>    
                <jsp:include page="structPage/botones/botones.jsp"></jsp:include>
            </form>
            <br>
            <div>
            <h4><%=mensaje%></h4>
            </div>
          </div>
        </div>
  </div>
</section>
<br>
<br>
    
    <jsp:include page="structPage/footer.jsp"></jsp:include>