//
//  SingInView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 18.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SingInView: View {
    //MARK: - Localized Property
    private let titleSingInScreen = NSLocalizedString("titleSingInScreen", comment: "")
    private let subtitleSingInScreen = NSLocalizedString("subtitleSingInScreen", comment: "")
    private let usernameLocalized = NSLocalizedString("Username", comment: "")
    private let forgotPassword = NSLocalizedString("forgotPassword", comment: "")
    
    //MARK: - Properties
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username = ""
    @State private var password = ""
    @ObservedObject var userViewModel = UserViewModel()
    @State var isLogin: Bool = false
    @StateObject var viewRouter = ViewRouter()
    //MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Welcome Back")
                    .padding(.init(top: 34, leading: 0, bottom: 0, trailing: 188))
                    .font(.custom(FontsManeger.Roboto.thin, size: 32))
                    .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                Text("Sign in to continue")
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 250))
                    .font(.custom(FontsManeger.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.608, green: 0.608, blue: 0.608))
            }
            VStack {
                Text("Username")
                    .padding(.init(top: 49, leading: 0, bottom: 17, trailing: 300))
                
                
                TextField("Enter your mail", text: $username) {
                    
                }
                .textContentType(.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 180))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            VStack {
                Text("Password")
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing: 300))
                
                
                SecureField("Enter your password", text: $password) {
                    
                }
                .textContentType(.password)
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 180))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            VStack {
                NavigationLink("Forgot password") {
                    ForgotPasswordView()
                }
                .font(.custom(FontsManeger.Roboto.thin, size: 18))
                .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192, opacity: 1))
                .padding(.init(top: 12, leading: 190, bottom: 0, trailing: 0))
                NavigationLink("Sing In") {
                    TabBarView(viewRouter: viewRouter)
                }
                .font(.custom(FontsManeger.Roboto.thin, size: 21))
                .frame(width: 327, height: 48)
                .background(Color(red: 0.976, green: 0.376, blue: 0.376))
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.init(top: 81, leading: 0, bottom: 0, trailing: 0 ))
            }
            NavigationLink("Sing up") {
                SingUpView(isLoading: $isLogin, userViewModel: userViewModel)
            }
            .foregroundColor(.red)
            .font(.custom(FontsManeger.Roboto.medium, size: 18))
            .padding(.init(top: 118, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            
        }
//
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

@available(iOS 16.0, *)
struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
