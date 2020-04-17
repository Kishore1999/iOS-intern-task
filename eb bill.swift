/*
Problem Statement : Need to calculate Electricity bill for every two months based on below tariffs.  

For domestic
For first 100 units Rs 0/unit
For next 100 units Rs 1.50/unit, Fixed sevice cost Rs 20
For next 300 units Rs 3.00/unit, Fixed sevice cost Rs 30
For unit above 500  Rs 6.60/unit , Fixed sevice cost Rs 50

For Commercial
For first 100 units Rs 5.00/unit
Consumption above 100 units bi monthly 8.05/unit
Fixed charges for two months Rs.290/service

Get random numbers as daily consumable units. 
For domestic random number generation should be in between 1 - 10. 
For commercial 10 - 100
*/

import Foundation
enum ReadingType: String {
    case domestic,commerical
}
func domestic(totalTwoMonthReading: Float) -> Float {
    
    if totalTwoMonthReading <= 100 {
        return Float(100 * 0)
    }
    else if totalTwoMonthReading >= 101 && totalTwoMonthReading <= 200 {
        return (Float(totalTwoMonthReading * 1.50)) + 20
    }
    else if totalTwoMonthReading >= 201 && totalTwoMonthReading <= 500 {
         return (Float(100 * 0) + Float(100 * 2) + Float((totalTwoMonthReading - 200) * 3)) + 30
    }
    else {
        return (Float(100 * 0) + Float((100 * 3.50)) + Float(300 * 4.6) + Float((totalTwoMonthReading - 500) * 6.60)) + 50
    }
    
}
func commercial(totalTwoMonthReading: Float) -> Float {
    var withOutAddingService: Float = 0
    let serviceAmount: Float = 290 
    if totalTwoMonthReading <= 100 {
        withOutAddingService = Float(totalTwoMonthReading * 5)
    }
    else {
        withOutAddingService = Float(100 * 5) + Float((totalTwoMonthReading - 100) * 8.05)
    }
    return (withOutAddingService + serviceAmount)
}
let type = "commerical"
var readingUnitsArray: [Int] = []
if type == ReadingType.domestic.rawValue {
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:1...10))
    }
    print("Total Unit: \(readingUnitsArray.reduce(0,+))")
    print("Cost : \(domestic(totalTwoMonthReading:Float(readingUnitsArray.reduce(0,+))))")
}
else {
    for eachDay in 0..<60 {
        readingUnitsArray.append(Int.random(in:10...100))
    }
    print("Total Unit: \(readingUnitsArray.reduce(0,+))")
    print("Cost : \(commercial(totalTwoMonthReading:Float(readingUnitsArray.reduce(0,+))))")
}
