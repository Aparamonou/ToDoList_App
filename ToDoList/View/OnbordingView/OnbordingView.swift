//
//  OnbordingView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 28.07.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct OnbordingView: View {
    
    //MARK: - Localized Property
    private let buttonText = NSLocalizedString("subtitleScreenOne", comment: "")
    private let titleScreenOne = NSLocalizedString("titleScreenOne", comment: "")
    private let titleScreenTwo = NSLocalizedString("titleScreenOne", comment: "")
    private let titleScreenTheree = NSLocalizedString("titleScreenTheree", comment: "")
    private let subtitleScreenOne = NSLocalizedString("subtitleScreenOne", comment: "")
    private let subtitleScreenTwo = NSLocalizedString("subtitleScreenTwo", comment: "")
    private let subtitleScreenTheree = NSLocalizedString("subtitleScreenTheree", comment: "")

    // MARK: - Constants
    private let screens: [OnbordingTop] = [
        OnbordingTop(imageTop: "OnbordingOne" , title: "Welcome to todo list", subTitle: "Whats going to happen tomorrow?"),
        OnbordingTop(imageTop: "OnbordingTwo", title: "Work happens", subTitle: "Get notified when work happens."),
        OnbordingTop(imageTop: "OnbordingThree", title: "Tasks and assign", subTitle: "Task and assign them to colleagues.")
    ]
    
    @State private var currentIndex = 0
    @ObservedObject var userViewModel = UserViewModel()
    @State var isLogin: Bool = false
    
    // MARK: - Bodytext
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TabView(selection: $currentIndex.animation()) {
                    ForEach(0..<screens.count, id: \.self) { index in
                        screens[index]
                            .id(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(.page(backgroundDisplayMode: .never))
//                .ignoresSafeArea(.container, edges: .all)
                .overlay(Fancy3DotsIndexView(numberOfPages: screens.count, currentIndex: currentIndex))
                

                ZStack {
                    switch currentIndex {
                    case 0:
                        Image("redImage")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    case 1:
                        withAnimation {
                            Image("purpleImage")
                                .resizable()
                                .ignoresSafeArea()
                                .frame(width: 438, height: 322)
                        }
                    case 2:
                        Image("blueImage")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    default:
                        Image("redImage")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    }
                    
                    NavigationLink("Get Started") {
                        SingUpView(isLoading: $isLogin, userViewModel: userViewModel)
                    }
                    .font(.custom(FontsManeger.Roboto.thin, size: 18))
                    .frame(width: 293, height: 48)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                    .padding(.init(top: 31, leading: 0, bottom: 0, trailing: 0 ))
                }
                
            }
            .offset(y: 0)
        }
        
    }
    
}

struct OnbordingTop: View {
    
    // MARK: - Properties
    
    @State private var navigate = false
    
    let imageTop: String
    let title: String
    let subTitle: String
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 0){
            Image(imageTop)
                .frame(width: 305, height: 252)
                .padding(.init(top: 108, leading: 35, bottom: 0, trailing: 35))
//                .ignoresSafeArea()
            Spacer()
            Text(title)
                .font(.custom(FontsManeger.Roboto.thin, size: 24))
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            Text(subTitle)
                .font(.custom(FontsManeger.Roboto.medium, size: 18))
                .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                .opacity(0.8)
            Spacer()
        }
        .offset(y: -50)
    }
}

struct Onbording_PreviewProvider {
    static var previews: some View {
        OnbordingTop(imageTop: "OnbordingOne", title: "Welcome to todo list", subTitle: "Whats going to happen tomorrow?")
    }
}

@available(iOS 16.0, *)
struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct Fancy3DotsIndexView: View {
    
    // MARK: Properties
    let numberOfPages:Int
    let currentIndex: Int
    
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 8
    
    private let primaryColor = Color.black
    private let secondaryColor = Color.black.opacity(0.2)
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(1)
                    .frame(width: circleSize, height: circleSize)
                    .id(index)
            }
        }
//        .offset(y: 0)
        .padding(.init(top: 450, leading: 0, bottom: 0, trailing: 0))
        
    }
}
