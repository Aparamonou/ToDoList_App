//
//  ResetPasswordView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 18.08.22.
//

import SwiftUI

struct ResetPasswordView: View {
    //MARK: - Localized Property
    private let titleResetScreen = NSLocalizedString("titleResetScreen", comment: "")
    private let subtitleResetScreen = NSLocalizedString("subtitleResetScreen", comment: "")
    private let reset_code = NSLocalizedString("Reset_code", comment: "")
    private let placeholderNumber = NSLocalizedString("placeholderNumber", comment: "")
    private let new_password = NSLocalizedString("New_password", comment: "")
    private let confirm_Password = NSLocalizedString("Confirm_Password", comment: "")
    private let placeholderConfirm = NSLocalizedString("placeholderConfirm", comment: "")
    private let change_password = NSLocalizedString("Change_password", comment: "")
    
    // MARK: - Properties
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var textMail = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Reset Password")
                    .padding(.init(top: 34, leading: 0, bottom: 0, trailing: 173))
                    .font(.custom(FontsManeger.Roboto.thin, size: 32))
                    .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                Text("Reset code was sent to your email. Please enter the code and create new password")
                    .frame(width: 340, height: 38)
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 80))
                    .font(.custom(FontsManeger.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.608, green: 0.608, blue: 0.608))
            }
            VStack {
                Text("Reset code")
                    .padding(.init(top: 49, leading: 0, bottom: 17, trailing: 294))

                        
                TextField("Enter your number", text: $textMail) {
                
                }
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 180))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            VStack {
                Text("New password")
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing: 264))

                        
                SecureField("Enter your password", text: $newPassword) {
                
                }
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 180))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            
            VStack {
                Text("Confirm Password")
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing:240))

                        
                SecureField("Enter your Confirm password", text: $confirmPassword) {
                
                }
                .frame(width: 215, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 160))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            
            VStack {
               
                NavigationLink("Change password") {
                    SuccesfulView()
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
//        .offset(y: -40)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem (placement: .navigationBarLeading) {
                CustomBackButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
