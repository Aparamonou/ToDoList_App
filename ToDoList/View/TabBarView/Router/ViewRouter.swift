//
//  ViewRouter.swift
//  ToDoList
//
//  Created by Alex Paramonov on 19.09.22.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .task
    
    enum Page {
        case task
        case menu
        case quick
        case profile
    }
}
