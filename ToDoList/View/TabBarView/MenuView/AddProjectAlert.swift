//
//  AddProjectAlert.swift
//  ToDoList
//
//  Created by Alex Paramonov on 26.09.22.
//

import SwiftUI

enum TapColors  {
    case blue
    case red
    case green
    case black
    case white
}

struct AddProjectAlert: View {
    
    //MARK: Property
    @State private var nameProject = ""
    @State private var changeColor: TapColors = .blue
    @EnvironmentObject var alert: Show
    
    //MARK: Body
    var body: some View {
        VStack {
            Text("Title")
                .font(.custom(FontsManeger.Roboto.thin ,size: 18))
                .padding(.leading,29)
                .padding(.trailing, 260)
                .padding(.top,  24)
            TextField("Enter name project", text: $nameProject) {
                
            }
            .padding(.top,  24)
            .padding(.leading,  30)
            .font(.custom(FontsManeger.Roboto.thin ,size: 18))
            .foregroundColor(Color.black.opacity(1))
            .onChange(of: nameProject) { value in
                if value.count > 32 {
                    self.nameProject =  String(value.prefix(32))
                }
            }
            Text("Choose Color")
                .font(.custom(FontsManeger.Roboto.thin ,size: 18))
                .padding(.trailing, 175)
                .padding(.top,  44)
            HStack(spacing: 12) {
                
                ZStack{
                    CreateColorBox( color: Color(red: 0.376, green: 0.455, blue: 0.976))
                        .onTapGesture {
                            self.changeColor = .blue
                        }
                    if changeColor == .blue {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 18, height: 12.6)
                    }
                    
                }
                
                ZStack{
                    CreateColorBox( color: Color(red: 0.894, green: 0.169, blue: 0.416))
                        .onTapGesture {
                            self.changeColor = .red
                        }
                    if changeColor == .red {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 18, height: 12.6)
                    }
                }
                
                ZStack{
                    CreateColorBox(color: Color(red: 0.353, green: 0.733, blue: 0.337))
                        .onTapGesture {
                            self.changeColor = .green
                        }
                    if changeColor == .green {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 18, height: 12.6)
                    }
                    
                }
                
                ZStack {
                    CreateColorBox( color: Color(red: 0.238, green: 0.229, blue: 0.383))
                        .onTapGesture {
                            self.changeColor = .black
                        }
                    if changeColor == .black{
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 18, height: 12.6)
                    }
                }
                
                ZStack{
                    CreateColorBox( color: Color(red: 0.956, green: 0.791, blue: 0.559))
                        .onTapGesture {
                            self.changeColor = .white
                        }
                    if changeColor == .white {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 18, height: 12.6)
                    }
                }
            }
            Button(action: {
                print("\(nameProject)")
               let project =  ProjectModel(color: changeColor, nameProject: nameProject)
                alert.projects.append(project)
                alert.show.toggle()
            }) {
                Text("Done")
                    .font(.custom(FontsManeger.Roboto.thin ,size: 18))
                    .foregroundColor(Color.white)
            }
            .frame(width: 295, height: 48)
            .background(Color(red: 0.976, green: 0.376, blue: 0.376))
            .padding(.top, 25)
            .padding(.trailing, 24)
            .padding(.leading, 24)
            .cornerRadius(5)
            
            
            Spacer()
        }
        .frame(width: 327, height: 350)
        .background(Color.white)
    }
}

struct AddProjectAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectAlert()
    }
}

struct CreateColorBox: View {
    var color: Color
    var body: some View {
        Rectangle()
            .frame(width: 48, height: 48)
            .cornerRadius(5)
            .foregroundColor(color)
    }
}
