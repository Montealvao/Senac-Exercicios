/* ------Usando Set---------

const arr1 = [1,2,3,4,5]
const arr2 = [5,6,7,8,9,10]
const conjunto = arr1.concat(arr2)


const naoRepetir = new Set(conjunto)
const arr3 = [...naoRepetir]

console.log(arr3)

*/


var arr1 = [1,2,3,4,5]
var arr2 = [5,6,7,8,9,10]
var arr3 = []


for(let i = 0; i<arr1.length; i++){
    arr3.push(arr1[i])
}


for(let i = 0; i<arr2.length; i++){
    if(arr3.indexOf(arr2[i]) == -1){
        arr3.push(arr2[i])
    }
}

console.log(arr3)