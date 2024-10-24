const botao = document.createElement("button")
botao.innerText = "Clicar"
botao.style.width = "30rem"
botao.style.height= "20rem"
botao.style.fontSize = "10rem"


const texto = document.createElement("h1")
texto.style.color = "white"
texto.style.fontSize = "6rem"

const elemento = document.getElementsByTagName("body")
elemento[0].appendChild(botao)

elemento[0].style.display = "flex"
elemento[0].style.gap = "3rem"
elemento[0].style.backgroundColor = "black"
elemento[0].style.justifyContent = "center"
elemento[0].style.alignItems = "center"
elemento[0].style.height = "100vh"



botao.addEventListener("click", function() {
    texto.innerText = "Ta feito"
    elemento[0].appendChild(texto)
})