/* It's like a "shooting game".We need to kill all the zombies.In a array contains distances between zombies and players.It reduces every seconds by 1meter.shoot range also with in 5meter.
for every two shoots we get one extra bullet.Task is to kill all Zombies with in a given bullets.After that printing killing scores.If distance between zombies and players reaches zero means 
player died and game is over.

rules:
1.if distance is greater then 5 means we cannot shoot zombies
2.payers get +1 bullet back after  killed 2 zombies
3.every seconds zombie distance reduced to -1
4. per seconds one shoot are allowed
5.if distance is 0 means game over .player killed by zombie or else player win the game

inputs :
       number of bullets, number of zombies, distance between player and zombies in array like = [2,3,4,5]
output:
       Final score
*/

import Foundation
let numberOfZombies: Int = 5
var numberOfBullet: Int = 6
var zombiesDistance: [Int] = ([1,2,6,8,4]).sorted(by: <)
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
