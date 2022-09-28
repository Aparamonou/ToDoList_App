//
//  SingOutUserModel.swift
//  ToDoList
//
//  Created by Alex Paramonov on 16.09.22.
//

import Foundation


struct SingOutUserDataModel: Codable {
    let data: SingOutUserModel
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct SingOutUserModel: Codable {
    let success: String
    
    enum CodingKeys: String, CodingKey {
        case success
    }
}
