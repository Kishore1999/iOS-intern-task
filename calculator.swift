import Foundation

var inputString = Array("0.5+0.5")

let precedenceDictionary = ["+":1,"-":1,"*":2,"/":2,"^":3,"(":0]

var infixArray:[String] = []

var postfixArray: [String] = []

let symbolArray = ["+", "-", "/", "*","(",")","^"]

func doSpearateArray() {
    var flag = 0
    var temp = 0

    for var index in 0..<inputString.count {
        if (symbolArray.contains(String(inputString[index])) != true){
            temp *= 10
            temp += (Int(String(inputString[index])) ?? 0)
            flag = 1
        }
        else {
            if flag == 1 {
                infixArray.append(String(temp))
            }
            infixArray.append(String(inputString[index]))
            temp = 0
            flag = 0
        }
        if index == inputString.count - 1 && symbolArray.contains(String(inputString[index])) != true  {
            infixArray.append(String(temp))
        }
    }
}

func infixToPostfix() -> [String]  {
    var operatorArray: [String] = []
    let numbersString = "0123456789"
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
    for eachElements in postfixArray {
        if (symbolArray.contains(String(eachElements)) != true) {
            operandsArray.append(Double(String(eachElements)) ?? 0)
        }
        else {
                operandsArray.append(doCalculation(eachElements,operandsArray.removeLast(),operandsArray.removeLast()))
                //print(operandsArray)
        }
    }
   return operandsArray.removeLast() 
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


doSpearateArray()
print("Postfix Expression \(infixToPostfix())")
print("answer : \(doEvalutionOfPostfix()) " )
doEvalutionOfPostfix()
