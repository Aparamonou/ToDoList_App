//
//  RemoteService.swift
//  ToDoList
//
//  Created by Alex Paramonov on 13.09.22.
//

import Foundation
import Combine

struct RemoteService {
    static let apiClient = ApiClient()
}

enum ApiPath: String {
    case singUp = "sign-up"
    case singIn = "sign-in"
    case singOut = "sign-out"
    case refreshToken = "refresh-token"
}

extension RemoteService {
    
    
    
    static func singUp(useCase: SingUpUseCase) ->  AnyPublisher<SingUpUserDataModel, Error > {
        guard let formData = try? JSONEncoder().encode(useCase) else {
            fatalError("Error")
        }
        let request = ApiService.requset(.singUp, method: .post, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func singIn(useCase: SingInUseCase) -> AnyPublisher<SingInUserDataModel, Error> {
        let token = ""
        guard let formData = try? JSONEncoder().encode(useCase) else {
            fatalError("Error")
        }
        let request = ApiService.requset(ApiPath.singIn, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func refreshToken(useCase: RefreshTokenUseCase) -> AnyPublisher<RefreshTokenDataModel, Error> {
        let token = ""
        let refreshToken = "a"
        guard let formData = try? JSONEncoder().encode(refreshToken) else {
            fatalError("Error")
        }
        let request = ApiService.requset(ApiPath.refreshToken, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func singOut(useCase: SingOutUseCase) -> AnyPublisher<SingOutUserDataModel, Error> {
        let token = "a"
        guard let formData = try? JSONEncoder().encode(useCase) else {
            fatalError("Error")
        }
        let request = ApiService.requset(.singOut, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    
    
}
