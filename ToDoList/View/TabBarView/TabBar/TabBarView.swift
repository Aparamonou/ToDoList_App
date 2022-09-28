//
//  TabBarView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 19.09.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct TabBarView: View {
    //MARK: - Locolazed Property
    private let taskItemName = NSLocalizedString("my_task", comment: "")
    private let menuItemName = NSLocalizedString("menu", comment: "")
    private let quickItemName = NSLocalizedString("quick", comment: "")
    private let profileItemName = NSLocalizedString("profile", comment: "")
    
    //MARK: - Property
    @StateObject var viewRouter: ViewRouter
    @State var showCreatMenu: Bool = false
    @State var showFilterMenu: Bool = false 
    // MARK: - Body
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    switch viewRouter.currentPage {
                    case .task:
                        TaskView()
                    case .menu:
                        MenuView()
                    case .quick:
                        QuickView()
                    case .profile:
                        ProfileView()
                        
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            TabBarItem(viewRouter: viewRouter, assignedPage: .task,width: geometry.size.width/5, height: geometry.size.height/25, systemIconName: "checkmark.circle.fill", tabName: "My Task")
                            TabBarItem(viewRouter: viewRouter, assignedPage: .menu, width: geometry.size.width/5, height: geometry.size.height/25, systemIconName: "square.grid.2x2.fill", tabName: "Menu")
                            ZStack {
                                Circle()
                                    .fill(.linearGradient(Gradient(colors: showCreatMenu ? [.red] : [Color(red: 246/255, green: 136/255, blue: 136/255),
                                                                                                     Color(red: 249/255, green: 96/255, blue: 96/255)]), startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 70, height: 70)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 20)
                                    .rotationEffect(Angle(degrees: showCreatMenu ? 135 : 0))
                            }
                            .offset(y: -geometry.size.height/8/4)
                            .onTapGesture {
                                withAnimation {
                                    self.showCreatMenu.toggle()
                                }
                            }
                            
                            TabBarItem(viewRouter: viewRouter, assignedPage: .quick, width: geometry.size.width/5, height: geometry.size.height/25, systemIconName: "list.bullet.rectangle.portrait.fill", tabName: "Quick")
                            TabBarItem(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/5, height: geometry.size.height/25, systemIconName: "person.fill", tabName: "Profile")
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/10)
                        .background(Color("barColor"))
                    }
                }
                
            }
            if showCreatMenu {
                GeometryReader { _ in
                    AlertPlusButton()
                        .cornerRadius(5)
                        .padding(.leading, 75)
                        .padding(.top, 275)
                }
                .background(
                    Color.black.opacity(0.5)
                        .onTapGesture {
                            withAnimation {
                                self.showCreatMenu.toggle()
                            }
                        }
                )
            }
        }
    }
}

struct TabBarItem: View {
    //MARK: - Property
    
    @StateObject  var viewRouter: ViewRouter
    let assignedPage: ViewRouter.Page
    
    let width: CGFloat
    let height: CGFloat
    let systemIconName: String
    let tabName: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width,
                       height: height)
                .padding(.top, 25)
            Text(tabName)
                .font(.custom(FontsManeger.Roboto.thin, size: 14))
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .gray)
    }
}


@available(iOS 16.0, *)
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}
