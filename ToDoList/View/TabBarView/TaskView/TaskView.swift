//
//  TaskView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 19.09.22.
//

import SwiftUI

struct TaskView: View {
    //MARK: - Property
    @State var currentButton: Bool = true
    @State var filterButton: Bool = false
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    //Color(red: 249/255, green: 96/255, blue: 96/255)
                    HStack(spacing: 130) {
                        Spacer()
                        Text("Work List")
                            .foregroundColor(.white)
                            .font(.custom(FontsManeger.Roboto.thin, size: 20))
                        
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 21)
                            .padding(.trailing, 28)
                            .onTapGesture {
                                self.filterButton.toggle()
                            }
                        
                        
                    }
                    .padding(.top, 25)
                    HStack {
                        Text("Today")
                            .padding(.trailing, 149)
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 1 : 0.5))
                            .font(.custom(FontsManeger.Roboto.medium, size: 18))
                            .onTapGesture {
                                if !self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }
                        Text("Month")
                            .font(.custom(FontsManeger.Roboto.medium, size: 18))
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 0.5 : 1))
                            .onTapGesture {
                                if self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }
                    }
                    .padding(.top, 18)
                    Rectangle()
                        .frame(width: 96, height: 3)
                        .foregroundColor(.white)
                        .padding( currentButton ? .trailing : .leading, currentButton ? 210 : 205)
                    
                }
                .background(Color(red: 249/255, green: 96/255, blue: 96/255))
                .frame(height: 151)
                .offset(y: -40)
                Text("Hello")
                Spacer()
            }
            .navigationBarHidden(true)
            
            if filterButton {
                GeometryReader { _ in
                    AlertFilterView()
                        .cornerRadius(5)
                        .padding(.leading,145)
                        .padding(.top, 30)
                }
                .background(
                    Color.black.opacity(0.65)
                        .onTapGesture {
                            withAnimation {
                                self.filterButton.toggle()
                            }
                        }
                )
                
            }
        }
        
    }
    
    struct TaskView_Previews: PreviewProvider {
        static var previews: some View {
            TaskView()
        }
    }
}
