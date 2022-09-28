//
//  SuccesfulView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 2.08.22.
//

import SwiftUI

struct SuccesfulView: View {
    //MARK: - Localized Property
    private let titleSuccesful = NSLocalizedString("titleSuccesful", comment: "")
    private let subtitleSuccesful = NSLocalizedString("subtitleSuccesful", comment: "")
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Image("succesful")
                .frame(width: 162, height: 170)
                .padding(.init(top: 170, leading: 107, bottom: 40, trailing: 106))
            
            Text("Succesful")
                .font(.custom(FontsManeger.Roboto.thin, size: 32))
                .padding(.init(top: 0, leading: 113, bottom: 10, trailing: 124))
              
            
            
            Text("You have succesfully change password. Please use your new passwords when logging in.")
                .frame(width: 330, height: 57)
                .font(.custom(FontsManeger.Roboto.medium, size: 16))
                .multilineTextAlignment(.center)
                .padding(.init(top: 0, leading: 23, bottom: 0, trailing: 22))
            Spacer()
        }
    }
}

struct SuccesfulView_Previews: PreviewProvider {
    static var previews: some View {
        SuccesfulView()
    }
}
