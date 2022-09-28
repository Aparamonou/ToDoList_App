//
//  NavigationConfigurator.swift
//  ToDoList
//
//  Created by Alex Paramonov on 21.09.22.
//

import Foundation
import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configurate: (UINavigationController) -> Void = { _ in}
    func makeUIViewController(context: Context) -> some UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if let nc = uiViewController.navigationController {
            self.configurate(nc)
        }
    }
}
