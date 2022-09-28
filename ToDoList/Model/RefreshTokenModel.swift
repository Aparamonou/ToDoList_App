//
//  RefreshTokenModel.swift
//  ToDoList
//
//  Created by Alex Paramonov on 16.09.22.
//

import Foundation

struct RefreshTokenDataModel: Codable {
    let data: RefreshTokenModel
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct RefreshTokenModel: Codable {
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
