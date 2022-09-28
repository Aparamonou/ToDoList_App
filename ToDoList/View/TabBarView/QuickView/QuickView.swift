//
//  QuickView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 19.09.22.
//

import SwiftUI

struct QuickView: View {
    var body: some View {
        VStack{
            VStack{
                Text("Quick Notes")
                    .font(.custom(FontsManeger.Roboto.thin, size: 20))
            }
            VStack{
            }
           
         Spacer()
        }
        .background(Color(red: 253/255, green: 253/255, blue: 253/255))
        .navigationBarHidden(true)
    }
        
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView()
    }
}
