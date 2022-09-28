//
//  SingUpModel.swift
//  ToDoList
//
//  Created by Alex Paramonov on 13.09.22.
//

import Foundation

struct SingUpUserDataModel: Codable {
    let data: SingUpUserModel
   
    enum CodingKeys: String, CodingKey {
        case data
       
    }
}

struct SingUpUserModel: Codable {
    let id: String
    let email: String
    let username: String
    let avatar_url: String?
    var user_session: UserSession
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case avatar_url
        case user_session
    }
}

struct UserSession: Codable {
    let user_id: String?
    let access_token: String
    let token_type: String
    let refresh_token: String
    let expires_in: Int
    
    enum CodingKeys: String, CodingKey {
        case user_id
        case access_token
        case token_type
        case refresh_token
        case expires_in
    }
}

