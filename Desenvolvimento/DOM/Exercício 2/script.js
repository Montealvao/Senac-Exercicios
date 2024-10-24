const botao = document.createElement("button")
botao.innerText = "Click Here"
botao.style.width = "20rem"
botao.style.height = "10rem"
botao.style.fontSize = "4rem"

var contagem = 0

const texto = document.createElement("h1")
texto.innerText = `Cliques: ${contagem}`
texto.style.color = "white"
texto.style.fontSize = "4rem"

const elemento = document.getElementsByTagName("body")
elemento[0].appendChild(botao)
elemento[0].appendChild(texto)

elemento[0].style.display = "flex"
elemento[0].style.gap = "3rem"
elemento[0].style.backgroundColor = "black"
elemento[0].style.justifyContent = "center"
elemento[0].style.alignItems = "center"
elemento[0].style.height = "100vh"


botao.addEventListener("click", function() {
    contagem++
    texto.innerText = `Cliques: ${contagem}`
})  