function começo(local) {
    
    setInterval(function(){
            const data = new Date();
        
            const dias = 5 - data.getDay();
            const horas = (24 - data.getHours())- 1;
            const minutos = 60 - data.getMinutes() - 1;
            const segundos = 60 - data.getSeconds() - 1;
            local.textContent =   dias + "d " + horas + "h " + minutos + "m " + segundos + "s"

        },1000)
    // const salvante = localStorage.getItem('tempinQresta')
    // if (salvante) {
    //     timer = Math.max(0, salvante - Math.floor((Date.now() - parseInt(localStorage.getItem('ComeçoDtempin'), 10)) /  1000))
    // } else {
    //     localStorage.setItem('ComeçoDtempin', Date.now())
    // }

    // setInterval(function () {
    //     let dia = parseInt(timer / 86400, 10)
    //     let horas = parseInt((timer % 86400) / 3600, 10)
    //     let minutos = parseInt((timer % 3600) / 60, 10)
    //     let segundos = parseInt(timer % 60, 10)

    //     minutos = minutos < 10 ? "0" + minutos : minutos
    //     segundos = segundos < 10 ? "0" + segundos : segundos
    //     horas = horas < 10 ? "0" + horas : horas
    //     dia = dia < 10 ? "0" + dia : dia

    //     local.textContent = dia + ":" + horas + ":" + minutos + ":" + segundos

    //     if (timer > 0) {
    //         timer--
    //         localStorage.setItem('tempinQresta', timer)
    //     } else {
    //         timer = 0
    //         localStorage.removeItem('tempinQresta')
    //         localStorage.removeItem('ComeçoDtempin')
    //     }
    // }, 1000);
}


const local = document.querySelector('#timer')

começo(local);

const msg = document.getElementById("msg")
const botao = document.getElementById("but")


var t = 0

const paragrafo = document.getElementById("zas")

msg.removeChild(paragrafo)

botao.addEventListener("click", function(){
    if (t == 0){
        botao.innerText = "Inscrito"
        botao.style.backgroundColor = "#385063"
        botao.style.filter = "drop-shadow( 0px 0px 5px black)"
        msg.appendChild(paragrafo)
        setInterval(function(){
            msg.removeChild(paragrafo)
        },3000)
        
        t++
    }
    else{
        botao.innerText = "Inscreva-se"
        botao.style.backgroundColor = "black"
        botao.style.filter = "drop-shadow( 0px 0px 5px #385063)"
        t--
    }
});
