/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*39)+(63*58)"
output: 3732.0 
*/


import Foundation

let inputStringCharacter = Array(("1(1+0.2)10").replacingOccurrences(of:  " ", with: ""))

let SymbolsPrecedenceDictionary = ["+":1,"-":1,"*":2,"/":2,"^":3,"(":0]

let symbolsArray = ["+", "-", "/", "*","(",")","^"]

var infixExpressionArray:[String] = []

var postfixExpressionArray: [String] = []



func performCalculationForGiveninputStringCharacter() {
    spearateinputStringCharacterToInfixExpressionArray(for: inputStringCharacter)
    createpostfixExpressionArray(using: infixExpressionArray)
    print("answer : \(calculateFinalAnswer(using: postfixExpressionArray)) " )
}




func spearateinputStringCharacterToInfixExpressionArray(for inputStringCharacter: [Character]) {
    var flag = 0
    var temporaryvariable = 0
    var temporaryArray = Array(inputStringCharacter)
    var indexOfArray = 0
    while indexOfArray < inputStringCharacter.count  {
        var startingIndex = 0
        if indexOfArray < inputStringCharacter.count - 1  {
            if inputStringCharacter[indexOfArray + 1] == "." {
                startingIndex  = indexOfArray
                while indexOfArray < inputStringCharacter.count {
                    if symbolsArray.contains(String(inputStringCharacter[indexOfArray])) != true {
                        indexOfArray += 1
                    }
                    else if symbolsArray.contains(String(inputStringCharacter[indexOfArray])) {
                        indexOfArray = indexOfArray - 1
                        break
                    }
                    else {
                        indexOfArray = indexOfArray + 1
                        break
                    }
                }
                if flag == 1 {
                    temporaryvariable *= 10
                    temporaryvariable += (Int(String(inputStringCharacter[startingIndex])) ?? 0)
                    let temporaryString = String(temporaryvariable) + String(temporaryArray[startingIndex + 1...indexOfArray])
                    flag = 0
                    temporaryvariable = 0
                    infixExpressionArray.append(temporaryString)
                }
                else {
                    infixExpressionArray.append(String(temporaryArray[startingIndex...indexOfArray]))
                }          
            }

            else if symbolsArray.contains(String(inputStringCharacter[indexOfArray])) != true{
            
                temporaryvariable *= 10
                temporaryvariable += (Int(String(inputStringCharacter[indexOfArray])) ?? 0)
                flag = 1
            }
            else {
                if flag == 1 {
                    infixExpressionArray.append(String(temporaryvariable))
                }
                if inputStringCharacter[indexOfArray] == "(" && indexOfArray != 0  {
                    if symbolsArray.contains(String(inputStringCharacter[indexOfArray - 1])) != true {
                        infixExpressionArray.append("*")
                    }
                }
                infixExpressionArray.append(String(inputStringCharacter[indexOfArray]))
                if inputStringCharacter[indexOfArray] == ")" && indexOfArray < inputStringCharacter.count {
                    if  inputStringCharacter[indexOfArray + 1] == "(" || symbolsArray.contains(String(inputStringCharacter[indexOfArray + 1])) != true{
                        infixExpressionArray.append("*")
                    }
                }
                temporaryvariable = 0
                flag = 0
            }
        }
        else{
            if indexOfArray <= inputStringCharacter.count - 1   {
                if flag == 1 && symbolsArray.contains(String(inputStringCharacter[indexOfArray])) {
                    
                    infixExpressionArray.append(String(temporaryvariable))
                    infixExpressionArray.append(String(inputStringCharacter[indexOfArray]))
                }
                else if flag == 1 {
                    temporaryvariable = temporaryvariable * 10 + (Int(String(inputStringCharacter[indexOfArray])) ?? 0)
                    infixExpressionArray.append(String(temporaryvariable))
                }
                else {
                    infixExpressionArray.append(String(inputStringCharacter[indexOfArray]))
                }
                
            }
        }
        indexOfArray = indexOfArray + 1
    }
   
}
func createpostfixExpressionArray(using infixExpressionArray: [String]) -> [String]  {
    var operatorArray: [String] = []
    for eachElements in infixExpressionArray {
        if symbolsArray.contains(eachElements) != true {
            postfixExpressionArray.append(eachElements)
        }
        else if eachElements == "(" {
            operatorArray.append(eachElements)
            
        }
        else if eachElements == ")" {
            
            var removedOperators = operatorArray.removeLast()
            while removedOperators != "("{
                postfixExpressionArray.append(removedOperators)
                removedOperators = operatorArray.removeLast()
            }
        }
        else {
            while !operatorArray.isEmpty  && SymbolsPrecedenceDictionary[eachElements]! <= SymbolsPrecedenceDictionary[operatorArray.last!]! {
                postfixExpressionArray.append(operatorArray.removeLast())
                
            }
            operatorArray.append(eachElements)
        }
    }
    
    while !operatorArray.isEmpty {
        postfixExpressionArray.append(operatorArray.removeLast())
    }
    return postfixExpressionArray
}


func calculateFinalAnswer(using postfixExpressionArray: [String]) -> Float {
    var operandsArray: [Float] = []
    let symbolsBaseValueDictionary:[String:Float] = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElements in postfixExpressionArray {
        if (symbolsArray.contains(String(eachElements)) ) {
            
            if operandsArray.count == 1 {
                operandsArray.append(doCalculationForOperators(for:eachElements,with:operandsArray.removeLast(),and:symbolsBaseValueDictionary[eachElements]!))
            }
            else {
                operandsArray.append(doCalculationForOperators(for:eachElements,with:operandsArray.removeLast(),and:operandsArray.removeLast()))
            }
                
        }
        else {
            operandsArray.append(Float(String(eachElements)) ?? 0)
        }
    }
   return operandsArray[0]
}


func doCalculationForOperators(for operators: String, with secondOperand: Float,and firstOperand: Float) -> Float {

    switch operators {
    case "+":
        return firstOperand + secondOperand
    case "-":
        return firstOperand - secondOperand
    case "*":
        return firstOperand * secondOperand
    case "/":
        return firstOperand / secondOperand
    case "^": 
        return pow(firstOperand,secondOperand)
    default:
        print("Wrong Sign")
    }
    return -1
    
}

performCalculationForGiveninputStringCharacter()
