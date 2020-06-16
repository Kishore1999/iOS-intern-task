import Foundation

let inputStringCharacter = Array(("3+2").replacingOccurrences(of:  " ", with: ""))

let symbolsPrecedenceDictionary = ["+":1,"-":1,"*":2,"/":2,"^":3,"(":0]

let symbolsArray = ["+", "-", "/", "*","(",")","^"]

var infixExpressionArray:[String] = []

var postfixExpressionArray: [String] = []


//main function
func performArithmeticOperation(for inputStringCharacter:[Character]) {
    
    createInfixExpressionArray(using: inputStringCharacter)
    print(infixExpressionArray)
    createpostfixExpressionArray(using: infixExpressionArray)
    print("answer : \(calculateFinalAnswer(using: postfixExpressionArray)) " )
}


//create infix expression using input string character
func createInfixExpressionArray(using inputStringCharacter: [Character]) {
    var flag = 0
    var signedValue  = 0
    var temporaryvariable = 0
    var temporaryArray = Array(inputStringCharacter)
    var indexOfArray = 0
    while indexOfArray < inputStringCharacter.count  {
        var startingIndex = 0
        if indexOfArray < inputStringCharacter.count - 1  {
            if inputStringCharacter[indexOfArray + 1] == "."  && symbolsArray.contains(String(inputStringCharacter[indexOfArray])) != true || inputStringCharacter[indexOfArray] == "." {
                startingIndex  = indexOfArray
                while indexOfArray < inputStringCharacter.count - 1 {
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
                if symbolsArray.contains(String(inputStringCharacter[indexOfArray])) {
                    indexOfArray = indexOfArray - 1
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
                if inputStringCharacter[indexOfArray] == "(" && indexOfArray != 0 {
                    if symbolsArray.contains(String(inputStringCharacter[indexOfArray - 1])) != true {
                        infixExpressionArray.append("*")
                    }
                    if (inputStringCharacter[indexOfArray + 1]) == "-" || (inputStringCharacter[indexOfArray + 1]) == "+" {
                        signedValue = 1
                    }
                }
                infixExpressionArray.append(String(inputStringCharacter[indexOfArray]))
                //print(inputStringCharacter[indexOfArray])
                if inputStringCharacter[indexOfArray] == ")" && indexOfArray < inputStringCharacter.count {
                    if  inputStringCharacter[indexOfArray + 1] == "(" || symbolsArray.contains(String(inputStringCharacter[indexOfArray + 1])) != true{
                        infixExpressionArray.append("*")
                    }
                    if (inputStringCharacter[indexOfArray + 1]) == "-" || (inputStringCharacter[indexOfArray + 1]) == "+" {
                        signedValue = 1
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
    if signedValue == 1 {
        infixExpressionArray = checkingSignValues(for: infixExpressionArray)
    }
}

func checkingSignValues(for infixExpressionArray:[String]) -> [String] {
    var indexOfArray = 0
    var tempIndex = 0
    var tempString: String = ""
    var infixExpressionArray = infixExpressionArray
    while indexOfArray < infixExpressionArray.count - 1 {
        if infixExpressionArray[indexOfArray] == "(" && infixExpressionArray[indexOfArray + 1] == "-"{
            indexOfArray += 1
            tempIndex = indexOfArray
            tempString = String(infixExpressionArray.remove(at:indexOfArray)) + String(infixExpressionArray.remove(at:indexOfArray))
            infixExpressionArray.insert(tempString, at: tempIndex)
        }
        else if infixExpressionArray[indexOfArray] == ")" && infixExpressionArray[indexOfArray + 1] == "-" {
            indexOfArray += 1
            tempIndex = indexOfArray
            tempString = String(infixExpressionArray.remove(at:indexOfArray)) + String(infixExpressionArray.remove(at:indexOfArray))
            infixExpressionArray.insert(tempString, at: tempIndex)
        }
        indexOfArray = indexOfArray + 1
    }
    return infixExpressionArray
}


//create postfix expression using infix array
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
            while !operatorArray.isEmpty  && symbolsPrecedenceDictionary[eachElements]! <= symbolsPrecedenceDictionary[operatorArray.last!]! {
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



//calculate answer for postfix expression
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

//do calculation for respective sign
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
performArithmeticOperation(for:inputStringCharacter)
