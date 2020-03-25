import Foundation
var batches = [["batchname": "January", "available": 50, "cased": 0, "outers": 0, "pieces": 0],
               ["batchname": "February", "available": 25, "cased": 0, "outers": 0, "pieces": 0],
               ["batchname": "March", "available": 125, "cased": 0, "outers": 0, "pieces": 0]
]
let cases = 50, outer = 5, piece = 1
var arrayOfAvailables : [Int] = [], orderedPieces = 300
for availables in 0..<batches.count {
    arrayOfAvailables.append(batches[availables]["available"] as! Int)
}
let totalAvailables = arrayOfAvailables.reduce(0,+)
if totalAvailables < orderedPieces {
    print("Sorry,Out of Stock...available stock is  \(totalAvailables)")
}
else
{
    for availables in 0..<batches.count {
         while arrayOfAvailables[availables] > 0 && orderedPieces != 0 {
     
            if arrayOfAvailables[availables] >= cases && orderedPieces >= cases {
                arrayOfAvailables[availables] = arrayOfAvailables[availables] - cases
                batches[availables]["available"] = arrayOfAvailables[availables]
                batches[availables]["cased"] = batches[availables]["cased"] as! Int + 1 
                orderedPieces = orderedPieces - cases
         
            }
            else if arrayOfAvailables[availables] >= outer, orderedPieces >= outer {
                arrayOfAvailables[availables] = arrayOfAvailables[availables] - outer
                batches[availables]["available"] = arrayOfAvailables[availables]
                batches[availables]["outers"] = batches[availables]["outers"] as! Int + 1 
                orderedPieces = orderedPieces - outer
         
            }
            else {
                arrayOfAvailables[availables] = arrayOfAvailables[availables] - piece
                batches[availables]["available"] = arrayOfAvailables[availables]
                batches[availables]["pieces"] = batches[availables]["pieces"] as! Int + 1 
                orderedPieces = orderedPieces - piece
            }
        }
    
    }
    print(batches)
}

