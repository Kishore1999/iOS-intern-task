import Foundation
struct StudentDetails {
   private var studentName : String
   private var studentId : String 
   private var physics : Int 
   private var chemistry : Int 
   private var maths : Int 
   private var totalMark : Int 
   private var percentage : Int
   static var failArray = [String]()
   static var  passArray = [String]()
   static var passStudentMarks = [Int]()
   init(studentName : String,studentId : String, physics : Int, chemistry : Int, maths : Int, totalMark : Int, percentage : Int) {
        self.studentName = studentName
        self.studentId = studentId
        self.physics = physics
        self.chemistry = chemistry
        self.maths = maths
        self.totalMark = totalMark
        self.percentage = percentage
        if (physics >= 50 && chemistry >= 50 && maths >= 50) {
            StudentDetails.passArray.append("name: " + studentName + "," + "studentId: " +  studentId + "," + "totalMark: " + "\(totalMark)")
            StudentDetails.passStudentMarks.append(totalMark)
        }
        else {
            StudentDetails.failArray.append("name: " + studentName + "," + "studentId: " +  studentId + "," + "totalMark: " + "\(totalMark)")
        }
    }
    func ranklist()  {
         let rankList = StudentDetails.passStudentMarks.sorted(by: > )
         for rank in 0..<rankList.count {
             print("Rank \(rank + 1) total is \(rankList[rank])")
         }
        print(rankList)
    }
}
var count = 0
var studentDetails = ["kishore,101,kishore@gmail.com,{physics:100,maths:100,chemistry:60}","vasu,102,vasu@skct.com,{physics:100,maths:90,chemistry:90}","mithun,103,mithun@gmail.com,{physics:50,maths:100,chemistry:60}"]
for indiviual  in studentDetails {
    count += 1
    let separatedByBraces = indiviual.replacingOccurrences(of :"}" ,with: ",")
    let separatedStudentDetails =  separatedByBraces.components(separatedBy: ",")
    let separatedByPhysics = separatedByBraces.components(separatedBy: "physics:")
    let separatedByChemistry = separatedByBraces.components(separatedBy: "chemistry:")
    let separatedByMaths = separatedByBraces.components(separatedBy: "maths:")
    let physicsMark = separatedByPhysics[1].components(separatedBy: ",")
    let chemistryMark = separatedByChemistry[1].components(separatedBy: ",")
    let mathsMark = separatedByMaths[1].components(separatedBy: ",")
    var totalMark = (Int(physicsMark[0]) ?? 0) + (Int(chemistryMark[0]) ?? 0) + (Int(mathsMark[0]) ?? 0)
    let percentage = totalMark / 3
    let email = separatedStudentDetails[2]
    if email.contains("@") && email.contains(".") {
        let beforeAt = email.components(separatedBy: "@")
        let afterDot = email.components(separatedBy: ".")
        if beforeAt[0] != "" && afterDot[1] != "" {
            var studentDetailsObject = StudentDetails(studentName:separatedStudentDetails[0], studentId:separatedStudentDetails[1], physics:Int(physicsMark[0]) ?? 0, chemistry:Int(chemistryMark[0]) ?? 0, maths:Int(mathsMark[0]) ?? 0, totalMark:totalMark, percentage: percentage )
            if count == studentDetails.count {
                studentDetailsObject.ranklist()
            }
        }
        else {
               print("Wrong Email Format")
           }
    }
    else {
        print("Wrong Email Format")
    }
    
}

