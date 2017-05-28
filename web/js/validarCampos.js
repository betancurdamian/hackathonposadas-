function validarFormulario(evObject) {
evObject.preventDefault();
var todoCorrecto = true;
var formulario = document.ValidarUsuario;
for (var i=0; i<formulario.length; i++) {
                if(formulario[i].type =='text') {
                               if (formulario[i].value == null){
                               alert (formulario[i].name+ ' El campo usuario esta vacio');
                               todoCorrecto=false;
                               }
                               
                               if (formulario[i].value.length == 0){
                               alert (formulario[i].name+ ' No ha ingresado un usuario');
                               todoCorrecto=false;
                               }
                               
                               if (/^\s*$/.test(formulario[i].value)){
                               alert (formulario[i].name+ ' no puede contener sólo espacios en blanco');
                               todoCorrecto=false;
                               }
                               
                               if (formulario[i].value ==  'Tipo Usuario'){
                               alert ('el usuario no puede ser "Tipo Usuario"');
                               todoCorrecto=false;
                               }
                }
                if(formulario[i].type =='password') {
                               if (formulario[i].value == null ){
                               alert ('El password esta Vacio, por favor introduzca el password');
                               todoCorrecto=false;
                               }
                               
                               if (formulario[i].value.length == 0){
                               alert ('No ha ingresado el password');
                               todoCorrecto=false;
                               }
                               
                               if (/^\s*$/.test(formulario[i].value)){
                               alert ('Ingrese una contraseña que no sean espacios en blanco');
                               todoCorrecto=false;
                               }
                               
                               if (formulario[i].value == "Password"){
                               alert ('Ingrese una contraseña que no sea "Password"');
                               todoCorrecto=false;
                               }
                }
                
                
                }
if (todoCorrecto ==true) {formulario.submit();}
}