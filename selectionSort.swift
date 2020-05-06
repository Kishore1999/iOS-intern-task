//selection sort


import Foundation

var array = [23,1,90,47,30,10]
var temporaryVariable = 0, minimumValueIndex = 0
for outerIndex in 0..<array.count {
    minimumValueIndex = outerIndex
    for innerIndex in (outerIndex + 1)..<array.count {
        if array[innerIndex] < array[minimumValueIndex] {
            minimumValueIndex = innerIndex
        }
    }
    if minimumValueIndex != outerIndex {
        temporaryVariable = array[minimumValueIndex]
        array[minimumValueIndex] = array[outerIndex]
        array[outerIndex] = temporaryVariable
    }
}
print(array)
