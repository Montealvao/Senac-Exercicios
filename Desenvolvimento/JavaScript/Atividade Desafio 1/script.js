
const arrayNumbers = [1,2,3,4,6,7,8]


let total = 0

function SomaDosPares(array){
    for(let i = 0; i <array.length; i++){    
        if(array[i] % 2 == 0){
            total+=array[i]
        }
    }
}

SomaDosPares(arrayNumbers)
console.log(total)