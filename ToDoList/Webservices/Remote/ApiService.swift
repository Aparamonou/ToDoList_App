//
//  ApiService.swift
//  ToDoList
//
//  Created by Alex Paramonov on 13.09.22.
//

import Foundation

import Foundation
import SwiftUI

struct ApiService {
    static let Url = URL(string: "https://todolist.dev2.cogniteq.com/api/v1")
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

extension ApiService {
    
    
    static func requset (_ path: ApiPath, method: RequestMethod, token: String = "", formData: Data = Data()) -> URLRequest {
        guard let baseURL = Url, let components = URLComponents(url: baseURL.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true),
              let url = components.url else {
            fatalError("Can't open the url")
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = method.rawValue
        request.setValue("\(String(describing: formData.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !token.isEmpty {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch method {
        case .post, .put:
            request.httpBody = formData
        case .delete:
            break
        case .get:
            break
        }
        
        return request
    }
}
