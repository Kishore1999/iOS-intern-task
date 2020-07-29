import Foundation

let firstName = "tony"

let secondName = "indhuja"

func isVaild(for firstName: String, and secondName: String) {
    if firstName != secondName {

        let flamesCount = findFlamesCount(using: firstName, and: secondName)
        let flamesCharcter = findFlamesChracter(for: flamesCount)
        print(findRespectiveName(for: flamesCharcter))
    }
    else {
        print("Enter different names")
    }
}

func findFlamesCount(using firstName: String, and secondName: String) -> Int {
    
    var concatenateString = Array((firstName + secondName).lowercased)

    for outerIndex in 0..<firstName.count {
        for innerIndex in firstName.count..<concatenateString.count {
            if concatenateString[outerIndex] == concatenateString[innerIndex] && concatenateString[outerIndex] != "@" {

                concatenateString[outerIndex] = "@"
                concatenateString[innerIndex] = "@"  
            }

        }
    }
    return abs(concatenateString.count - concatenateString.filter { $0 == "@" }.count)
}


func findFlamesChracter(for flamesCount: Int) -> Character {
    var flamesString = Array("flames")
    var countingWord = 1
    var removedCharacterPosition = 0
    while flamesString.count != 1 {
        if countingWord == flamesCount {
            flamesString.remove(at: removedCharacterPosition )
            removedCharacterPosition -= 1
            countingWord = 0 
        }
        removedCharacterPosition += 1
        countingWord += 1
        if removedCharacterPosition == flamesString.count {
            removedCharacterPosition = 0
        }
    }
    return flamesString[0]
}

func findRespectiveName(for flamesCharacter: Character) -> String {
    switch flamesCharacter {
    case "f":
        return "\(secondName) is your friend"
    case "l":
        return "\(secondName) loves you"
    case "a":
        return "\(secondName) is attracted towards you!!!"
    case "m":
        return "You will get marry to \(secondName)"
    case "e":
        return "\(secondName) is your sworn enemy"

    case "s":
        return "\(secondName) is your sibling"
    default:
        fatalError("Unsupported")
    }
    
}

isVaild(for: firstName, and: secondName)
