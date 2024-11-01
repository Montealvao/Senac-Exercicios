const botao = document.getElementById("but");
botao.style.backgroundColor = "red"

var t = 0

botao.addEventListener("click", function(){
    if (t == 0){
        botao.innerText = "Inscrito"
        botao.style.backgroundColor = "green"
        t++
    }
    else{
        botao.innerText = "Inscreva-se"
        botao.style.backgroundColor = "red"
        t--
    }
});
