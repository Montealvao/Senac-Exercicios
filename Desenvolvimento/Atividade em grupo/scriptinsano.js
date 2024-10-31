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