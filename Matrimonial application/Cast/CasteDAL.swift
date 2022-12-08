//
//  CastDAL.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 24/11/22.
//

import UIKit

class CasteDAL: NSObject {
    
    class func getUser()->[Caste]
    {
        var Castes:[Caste] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open(){
            
            let quary = "select * from Caste"
            do{
                let resultSet = try dbconn.executeQuery(quary, values: [])
                
                while (resultSet.next()){
                    
                    let c:Caste = Caste()
                    
                    c.CasteId = resultSet.int(forColumn: "CasteId")
                    c.CasteName = resultSet.string(forColumn: "CasteName")!
                    
                    
                    
                    Castes.append(c)
                    
                    print(Castes.count)
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
        
        return Castes
    }
    
}
