import Foundation

let distanceMatrix = [[0,10,15,20],[5,0,9,10],[6,13,0,12],[8,8,9,0]]
var visitedVertex = [0,0,0,0], costOfThePath = 0

func calculateCostPath(_ city: Int) -> Int {
    var minimumCost = Int.max, temporaryVariable = 0, nearestCity = Int.max
    for eachCity in 0..<distanceMatrix.count {
        if distanceMatrix[city][eachCity] != 0 && visitedVertex[eachCity] == 0  {
            var tempTotal = distanceMatrix[city][eachCity] + distanceMatrix[0][eachCity]
            if distanceMatrix[city][eachCity] < minimumCost  {
                minimumCost = distanceMatrix[city][eachCity] + distanceMatrix[0][eachCity]
            }
            temporaryVariable = distanceMatrix[eachCity][city]
           
            nearestCity = eachCity
        }
        
    }
    if minimumCost != Int.max {
        costOfThePath += temporaryVariable
    }
    print(temporaryVariable)
    return nearestCity
}

func minimumCostcalculate(_ city: Int) {
    
    visitedVertex[city] = 1
    
    var nerestCity = least(city)
    
    if nerestCity == Int.max {
        nerestCity = 0
        costOfThePath += distanceMatrix[nerestCity][city]
        return 
    }
    minimumCostcalculate(nerestCity)

}

minimumCostcalculate(0)
print(costOfThePath)




// for each in 0..<distanceMatrix.count {
//     print(distanceMatrix[0][each])
// }

