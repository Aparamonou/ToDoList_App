//
//  ForgotPasswordView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 18.08.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    //MARK: - Localized Property
    private let titleForgotScreen = NSLocalizedString("titleForgotScreen", comment: "")
    private let subtitleForgotScreen = NSLocalizedString("subtitleForgotScreen", comment: "")
    private let buttonSend = NSLocalizedString("buttonSend", comment: "")
    
    //MARK: - Properties
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var textMail = ""
 
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Forgot Password")
                    .padding(.init(top: 34, leading: 0, bottom: 0, trailing: 155))
                    .font(.custom(FontsManeger.Roboto.thin, size: 32))
                    .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                Text("Please enter your email below to recevie your password reset instructions")
                    
                    .padding(.init(top: 12, leading: 15, bottom: 0, trailing: 5))
                    .font(.custom(FontsManeger.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.608, green: 0.608, blue: 0.608))
            }
            VStack {
                Text("Username")
                    .padding(.init(top: 49, leading: 0, bottom: 17, trailing: 300))

                        
                TextField("Enter your mail", text: $textMail) {
                
                }
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 175))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            
            VStack {
               
                NavigationLink("Send Request") {
                    ResetPasswordView()
                }
                .font(.custom(FontsManeger.Roboto.thin, size: 21))
                .frame(width: 327, height: 48)
                .background(Color(red: 0.976, green: 0.376, blue: 0.376))
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.init(top: 81, leading: 0, bottom: 0, trailing: 0 ))
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
