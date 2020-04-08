/* It's like a "shooting game".We need to kill all the zombies.In a array contains distances between zombies and players.It reduces every seconds by 1meter.shoot range also with in 5meter.
for every two shoots we get one extra bullet.Task is to kill all Zombies with in a given bullets.After that printing killing scores.If distance between zombies and players reaches zero means 
player died and game is over.For every shoot zombie health reduced to 10.if zombie health is zero means Zombie killed.

rules:
1.if distance is greater then 5 means we cannot shoot zombies
2.payers get +1 bullet back after  killed 2 zombies
3.every seconds zombie distance reduced to -1
4. per seconds one shoot are allowed
5.if distance is 0 means game over .player killed by zombie or else player win the game

Power Gun : Some beast level zombies take 3 bullets to die.
               If we kill 10 zombies then we will get one Advanced Gun.
               Advanced gun can take only one bullet to kill even it's beast level zombie.
inputs :
       number of bullets, number of zombies, distance between player and zombies in array like = [2,3,4,5]
output:
       Final score
*/

import Foundation
var zombiesDistancesAndHealthArray : [[Int]] = [[1,10],[2,20],[5,30],[8,40],[5,50],[8,70],[6,65],[7,20],[10,48],[9,20],[11,50]].sorted{$0[0] < $1[0]}
let numberOfZombies: Int = 5
var numberOfBullet: Int = 20
var totalKillCount: Int = 0
let normalGunPerShootPower: Int = 10
let powerGunPerShootMinimumPower: Int = 30
var powerGun: Int = 0
var killedCount: Int = 0 , zombiesDistanceIndex: Int = 0
while zombiesDistanceIndex < zombiesDistancesAndHealthArray.count  {
   if zombiesDistancesAndHealthArray[zombiesDistanceIndex][0] == 0 {
        print("YOU KILLED BY ZOMBIE!!! remaining bullets : \(numberOfBullet)")
        break
    }
    else if powerGun >= 1 && zombiesDistancesAndHealthArray[zombiesDistanceIndex][1] >= powerGunPerShootMinimumPower  {
        killedCount += 1
        if(killedCount == 2) {
             numberOfBullet = numberOfBullet + 1
             killedCount = 0
        }
        zombiesDistancesAndHealthArray[zombiesDistanceIndex][0] = -1
        powerGun -= 1
        totalKillCount += 1
        zombiesDistanceIndex += 1
        print("*******ZOMBIE KILLED BY POWER GUN*******")
    }
    else if zombiesDistancesAndHealthArray[zombiesDistanceIndex][0] < 5 && numberOfBullet >= (zombiesDistancesAndHealthArray[zombiesDistanceIndex][1] / normalGunPerShootPower) {
        killedCount += 1
        numberOfBullet = numberOfBullet - (zombiesDistancesAndHealthArray[zombiesDistanceIndex][1] / normalGunPerShootPower)
        if(killedCount == 2) {
             numberOfBullet = numberOfBullet + 1
             killedCount = 0
        }
        zombiesDistancesAndHealthArray[zombiesDistanceIndex][0] = -1
        totalKillCount += 1
        zombiesDistanceIndex += 1
        print("*******ZOMBIE KILLED*******")
        
    }
    else if numberOfBullet == 0 && powerGun >= 1 {
        killedCount += 1
        powerGun = powerGun - 1
        if(killedCount == 2) {
             numberOfBullet = numberOfBullet + 1
             killedCount = 0
        }
        zombiesDistancesAndHealthArray[zombiesDistanceIndex][0] = -1
        zombiesDistanceIndex += 1
        totalKillCount += 1
        print("*******ZOMBIE KILLED BY POWER GUN*******")
    }
    else if numberOfBullet <= 0 {
        print("NO MORE BULLETS SO, *******GAME OVER!!!*******")
        break
    }
    for each in totalKillCount..<zombiesDistancesAndHealthArray.count {
        zombiesDistancesAndHealthArray[each][0] = zombiesDistancesAndHealthArray[each][0] - 1
    }
    if totalKillCount % 10 == 0 {
        powerGun += 1
    }
    
}
print("your kills : \(totalKillCount)")
