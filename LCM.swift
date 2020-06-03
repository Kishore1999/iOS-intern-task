/*
LCM of two number 
  e.g :-  2,5
          Least Common Multiple is 10.
*/

import Foundation

let firstNumber = 10 , seccondNumber = 200

//checking number is vaild or not
func checkingNumberIsVaild(for firstNumber: Int, and seccondNumber: Int ) -> Int {
    if firstNumber != 0 && seccondNumber != 0 {
        return calculateLCM(for:firstNumber,and: seccondNumber, with:findMaximumValue(between: firstNumber, and: seccondNumber))
    }
    else {
        return 0
    }
}

//find maximum value
func findMaximumValue(between firstNumber: Int, and seccondNumber: Int) -> Int {
    return (firstNumber > seccondNumber) ?  firstNumber :  seccondNumber
}

//after finding maximum value then calculating LCM 
func calculateLCM(for firstNumber: Int, and seccondNumber: Int, with maxmiumValue: Int ) -> Int {
    var maximumValue = maxmiumValue
    if maximumValue % firstNumber == 0 && maximumValue % seccondNumber == 0 {
        return maximumValue
    }
    return calculateLCM(for:firstNumber, and: seccondNumber, with: maximumValue + 1)
}



print("LCM: \(checkingNumberIsVaild(for: firstNumber, and: seccondNumber))" )

