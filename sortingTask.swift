/*  sort the elements in a array and calculate sum until condition become false.
conditions : first get a index position from user then calcalute total like array[index] - array[index - 1] .this total calculation method goes on until (index > 0).after that add all the elements.

input format : array
               index position
output       : sorted array 
               sum of values.
 */

import Foundation

var arrayOfElements = [1,6,3,4,5]

func doSelectionSortWithMinimumSwap()  {
    var temporaryIndexOfMinimumValue = -1 , swapCount = 0
    for eachIteration in 0..<arrayOfElements.count - 1 {
        temporaryIndexOfMinimumValue = eachIteration
        for eachNumber in (eachIteration + 1)..<arrayOfElements.count  {
            if arrayOfElements[temporaryIndexOfMinimumValue] > arrayOfElements[eachNumber] {
                temporaryIndexOfMinimumValue = eachNumber
                
            }
        }

        if temporaryIndexOfMinimumValue != eachIteration {
            arrayOfElements.swapAt(temporaryIndexOfMinimumValue,eachIteration)
            swapCount += 1
        }
        
    } 
    print("SwapCount: \(swapCount)")   
}

func calculateMinimumDifferencesForGivenRangeAndReturnsSumOfSubractionValues(_ indexPosition : Int) -> Int {
    var sumOfSubractionValues = 0, eachIteration = 0
    while eachIteration != indexPosition {
        sumOfSubractionValues += abs(arrayOfElements[eachIteration + 1] - arrayOfElements[eachIteration])
        eachIteration += 1
    }
    return sumOfSubractionValues
}

doSelectionSortWithMinimumSwap()

let indexPositionForSumOfSubraction = 4
print("Sorted Array: \(arrayOfElements)")


if indexPositionForSumOfSubraction > 0 && indexPositionForSumOfSubraction < arrayOfElements.count  {
    print("sumOfSubractionValues : \(calculateMinimumDifferencesForGivenRangeAndReturnsSumOfSubractionValues(indexPositionForSumOfSubraction))")
}
