//
//  SingUpView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 2.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SingUpView: View {
    //MARK: - Localized Property
    private let buttonText = NSLocalizedString("subtitleScreenOne", comment: "")
    private let titleSingUpScreen = NSLocalizedString("titleSingUpScreen", comment: "")
    private let subtitleSingUpScreen = NSLocalizedString("subtitleSingUpScreen", comment: "")
    private let usernameLocalized = NSLocalizedString("Username", comment: "")
    private let placeholderEmail = NSLocalizedString("placeholderEmail", comment: "")
    private let Password = NSLocalizedString("Password", comment: "")
    private let placeholderPassword = NSLocalizedString("placeholderPassword", comment: "")
    private let singUpButton = NSLocalizedString("Sing_Up", comment: "")
    private let singInButton = NSLocalizedString("Sing_In", comment: "")
    
    //MARK: - Properties
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var username = ""
    @State private var password = ""
    @State private var useremail = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    @Binding  var isLoading: Bool
    @ObservedObject  var userViewModel: UserViewModel
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Welcome")
                    .padding(.init(top: 94, leading: 0, bottom: 0, trailing: 244))
                    .font(.custom(FontsManeger.Roboto.thin, size: 32))
                    .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                Text("Sign up to continue")
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 230))
                    .font(.custom(FontsManeger.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.608, green: 0.608, blue: 0.608))
            }
            ZStack(alignment: .center){
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 107, height: 104)
                    .background(Color.init(red: 0.769, green: 0.769, blue: 0.769))
                    .border(Color.init(red: 0.976, green: 0.376, blue: 0.376), width: 1)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        showSheet  = true
                    }
            }
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            }
            VStack {
                Text("Username")
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing: 294))
                
                
                TextField("Enter your name", text: $username) {
                    
                }
                .textContentType(.username)
                .frame(width: 196, height: 19)
                .font(.system(size: 16))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 180))
                
                Rectangle()
                    .frame(width: 346, height: 2)
                    .foregroundColor(Color(red: 0.928, green: 0.928, blue: 0.928))
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 29))
            }
            VStack {
                Text("Email")
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing: 335))
                
                
                TextField("Enter your email", text: $useremail) {
                    
                }
                .textContentType(.username)
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
                    .padding(.init(top: 26, leading: 0, bottom: 17, trailing: 294))
                
                
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
                Button("Sing Up") {
                    userViewModel.singUp(username: username, email: useremail, password: password)
                }
                .font(.custom(FontsManeger.Roboto.thin, size: 21))
                .frame(width: 327, height: 48)
                .background(Color(red: 0.976, green: 0.376, blue: 0.376))
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.init(top: 85, leading: 0, bottom: 0, trailing: 0 ))
            }
            NavigationLink("Sing In") {
                SingInView()
            }
            .foregroundColor(.red)
            .font(.custom(FontsManeger.Roboto.medium, size: 18))
            .padding(.init(top: 51, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            
        }
        .offset(y: -40)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                CustomBackButton {
                    presentationMode.wrappedValue.dismiss() // <---
                }
            }
        }
    }
        
}

//struct SingUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingUpView(isLoading: >, userViewModel.)
//    }
//}
//

