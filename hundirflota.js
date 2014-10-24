// Created to work together with Greasemonkey
// Carpeta de Salud: https://micarpetasalud.osakidetza.net/b65CarpetaSaludWar/login/inicio

var erabiltzailea = "I0000231"; // change this
var pasahitza = "12345678"; // Put here your passwoed
var itsas = ["A","B","D","E","F","G","H","I","J","K","L","M","N","O","P","R"];
var numitsas = [1,2,3,6,4,5,6,7,1,2,3,4,5,6,1,2,3]; //Change and put your numbers
var inputs, index;
inputs = document.getElementsByTagName('input');
for (index = 0; index < inputs.length; ++index) {
if(inputs[index].name == "numJuegoBarcos")
inputs[index].value=erabiltzailea;
else if(inputs[index].name == "clave")
inputs[index].value=pasahitza;
else if(inputs[index].name.indexOf("valorClavesAdicionales") != -1){
inputs[index].value=numitsas[itsas.indexOf(inputs[index].name[inputs[index].name.indexOf("\[")+1])];
}
}
