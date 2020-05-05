
//liner Search
import Foundation

var array = [2,6,98,60,72,100,302,4]
var keyValueToBeChecked = 100, index = -1 
for eachElement in 0..<array.count {
    if array[eachElement] == keyValueToBeChecked  {
        index = eachElement
    }
    
}
print(index)
