

//Traveling salesman problem

import Foundation

let distanceMatrix = [[0,2,9,10],[1,0,6,4],[15,7,0,8],[6,3,12,0]]
var citiesArray = [0,1,2,3]
var permutationArray : [[Int]] = []
func permutation(_ startingPosition : Int,_ lastPosition: Int) {
    if startingPosition == lastPosition {
        permutationArray.append(citiesArray)
    }
    else {
        for index in startingPosition...lastPosition  {
            citiesArray.swapAt(startingPosition,index)
            permutation(startingPosition + 1,lastPosition)
            citiesArray.swapAt(startingPosition, index)
        }
        
    }
}
var costOfThePath = Int.max , minimumPathIndex = -1
func calculateMinimumCost(_ individualPaths: [Int], _ positionOfArray: Int)  {
    var calculatedCost = 0
    for eachCity in 0..<individualPaths.count - 1 {
        calculatedCost += distanceMatrix[individualPaths[eachCity]][individualPaths[eachCity + 1]]
        
    }
    calculatedCost += distanceMatrix[individualPaths[individualPaths.count - 1]][0]
    if costOfThePath > calculatedCost  {
        costOfThePath = calculatedCost
        minimumPathIndex = positionOfArray
    }
    
}

permutation(1,citiesArray.count - 1)
for eachPath in 0..<permutationArray.count {
    calculateMinimumCost(permutationArray[eachPath],eachPath)
}
print(permutationArray[minimumPathIndex].map{$0 + 1})
print(costOfThePath)



