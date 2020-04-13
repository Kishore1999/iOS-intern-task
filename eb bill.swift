import Foundation
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
var readingUnitsArray: [Int] = []
for eachDay in 0..<60 {
    readingUnitsArray.append(Int.random(in:1...10))
}
print(readingUnitsArray.reduce(0,+))
print(domestic(totalTwoMonthReading:Float(readingUnitsArray.reduce(0,+))))