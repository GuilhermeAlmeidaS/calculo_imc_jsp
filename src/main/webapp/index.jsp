<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Cáculo Web</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

<body>
    
    <form name="imcForm" id="imcForm" action="#">
    
    <div id="titulo"> Calculadora de IMC </div>

    <div id="texto">
    <p>
        Altura em metros <br />
        <input type="text" id="altura" name="altura" placeholder="0.00" />
    </p>

    <p>
        Peso em kg <br />
        <input type="text" id="peso" name="peso" placeholder="0.00" />
    </p>

    <div id="radio">
        <label>
        <input type="radio" name="sexo" value="opção" id="sexo_0"/> Masculino
        </label>
        <br />
        <label>
        <input type="radio" name="sexo" value="opção" id="sexo_1"/> Feminino
        </label>
    </div>
    
    <p>
        <input class=css_btn_class name="Enviar" type="submit" value="Calcular" />
    </p>
	
<%
String alturaStr = request.getParameter("altura");
String pesoStr = request.getParameter("peso");

if( pesoStr == null || alturaStr == null || pesoStr == "" || alturaStr == ""){
        return;
}

double peso = Double.parseDouble(pesoStr);
double altura = Double.parseDouble(alturaStr);
altura = altura == 0 ? 1 : altura;

double calculo = peso / (altura*altura);

String resultado = "";

if(calculo<18.5){
	resultado = "Você está magro com esse indice: " + calculo;
}
else if(calculo>=18.5 && calculo<24.9){
	resultado = "Você está normal com esse indice:" + calculo;
}
else if(calculo>=24.9 && calculo<29.9) {
	resultado = "Você está com sobre peso com esse indice: " + calculo;
}
else if(calculo>=29.9 && calculo<39.9) {
	resultado = "Você está com obesidade com esse indice: " + calculo;
}
else if (calculo>39.9) {
	resultado =  "Você está com obesidade grave com esse indice: " + calculo;
}
%>

	<div id="alert"> <%=resultado%> </div>
	
    </div>

  </form>
  
</body>