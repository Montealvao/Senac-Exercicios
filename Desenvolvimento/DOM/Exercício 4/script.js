form = document.querySelector("form")
ul = document.querySelector("ul")
input = document.getElementById("write")
body = document.body

form.addEventListener("submit",function(event){
    event.preventDefault()
    if(input.value != ""){
        item = document.createElement("li")
        item.innerHTML = input.value
        item.classList = "array_itens"
        button = document.createElement("button")
        button.innerText = "Remover"
        //    button.classList = "array_button"
        item.appendChild(button)
        ul.appendChild(item)
        button.addEventListener("click",function(e){
            e.target.parentElement.remove()
        })
        form.reset(input)
    }
})

