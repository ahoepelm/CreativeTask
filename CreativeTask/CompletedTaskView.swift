//
//  CompletedTaskView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct CompletedTaskView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        List {
            
            Text("Two")
            Text("Two")
            Text("Two")
            Text("Two")
            Text("Two")
            Text("Two")
            Text("Two")
            
        }
        .padding([.top, .leading, .trailing])
        
    }
}

struct CompletedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTaskView()
    }
}
