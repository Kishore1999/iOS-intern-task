// Bubble Sort algorithm 


import Foundation

var array = [2,6,98,60,72]
var temporaryVariable = 0
for outerIndex in 0..<array.count - 1 {
    for innerIndex in 0..<array.count - outerIndex - 1  {
        if array[innerIndex] > array[innerIndex + 1] {
            temporaryVariable = array[innerIndex]
            array[innerIndex] = array[innerIndex + 1]
            array[innerIndex + 1] = temporaryVariable
        }
    }
    
}
print(array)
