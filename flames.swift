import Foundation

func findFlames(using flamesCount: Int) {
    
    
}


let firstName = "maya"
let secondName = "tony"
var concatenateString = Array(firstName + secondName)

for outerIndex in 0..<firstName.count {
    for innerIndex in firstName.count..<concatenateString.count {
        if concatenateString[outerIndex] == concatenateString[innerIndex] && concatenateString[outerIndex] != "@" {

            concatenateString[outerIndex] = "@"
            concatenateString[innerIndex] = "@"  
        }

    }
}

let flamesCount = abs(concatenateString.count - concatenateString.filter { $0 == "@" }.count)
findFlames(using: flamesCount)



