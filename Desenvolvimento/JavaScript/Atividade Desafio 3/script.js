/* Timestamp */

entrada = prompt('Insira sua data de Nascimento: ')
let dataNascimento = new Date().getTime() - new Date(entrada)
let idadeEmAnos = new Date(dataNascimento).getFullYear() - 1970

console.log(`Idade do usuário: ${idadeEmAnos} anos.`)
