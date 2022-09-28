//
//  NavAppearanceModifier.swift
//  ToDoList
//
//  Created by Alex Paramonov on 21.09.22.
//

import Foundation
import SwiftUI

struct NavAppearanceMidifier: ViewModifier {
    init(backgroundColor: UIColor, foregroundColor: UIColor) {
      let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.titleTextAttributes = [.foregroundColor: foregroundColor]
        navBarAppearence.titleTextAttributes = [.font: UIFont(name: FontsManeger.Roboto.thin, size: 20)!]
        navBarAppearence.backgroundColor = backgroundColor
        navBarAppearence.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearence
        UINavigationBar.appearance().compactAppearance = navBarAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearence
        UINavigationBar.appearance().tintColor = UIColor(Color(red: 249/255, green: 96/255, blue: 96/255))
    }
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationAppearance(backgroundColor: UIColor, foregroundColor: UIColor) -> some View {
        self.modifier(NavAppearanceMidifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor))
    }
}
