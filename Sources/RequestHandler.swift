//
//  RequestHandler.swift
//  BackendSwift
//
//  Created by Chindanai Wasanachin on 3/8/2560 BE.
//
//
import PerfectLib
import PerfectHTTP

class RequestHandler {
   open static func getMember(request: HTTPRequest, _ response: HTTPResponse)  {
        response.setHeader(.contentType, value:"application/json")
        let member = MemberModel()
        do{
            try member.findAll()
            if(member.results.cursorData.totalRecords > 0){
                response.status = .ok
                var Json : [[String:Any]] = []
                var members : [String:Any]
                for row in member.rows(){
                    members = [
                        "id":row.id,
                        "firstname": row.firstname,
                        "lastname": row.lastname,
                        "email": row.email,
                        "username": row.username,
                        "password": row.password
                    ]
                    Json.append(members)
                }
                let JsonString = try Json.jsonEncodedString()
                response.appendBody(string: JsonString)
                response.completed()
            }
        }catch{
            print("\(error)")
        }
        response.completed()
    }
}
