const form = document.querySelector("form")
const div = document.getElementsByClassName("register")
const p = document.createElement("p")
const field_name = document.getElementsByClassName("field_name")
const field_password = document.getElementsByClassName("field_password")


form.addEventListener("submit",function(event){
    event.preventDefault()
    if(field_name[0].value == "admin" && field_password[0].value == "admin"){
        p.style.color = "green"
        p.style.fontSize = "2rem"
        p.innerHTML = "Bem-Vindo Admin"
        div[0].appendChild(p) 
    }
    
    else{
        p.style.color = "red"
        p.style.fontSize = "2rem"
        p.innerHTML = "Acesso Negado"
        div[0].appendChild(p)
    }   
})
