//
//  UserViewModel.swift
//  ToDoList
//
//  Created by Alex Paramonov on 13.09.22.
//

import Foundation
import Combine
import CoreData

class UserViewModel: ObservableObject {
    
    @Published var isLoding: Bool = false
    @Published var errorMessage: String = ""
    @Published var isError: Bool  = false
    
    var cancellabelToken: AnyCancellable?
    
}

extension UserViewModel {
    
    func singUp(username: String, email: String, password: String) {
        self.isLoding.toggle()
        let formDate = SingUpUseCase(username: username, email: email, password: password)
        cancellabelToken = RemoteService.singUp(useCase: formDate)
            .mapError({(error) -> Error in
                self.isLoding.toggle()
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                self.isLoding.toggle()
                print(value)
                
            })
            
    }
    
    func singIn(email: String, password: String) {
        self.isLoding.toggle()
        let formDate = SingInUseCase(email: email, password: password)
        cancellabelToken = RemoteService.singIn(useCase: formDate)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                self.isLoding.toggle()
                print(value.data)
            })
    }
    
    func refreshToken(refresh_token: String) {
        let formDate = RefreshTokenUseCase(refresh_token: refresh_token)
        cancellabelToken = RemoteService.refreshToken(useCase: formDate)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                print(value)
            })
    }
    
    func singOut(email: String) {
        let formDate = SingOutUseCase(email: email)
        cancellabelToken = RemoteService.singOut(useCase: formDate)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                print(value)
            })
    }
}
