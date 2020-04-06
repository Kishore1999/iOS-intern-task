import Foundation

//print("Hello World")
let numberOfZombies: Int = 10
var numberOfBullet: Int = 5
var zombiesDistance: [Int] = ([1,6,6,8,5,8,6,7,10,9]).sorted(by: <)
var shootCount: Int = 0
var count: Int = 0
for var zombiesDistanceIndex in 0..<zombiesDistance.count  {
    if zombiesDistance[zombiesDistanceIndex] == 0 {
        print("YOU KILLED BY ZOMBIE!!!")
        break
    }
    else if zombiesDistance[zombiesDistanceIndex] <= 5 && numberOfBullet != 0  {
        count += 1
        if(count == 2) {
             numberOfBullet = numberOfBullet + 1
             count = 0
        }
        else {
            numberOfBullet = numberOfBullet - 1
        }
        zombiesDistance[zombiesDistanceIndex] = -1
        shootCount += 1
        print("*****ZOMBIE KILLED*******")
    }
    else if numberOfBullet == 0 {
        print("NO MORE BULLETS SO, ****GAME OVER!!!******")
        break
    }
    else {
        zombiesDistanceIndex = zombiesDistanceIndex - 1
    }
    for each in shootCount..<zombiesDistance.count {
        zombiesDistance[each] = zombiesDistance[each] - 1
    }
}
print("your score is  : \(shootCount)")