/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*39)+(63*58)"
output: 3732.0 
*/


import Foundation

let inputCharacterString = Array(("2-3").replacingOccurrences(of:  " ", with: ""))

let SymbolsPrecedenceDictionary = ["+":1,"-":1,"*":2,"/":2,"^":3,"(":0]

let symbolsArray = ["+", "-", "/", "*","(",")","^"]

var infixExpressionArray:[String] = []

var postfixArray: [String] = []

func performCalculationForGiveninputCharacterString() {
    spearateinputCharacterStringToArray(for: inputCharacterString)
    //print(infixExpressionArray)
    infixToPostfixArray(for: infixExpressionArray)
    print("answer : \(calculatePostfixArray(for: postfixArray)) " )
}

func spearateinputCharacterStringToArray(for inputCharacterString: [Character]) {
    var flag = 0
    var temporaryvariable = 0
    var temporaryArray = Array(inputCharacterString)
    var indexOfArray = 0
    while indexOfArray < inputCharacterString.count  {
        var startingIndex = 0
        if indexOfArray < inputCharacterString.count - 1  {
            if inputCharacterString[indexOfArray + 1] == "." {
                startingIndex  = indexOfArray
                while indexOfArray < inputCharacterString.count - 1 {
                    if symbolsArray.contains(String(inputCharacterString[indexOfArray])) != true {
                        indexOfArray += 1
                    }
                    else if symbolsArray.contains(String(inputCharacterString[indexOfArray])) {
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
                    temporaryvariable += (Int(String(inputCharacterString[startingIndex])) ?? 0)
                    let temporaryString = String(temporaryvariable) + String(temporaryArray[startingIndex + 1...indexOfArray])
                    flag = 0
                    temporaryvariable = 0
                    infixExpressionArray.append(temporaryString)
                }
                else {
                    infixExpressionArray.append(String(temporaryArray[startingIndex...indexOfArray]))
                }          
            }

            else if symbolsArray.contains(String(inputCharacterString[indexOfArray])) != true{
            
                temporaryvariable *= 10
                temporaryvariable += (Int(String(inputCharacterString[indexOfArray])) ?? 0)
                flag = 1
            }
            else {
                if flag == 1 {
                    infixExpressionArray.append(String(temporaryvariable))
                }
                if inputCharacterString[indexOfArray] == "(" && indexOfArray != 0  {
                    if symbolsArray.contains(String(inputCharacterString[indexOfArray - 1])) != true {
                        infixExpressionArray.append("*")
                    }
                }
                infixExpressionArray.append(String(inputCharacterString[indexOfArray]))
                if inputCharacterString[indexOfArray] == ")" && indexOfArray < inputCharacterString.count {
                    if  inputCharacterString[indexOfArray + 1] == "(" || symbolsArray.contains(String(inputCharacterString[indexOfArray + 1])) != true{
                        infixExpressionArray.append("*")
                    }
                }
                temporaryvariable = 0
                flag = 0
            }
        }
        else{
            if indexOfArray <= inputCharacterString.count - 1   {
                if flag == 1 && symbolsArray.contains(String(inputCharacterString[indexOfArray])) {
                    
                    infixExpressionArray.append(String(temporaryvariable))
                    infixExpressionArray.append(String(inputCharacterString[indexOfArray]))
                }
                else if flag == 1 {
                    temporaryvariable = temporaryvariable * 10 + (Int(String(inputCharacterString[indexOfArray])) ?? 0)
                    infixExpressionArray.append(String(temporaryvariable))
                }
                else {
                    infixExpressionArray.append(String(inputCharacterString[indexOfArray]))
                }
                
            }
        }
        indexOfArray = indexOfArray + 1
    }
   
}


func infixToPostfixArray(for infixExpressionArray: [String]) -> [String]  {
    var operatorArray: [String] = []
    for eachElements in infixExpressionArray {
        if symbolsArray.contains(eachElements) != true {
            postfixArray.append(eachElements)
        }
        else if eachElements == "(" {
            operatorArray.append(eachElements)
            
        }
        else if eachElements == ")" {
            
            var removedOperators = operatorArray.removeLast()
            while removedOperators != "("{
                postfixArray.append(removedOperators)
                removedOperators = operatorArray.removeLast()
            }
        }
        else {
            while !operatorArray.isEmpty  && SymbolsPrecedenceDictionary[eachElements]! <= SymbolsPrecedenceDictionary[operatorArray.last!]! {
                postfixArray.append(operatorArray.removeLast())
                
            }
            operatorArray.append(eachElements)
        }
    }
    
    while !operatorArray.isEmpty {
        postfixArray.append(operatorArray.removeLast())
    }
    return postfixArray
}


func calculatePostfixArray(for postfixArray: [String]) -> Double {
    var operandsArray: [Double] = []
    let symbolsBaseValueDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElements in postfixArray {
        if (symbolsArray.contains(String(eachElements)) ) {
            
            if operandsArray.count == 1 {
                operandsArray.append(doCalculationForOperators(for:eachElements,with:operandsArray.removeLast(),and:symbolsBaseValueDictionary[eachElements]!))
            }
            else {
                operandsArray.append(doCalculationForOperators(for:eachElements,with:operandsArray.removeLast(),and:operandsArray.removeLast()))
            }
                
        }
        else {
            operandsArray.append(Double(String(eachElements)) ?? 0)
        }
    }
   return operandsArray[0]
}


func doCalculationForOperators(for operators: String, with secondOperand: Double,and firstOperand: Double) -> Double {

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

performCalculationForGiveninputCharacterString()
