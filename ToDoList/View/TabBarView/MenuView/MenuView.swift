//
//  MenuView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 19.09.22.
//

import SwiftUI

@MainActor class Show: ObservableObject {
    @Published var show = false
    @Published var projects: [ProjectModel] = []
}

struct MenuView: View {
    @StateObject var showAlert = Show()
    
    var body: some View {
        ZStack {
            VStack {
                VStack{
                    Text("Project")
                        .font(.custom(FontsManeger.Roboto.thin, size: 20))
                }
                if !showAlert.projects.isEmpty {
                    List() {
                        ForEach(showAlert.projects) { value in
                            Text(value.nameProject)
                        }
                    }
                    .background(Color.white)
                }
              
            
            HStack {
                Button(action: {
                    showAlert.show.toggle()
                }) {
                    Text("+")
                        .font(.custom(FontsManeger.Roboto.thin, size: 24))
                        .foregroundColor(.white)
                }
                .frame(width: 80, height: 80)
                .background(Color(red: 96/255, green: 116/255, blue: 249/255))
                .border(Color(.clear), width: 2)
                .cornerRadius(5)
                
                Spacer()
            }
            .padding(.leading, 20)
            Spacer()
        }
        .background(Color(red: 253/255, green: 253/255, blue: 253/255))
        .navigationBarHidden(true)
        
        if showAlert.show {
            GeometryReader {_ in
                AddProjectAlert()
                    .environmentObject(showAlert)
                    .cornerRadius(5)
                    .padding(.leading, 50)
                    .padding(.top, 150)
            }
            .background(
                Color.black.opacity(0.65)
                    .onTapGesture {
                        withAnimation {
                            showAlert.show.toggle()
                        }
                    }
            )
            
        }
    }
    
}
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
