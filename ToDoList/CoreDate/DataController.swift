//
//  DataController.swift
//  ToDoList
//
//  Created by Alex Paramonov on 6.09.22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ToDoList")
    
    init () {
        container.loadPersistentStores { description, error in
            if let error  = error {
                print("\(error)")
            }
        }
    }
}
