/*Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*3)+3*5")
Here the evaluation will happen based on precedence order as = (2*3)+3*5
                                                             = 6+3*5
                                                             = 6+15
                                                             = 21 */
//convert infix to postfix expression
import Foundation

var inputString = Array(("-5+5").replacingOccurrences(of:  " ", with: ""))

let precedenceDictionary = ["+":1,"-":1,"*":2,"/":2,"^":3,"(":0]

let symbolArray = ["+", "-", "/", "*","(",")","^"]

var infixArray:[String] = []

var postfixArray: [String] = []

func performCalculator() {
    doSpearateArray()
    print("Postfix Expression \(infixToPostfix())")
    print("answer : \(doEvalutionOfPostfix()) " )
}



func doSpearateArray() {
    var flag = 0
    var temporaryvariable = 0
    var temporaryArray = Array(inputString)
    var indexOfArray = 0
    while indexOfArray < inputString.count  {
        var startingIndex = 0
        if indexOfArray < inputString.count - 1  {
            if inputString[indexOfArray + 1] == "." {
                startingIndex  = indexOfArray
                while indexOfArray < inputString.count - 1 {
                    if symbolArray.contains(String(inputString[indexOfArray])) != true {
                        indexOfArray += 1
                    }
                    else if symbolArray.contains(String(inputString[indexOfArray])) {
                        indexOfArray = indexOfArray - 1
                        break
                    }
                    else {
                        indexOfArray = indexOfArray + 1
                        break
                    }
                }
                infixArray.append(String(temporaryArray[startingIndex...indexOfArray]))
            
            }

            else if symbolArray.contains(String(inputString[indexOfArray])) != true{
            
                temporaryvariable *= 10
                temporaryvariable += (Int(String(inputString[indexOfArray])) ?? 0)
                flag = 1
            }
            else {
                if flag == 1 {
                    infixArray.append(String(temporaryvariable))
                }
                if inputString[indexOfArray] == "(" && indexOfArray != 0  {
                    if symbolArray.contains(String(inputString[indexOfArray - 1])) != true {
                        infixArray.append("*")
                    }
                }
                infixArray.append(String(inputString[indexOfArray]))
                if inputString[indexOfArray] == ")" && indexOfArray < inputString.count {
                    if  inputString[indexOfArray + 1] == "(" || symbolArray.contains(String(inputString[indexOfArray + 1])) != true{
                        infixArray.append("*")
                    }
                }
                temporaryvariable = 0
                flag = 0
            }
        }
        else{
            if indexOfArray <= inputString.count - 1   {
                if flag == 1 && symbolArray.contains(String(inputString[indexOfArray])) {
                    
                    infixArray.append(String(temporaryvariable))
                    infixArray.append(String(inputString[indexOfArray]))
                }
                else if flag == 1 {
                    temporaryvariable = temporaryvariable * 10 + (Int(String(inputString[indexOfArray])) ?? 0)
                    infixArray.append(String(temporaryvariable))
                }
                else {
                    infixArray.append(String(inputString[indexOfArray]))
                }
                
            }
        }
        indexOfArray = indexOfArray + 1
    }
   
}


func infixToPostfix() -> [String]  {
    var operatorArray: [String] = []
    for eachElements in infixArray {
        if symbolArray.contains(eachElements) != true {
            postfixArray.append(eachElements)
        }
        else if eachElements == "(" {
            operatorArray.append(eachElements)
            
        }
        else if eachElements == ")" {
            
            var removeOperators = operatorArray.removeLast()
            while removeOperators != "("{
                postfixArray.append(removeOperators)
                removeOperators = operatorArray.removeLast()
            }
        }
        else {
            while !operatorArray.isEmpty  && precedenceDictionary[eachElements]! <= precedenceDictionary[operatorArray.last!]! {
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


func doEvalutionOfPostfix() -> Double {
    var operandsArray: [Double] = []
    var symbolsBaseValueDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElements in postfixArray {
        if (symbolArray.contains(String(eachElements)) ) {
            
            if operandsArray.count == 1 {
                operandsArray.append(doCalculation(eachElements,operandsArray.removeLast(),symbolsBaseValueDictionary[eachElements]!))
            }
            else {
                operandsArray.append(doCalculation(eachElements,operandsArray.removeLast(),operandsArray.removeLast()))
            }
                
        }
        else {
            operandsArray.append(Double(String(eachElements)) ?? 0)
        }
    }
   return operandsArray[0]
}


func doCalculation(_ symbol: String,_ secondOperand: Double,_ firstOperand: Double) -> Double {

    switch symbol {
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
calculator()
