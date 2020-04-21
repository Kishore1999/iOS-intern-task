/*Problem Statement : Need to calculate Electricity bill for every two months based on below tariffs.  
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
import Foundation
enum ReadingType {
    case domestic,commerical
}
let domesticFirstHunderdUnitCharges: Float = 0,domesticSecondHunderdUnitCharges: Float = 3.5,domesticFiveHunderdUnitCharges: Float = 4.6,aboveFiveUnitsCharge: Float = 6.6 
let surchargeForDomestic: Float = 50
func calculatedomesticamount(_ totalTwoMonthReadingUnits: Float) -> Float {
    
    if totalTwoMonthReadingUnits <= 100 {
        return Float(100 * domesticFirstHunderdUnitCharges)
    }
    else if totalTwoMonthReadingUnits >= 101 && totalTwoMonthReadingUnits <= 200 {
        return Float(100 * domesticFirstHunderdUnitCharges) + (Float((totalTwoMonthReadingUnits - 100) * domesticSecondHunderdUnitCharges )) + surchargeForDomestic
    }
    else if totalTwoMonthReadingUnits >= 201 && totalTwoMonthReadingUnits <= 500 {
         return (Float(100 * domesticFirstHunderdUnitCharges) + Float(100 * domesticSecondHunderdUnitCharges) + Float((totalTwoMonthReadingUnits - 200) * domesticFiveHunderdUnitCharges)) + surchargeForDomestic
    }
    else {
        return (Float(100 * domesticFirstHunderdUnitCharges) + Float((100 * domesticSecondHunderdUnitCharges)) + Float(300 * domesticFiveHunderdUnitCharges) + Float((totalTwoMonthReadingUnits - 500) * aboveFiveUnitsCharge)) + surchargeForDomestic
    }
    
}
func calculatecommercialamount(_ totalTwoMonthReading: Float) -> Float {
    
    let commercialFirstHunderdUnitCharges: Float = 5, commercialAboveHunderdUnit: Float = 8.05
    var totalAmountwithOutAddingServiceAmount: Float = 0
    let serviceAmount: Float = 290 

    if totalTwoMonthReading <= 100 {
        totalAmountwithOutAddingServiceAmount = Float(totalTwoMonthReading * commercialFirstHunderdUnitCharges)
    }
    else {
        totalAmountwithOutAddingServiceAmount = Float(100 * commercialFirstHunderdUnitCharges) + Float((commercialAboveHunderdUnit - 100) * 8.05)
    }
    return (totalAmountwithOutAddingServiceAmount + serviceAmount)
}
let typeOfReading = ReadingType.domestic
var readingUnitsArray: [Int] = []
var totalUnits = 0
if typeOfReading == ReadingType.domestic {
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:1...10))
    }
    totalUnits = readingUnitsArray.reduce(0,+)
    print("Total Unit: \(totalUnits)")
    print("Cost : \(calculatedomesticamount(Float(totalUnits)))")
}
else {
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:10...100))
    }
    totalUnits = readingUnitsArray.reduce(0,+)
    print("Total Unit: \(totalUnits)")
    print("Cost : \(calculatecommercialamount(Float(totalUnits)))")
}
