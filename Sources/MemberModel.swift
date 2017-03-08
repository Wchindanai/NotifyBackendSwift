//
//  Member.swift
//  BackendSwift
//
//  Created by Chindanai Wasanachin on 3/8/2560 BE.
//
//

import StORM
import MySQLStORM

class MemberModel: MySQLStORM {
    // Set some properties for the object
    // These properties are reflected in the database table
    // NOTE: First param in class should be the ID.
    var id              : Int32 = 0
    var firstname		: String = ""
    var lastname		: String = ""
    var email			: String = ""
    var tel             : String = ""
    var username        : String = ""
    var password        : String = ""
    var admin           : String = ""
    
    // The name of the database table
    override open func table() -> String {
        return "Member"
    }
    
    // The mapping that translates the database info back to the object
    // This is where you would do any validation or transformation as needed
    override func to(_ this: StORMRow) {
        id				= this.data["id"] as! Int32
        firstname		= this.data["firstname"] as! String
        lastname		= this.data["lastname"] as! String
        email			= this.data["email"] as! String
        tel             = this.data["tel"] as! String
        username        = this.data["username"] as! String
        password        = this.data["password"] as! String
        admin           = this.data["admin"] as! String
    }
    
    // A simple iteration.
    // Unfortunately necessary due to Swift's introspection limitations
    func rows() -> [MemberModel] {
        var rows = [MemberModel]()
        for i in 0..<self.results.rows.count {
            let row = MemberModel()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}
