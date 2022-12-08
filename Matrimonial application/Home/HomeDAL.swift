//
//  HomeDAL.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 22/11/22.
//

import UIKit

class HomeDAL: NSObject {
    
    class func getCandidates() -> [Candidate] {
        var candidates: [Candidate] = []
        
        let dbConn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbConn.open(){
            
            let query = "select * from Profile,Caste where Profile.CasteId = Caste.CasteId"
            do{
                let resultSet = try dbConn.executeQuery(query, values: [])
                while(resultSet.next()){
                    
                    let candidate:Candidate = Candidate()
                    candidate.candidateProfileId = resultSet.int(forColumn: "ProfileID")
                    candidate.candidateName = resultSet.string(forColumn: "Name") ?? ""
                    candidate.candidateGender = resultSet.string(forColumn: "Gender") ?? ""
                    candidate.candidateDateOfBirth = resultSet.string(forColumn: "DOB") ?? ""
                    candidate.candidateAge = resultSet.int(forColumn: "Age")
                    candidate.candidateCastId = resultSet.int(forColumn: "CasteId")
                    candidate.candidateCast = resultSet.string(forColumn: "CasteName") ?? ""
                    candidate.candidateEducation = resultSet.string(forColumn: "Education") ?? ""
                    candidate.candidateHeight = resultSet.string(forColumn: "Height") ?? ""
                    candidate.candidateAddress = resultSet.string(forColumn: "Address") ?? ""
                    candidate.candidateCity = resultSet.string(forColumn: "City") ?? ""
                    candidate.candidateState = resultSet.string(forColumn: "State") ?? ""
                    candidate.candidatePhoneNo = resultSet.string(forColumn: "Phone") ?? ""
                    candidate.candidateMobileNo = resultSet.string(forColumn: "Mobile") ?? ""
                    candidate.candidateEmai = resultSet.string(forColumn: "Email") ?? ""
                    candidate.candidateRemark = resultSet.string(forColumn: "Remarks") ?? ""
                    candidate.candidateisFavourite = resultSet.int(forColumn: "IsFavourite")
                    candidates.append(candidate)
                    
                    //print(candidates.count)
                }
            }
            catch{
                print(error)
            }
        }
        else{
            print("Not connected with database")
        }
        
        dbConn.close()
        
        return candidates
    }
    
    class func getFavouriteCandidate()->[Candidate]
    {
        var Favouritecandidates:[Candidate] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "select * from Profile where IsFavourite = 1"
            do{
                let resultSet = try dbconn.executeQuery(quary, values: [])
                
                while (resultSet.next()){
                    
                    let SigleCandidate:Candidate = Candidate()
                    
                    SigleCandidate.candidateProfileId = resultSet.int(forColumn: "ProfileID")
                    SigleCandidate.candidateName = resultSet.string(forColumn: "Name") ?? ""
                    SigleCandidate.candidateGender = resultSet.string(forColumn: "Gender") ?? ""
                    SigleCandidate.candidateDateOfBirth = resultSet.string(forColumn: "DOB") ?? ""
                    SigleCandidate.candidateAge = resultSet.int(forColumn: "Age")
                    SigleCandidate.candidateCastId = resultSet.int(forColumn: "CasteId")
                    SigleCandidate.candidateEducation = resultSet.string(forColumn: "Education") ?? ""
                    SigleCandidate.candidateHeight = resultSet.string(forColumn: "Height") ?? ""
                    SigleCandidate.candidateAddress = resultSet.string(forColumn: "Address") ?? ""
                    SigleCandidate.candidateCity = resultSet.string(forColumn: "City") ?? ""
                    SigleCandidate.candidateState = resultSet.string(forColumn: "State") ?? ""
                    SigleCandidate.candidatePhoneNo = resultSet.string(forColumn: "Phone") ?? ""
                    SigleCandidate.candidateMobileNo = resultSet.string(forColumn: "Mobile") ?? ""
                    SigleCandidate.candidateEmai = resultSet.string(forColumn: "Email") ?? ""
                    SigleCandidate.candidateRemark = resultSet.string(forColumn: "Remarks") ?? ""
                    SigleCandidate.candidateisFavourite = resultSet.int(forColumn: "IsFavourite")
                    Favouritecandidates.append(SigleCandidate)
                
                    // print(Favouritecandidates.count)
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        return Favouritecandidates
    }
    
    class func AddCandidate(c:Candidate)->(Bool){
        
        var flag : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let query = "insert into Profile(Name,Gender,DOB,Age,CasteId,Education,Height,Address,City,State,Phone,Mobile,Email,Remarks,IsFavourite) values('\(c.candidateName)','\(c.candidateGender)','\(c.candidateDateOfBirth)','\(c.candidateAge)','\(c.candidateCastId)','\(c.candidateEducation)','\(c.candidateHeight)','\(c.candidateAddress)','\(c.candidateCity)','\(c.candidateState)','\(c.candidatePhoneNo)','\(c.candidateMobileNo)','\(c.candidateEmai)','\(c.candidateRemark)','\(c.candidateisFavourite)')"
            do{
                let resultSet = try dbconn.executeUpdate(query, withArgumentsIn: [])
                
                if resultSet {
                    flag = true
                }
                else{
                    flag = false
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        print("submit btn work \(flag)")
        
        return true
    }
    
    class func DelateCandidate(c:Candidate)->(Bool){
        
        var status : Bool = Bool()
        let dbConn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbConn.open(){
            let query = "delete from Profile where ProfileID ='\(c.candidateProfileId)'"
            do {
                let resultSet = try dbConn.executeUpdate(query, withArgumentsIn: [])
                
                if resultSet {
                    status = true
                }
                else{
                    status = false
                }
            }
            catch{
                print("error")
            }
        }
        else {
            print("Not Connected with database")
        }
        dbConn.close()
        print(status)
        return status
        
    }
    
    class func EditCandidate(c:Candidate)->(Bool){
        
        var status : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "update Profile set Name = '\(c.candidateName)',Gender = '\(c.candidateGender)',DOB = '\(c.candidateDateOfBirth)',Age = '\(c.candidateAge)',CasteId = '\(c.candidateCastId)',Education = '\(c.candidateEducation)',Height = '\(c.candidateHeight)',Address = '\(c.candidateHeight)',City = '\(c.candidateCity)',State = '\(c.candidateState)',Phone = '\(c.candidatePhoneNo)',Mobile = '\(c.candidateMobileNo)',Email = '\(c.candidateEmai)',Remarks = '\(c.candidateRemark)',IsFavourite = '\(c.candidateisFavourite)' where ProfileID = '\(c.candidateProfileId)' "
            do{
                let resultSet = try dbconn.executeUpdate(quary, withArgumentsIn: [])
                
                if resultSet {
                    status = true
                }
                else{
                    status = false
                }
            }
            catch{
                print(error)
            }
            
        }
        else{
            print("not connect datatabse")
        }
        dbconn.close()
        
        print("edit status \(status)")
        
        return true
        
    }
    
    class func Search(Gender:String , Caste:String , Age1:Int ,Age2:Int)->[Candidate]{
        
        var candidatesArray:[Candidate] = []
            let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
            
            if dbconn.open(){
                
                let quary = Quary(Gender: Gender, Caste: Caste, Age1: Age1, Age2: Age2)
                print(quary)
                do{
                    let resultSet = try dbconn.executeQuery(quary, values: [])
                    
                    while (resultSet.next()){
                        
                        let SigleUser:Candidate = Candidate()
                        
                        SigleUser.candidateProfileId = resultSet.int(forColumn: "ProfileID")
                        SigleUser.candidateName = resultSet.string(forColumn: "Name") ?? ""
                        SigleUser.candidateGender = resultSet.string(forColumn: "Gender") ?? ""
                        SigleUser.candidateDateOfBirth = resultSet.string(forColumn: "DOB") ?? ""
                        SigleUser.candidateAge = resultSet.int(forColumn: "Age")
                        SigleUser.candidateCastId = resultSet.int(forColumn: "CasteId")
                        SigleUser.candidateEducation = resultSet.string(forColumn: "Education") ?? ""
                        SigleUser.candidateHeight = resultSet.string(forColumn: "Height") ?? ""
                        SigleUser.candidateAddress = resultSet.string(forColumn: "Address")!
                        SigleUser.candidateCity = resultSet.string(forColumn: "City")!
                        SigleUser.candidateState = resultSet.string(forColumn: "State")!
                        SigleUser.candidatePhoneNo = resultSet.string(forColumn: "Phone")!
                        SigleUser.candidateMobileNo = resultSet.string(forColumn: "Mobile")!
                        SigleUser.candidateEmai = resultSet.string(forColumn: "Email")!
                        SigleUser.candidateRemark = resultSet.string(forColumn: "Remarks")!
                        SigleUser.candidateisFavourite = resultSet.int(forColumn: "IsFavourite")
//                        SigleUser.CasteName = resultSet.string(forColumn: "CasteName")!
                        
                        print(candidatesArray.count)
                        candidatesArray.append(SigleUser)
                    }
                }
                catch{
                    print(error)
                }
            }
            else{
                print("not connect datatabse")
            }
            dbconn.close()
            
            return candidatesArray
    }
}

    func Quary(Gender:String , Caste:String , Age1:Int ,Age2:Int)-> String{
        var ans:String = String()
        
        if Gender == "All" && Caste == "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile"
            return ans
        }
        else if Gender != "All" && Caste == "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile where Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste != ""  && Age1 == 0 && Age2 == 0 {
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)')'"
            return ans
        }
        else if Gender != "All" && Caste != "" && Age1 == 0 && Age2 == 0{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)')and Profile.Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste == "" && Age1 != 0 && Age2 != 0 {
            ans = "select * from Profile where Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
        else if  Gender != "All" && Caste == "" && Age1 != 0 && Age2 != 0 {
            ans = "select * from Profile where Age BETWEEN '\(Age1)' AND '\(Age2)' AND Profile.Gender = '\(Gender)'"
            return ans
        }
        else if Gender == "All" && Caste != "" && Age1 != 0 && Age2 != 0{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)') and Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
        else{
            ans = "select * from Profile INNER JOIN Caste where Profile.CasteId=(select CasteId from Caste where CasteName = '\(Caste)' ) and Caste.CasteId = (select CasteId from Caste where CasteName = '\(Caste)')' and Profile.Gender = '\(Gender)' and Age BETWEEN '\(Age1)' AND '\(Age2)'"
            return ans
        }
    }
