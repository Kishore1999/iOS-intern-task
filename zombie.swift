import Foundation
let numberOfZombies: Int = 2
var numberOfBullet: Int = 6
var zombiesDistance: [Int] = ([1,10]).sorted(by: <)
var shootCount: Int = 0
var killedCount: Int = 0 , zombiesDistanceIndex: Int = 0
while zombiesDistanceIndex < zombiesDistance.count  {
   if zombiesDistance[zombiesDistanceIndex] == 0 {
        print("YOU KILLED BY ZOMBIE!!!")
        break
    }
    else if zombiesDistance[zombiesDistanceIndex] < 5 && numberOfBullet != 0  {
        killedCount += 1
        numberOfBullet = numberOfBullet - 1
        if(killedCount == 2) {
             numberOfBullet = numberOfBullet + 1
             killedCount = 0
        }
        
        zombiesDistance[zombiesDistanceIndex] = -1
        shootCount += 1
        print("*******ZOMBIE KILLED*******")
        zombiesDistanceIndex += 1
    }
    else if numberOfBullet == 0 {
        print("NO MORE BULLETS SO, *******GAME OVER!!!*******")
        break
    }
    for each in shootCount..<zombiesDistance.count {
        zombiesDistance[each] = zombiesDistance[each] - 1
    }
}
print("your kills : \(shootCount)")
