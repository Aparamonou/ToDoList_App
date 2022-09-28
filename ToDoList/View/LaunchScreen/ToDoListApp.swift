//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Alex Paramonov on 28.07.22.
//

import SwiftUI

@available(iOS 16.0, *)
    @main
struct ToDoListApp: App {
    @StateObject private var dataController = DataController()
    @StateObject var viewRouter =  ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
