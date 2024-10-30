const botao = document.getElementById("but");

var t = false

botao.addEventListener("click", function(){
    if (t = false){
        botao.innerText = "Inscrito"
    }
    else{
        botao.innerText = "Inscreva-se"
    }
});
