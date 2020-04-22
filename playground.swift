import Foundation
var amountToBePay: Float = 0
enum ReadingTypes {
    case domestic,commerical
}

struct EbBill {
    var rangeArray: [Float]
    var amountChargesPerRange : [Float]
    func calculateRangeDiffernce() -> [Float] {
        var differenceBetweenTwoRanges: [Float] = [rangeArray[0]]
        for each in 1..<rangeArray.count  {
            differenceBetweenTwoRanges.append(Float(rangeArray[each] - rangeArray[each - 1]))
        }
        return differenceBetweenTwoRanges
    }
    func calculatingAmount(_ totalUnits: Float,_ fixedServiceAmount: Float)  {
        var temporaryUnitForCalculation: Float = totalUnits
        var rangeDifference: [Float] = calculateRangeDiffernce()
        for each in 0..<rangeArray.count {
             if each == rangeArray.count - 1 || totalUnits <= rangeArray[each] {
                amountToBePay += temporaryUnitForCalculation * amountChargesPerRange[each]
                break
             }
             else {
                amountToBePay += rangeDifference[each] * amountChargesPerRange[each]
                temporaryUnitForCalculation = temporaryUnitForCalculation - rangeDifference[each]
            }
        }
        print("Total amount need to pay : \(amountToBePay + fixedServiceAmount)")
    }
}
func doRendomUnitsCalculation(startingLimitvalue: Int,endingLimitvalue: Int) -> Float {
    var readingUnitsArray: [Int] = []
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:startingLimitvalue...endingLimitvalue))
    }
    return Float(readingUnitsArray.reduce(0,+))
}
let typeOfReading = ReadingTypes.domestic
var totalConsumedUnits: Float = 0 
if typeOfReading == .domestic {
    var object = EbBill(rangeArray: [100.0,200.0,500.0,501.0],amountChargesPerRange: [0,3.5,4.6,6.6])
    let fixedCharges: Float = 50
    totalConsumedUnits = doRendomUnitsCalculation(startingLimitvalue: 1, endingLimitvalue: 10)
    print("Total units : \(totalConsumedUnits)")
    object.calculatingAmount(totalConsumedUnits,fixedCharges)
}
else {
    var object = EbBill(rangeArray: [100.0,500.0],amountChargesPerRange: [5.0,8.0])
    let fixedCharges: Float = 290
    totalConsumedUnits = doRendomUnitsCalculation(startingLimitvalue: 10, endingLimitvalue: 100)
    print("Total units : \(totalConsumedUnits)")
    object.calculatingAmount(totalConsumedUnits,fixedCharges)
}