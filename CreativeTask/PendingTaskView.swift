//
//  PendingTaskView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct PendingTaskView: View {
    
    var listItems = ["One", "Two", "Three", "Four", "Five"]
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        List {
            
            Text("One")
            Text("One")
            Text("One")
            Text("One")
            Text("One")
            Text("One")
            Text("One")
            
        }
        .padding([.top, .leading, .trailing])
    }
        
//        RoundedRectangle(cornerRadius: 25, style: .continuous)
//            .fill(Color.white)
//            .frame(width: 300, height: 500)
//            .shadow(color: .gray, radius: 3)
//            .padding(.leading)
//            .padding(.trailing)
//            .overlay(List {
//
//                Text("One")
//                Text("One")
//                Text("One")
//                Text("One")
//                Text("One")
//                Text("One")
//                Text("One")
//
//                })
//
//
//    }
}

struct PendingTaskView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTaskView()
    }
}
