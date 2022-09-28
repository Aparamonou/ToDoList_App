//
//  ProjectModel.swift
//  ToDoList
//
//  Created by Alex Paramonov on 28.09.22.
//

import Foundation

struct ProjectModel: Identifiable {
    
    var id = UUID()
    var color: TapColors
    var nameProject: String
    var tasks: [TaskModel] = []
}
