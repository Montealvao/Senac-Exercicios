function começo (duraçao,local){
    var timer = duraçao, minutos, segundos, horas, dia;

    setInterval(function(){

        dia = parseInt (timer / 86400, 10);
        horas = parseInt ((timer % 86400) / 3600, 10);
        minutos = parseInt ((timer % 3600) / 60, 10);
        segundos = parseInt (timer % 60, 10);

        minutos = minutos < 10 ? "0" + minutos : minutos;
        segundos = segundos < 10 ? "0" + segundos : segundos;
        horas = horas < 10 ? "0" + horas : horas;
        dia = dia < 10 ? "0" + dia : dia

        local.textContent = dia + ":" + horas + ":" + minutos + ":" + segundos;

        if (--timer < 0){
            timer = 0;
        }
    }, 1000);
}

window.onload = function(){
    var duraçao = 86400 * 10
    var local = document.querySelector('#timer')

    começo (duraçao,local)
}

const botao = document.getElementById("but");
botao.style.backgroundColor = "black"

var t = 0

botao.addEventListener("click", function(){
    if (t == 0){
        botao.innerText = "Inscrito"
        botao.style.backgroundColor = "#068595"
        botao.style.filter = "drop-shadow( 0px 0px 5px black)"
        t++
    }
    else{
        botao.innerText = "Inscreva-se"
        botao.style.backgroundColor = "black"
        botao.style.filter = "drop-shadow( 0px 0px 5px #068595)"
        t--
    }
});