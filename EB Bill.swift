/*Need to calculate Electricity bill for every two months based on below tariffs.  
For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 3.50/unit
For next 300 units Rs 4.60/unit
For unit above 500  Rs 6.60/unit
Fixed charges for two months Rs.50/service
For Commercial
For first 100 units Rs 5.00/unit
Consumption above 100 units bi monthly 8.05/unit
Fixed charges for two months Rs.290/service
Get random numbers as daily consumable units. For domestic random number generation should be in between 1 - 10. For commercial 10 - 100
*/

import Foundation
var amountToBePay: Float = 0
enum ReadingTypes {
    case domestic,commerical
}

struct EbBill {
    let rangeArray: [Float]
    let amountChargesPerRange : [Float]
    func calculateRangeDiffernce(_ balanceRange: Int) -> [Float] {
        var differenceBetweenTwoRanges: [Float] = [rangeArray[0]]
        for each in 1..<balanceRange  {
            differenceBetweenTwoRanges.append(Float(rangeArray[each] - rangeArray[each - 1]))
        }
        return differenceBetweenTwoRanges
    }
    func calculateAmount(_ totalUnits: Float,_ fixedServiceAmount: Float) -> Float  {
        var temporaryUnitForCalculation: Float = totalUnits
        var unitCount = 0
        for eachUnit in rangeArray {
            if totalUnits >= eachUnit {
                unitCount += 1
            }
        }
        let rangeDifference: [Float] = calculateRangeDiffernce(unitCount)
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
       return (amountToBePay + fixedServiceAmount)
    }
}
func doRendomUnitsCalculation(startingValue: Int,endingValue: Int) -> Float {
    var readingUnitsArray: [Int] = []
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:startingValue...endingValue))
    }
    return Float(readingUnitsArray.reduce(0,+))
}
let typeOfReading = ReadingTypes.domestic
var totalConsumedUnits: Float = 0 
if typeOfReading == .domestic {
    let structObject = EbBill(rangeArray: [100.0,200.0,500.0,501.0],amountChargesPerRange: [0,3.5,4.6,6.6])
    let fixedCharges: Float = 50
    totalConsumedUnits = doRendomUnitsCalculation(startingValue: 1, endingValue: 10)
    print("Total units : \(totalConsumedUnits)")
    print("Total amount need to pay : \(structObject.calculateAmount(totalConsumedUnits,fixedCharges))")
}
else {
    let structObject = EbBill(rangeArray: [100.0,500.0],amountChargesPerRange: [5.0,8.0])
    let fixedCharges: Float = 290
    totalConsumedUnits = doRendomUnitsCalculation(startingValue: 10, endingValue: 100)
    print("Total units : \(totalConsumedUnits)")
    print("Total amount need to pay : \(structObject.calculateAmount(totalConsumedUnits,fixedCharges))")
}
