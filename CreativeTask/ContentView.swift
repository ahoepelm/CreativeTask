//
//  ContentView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAddTask = false
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Task>
    
    var body: some View {

        VStack {
            ZStack {
                HStack {
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 3)
                        .padding(.trailing)
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 3)
                        .padding(.leading)
                    
                    
                }
                CurrDateView().offset(x: -100, y: -60).padding(.bottom, -90)
                
                Text("\(items.count)")
                    .font(.system(size:60))
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.blue)
                    .offset(x: +95, y: -60).padding(.bottom, -80)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray)
                    .frame(width: 65, height: 30)
                    .offset(x: +95, y: +20).padding(.bottom, -90)
                    .overlay(Text("Tasks")
                                .offset(x: +95, y: +34)
                    )
                
                
            }
            .padding(.top)

           
            HStack(alignment: .top) {                
                
                Button(action: {
                           self.showingAddTask.toggle()
                       }) {
                           Text("Add Task")
                       }.sheet(isPresented: $showingAddTask) {
                           AddTaskView()
                        Button("Cancel") {
                            // Toggle the preview display off again.
                            // Swiping down (the system gesture to dismiss a sheet)
                            // will cause SwiftUI to toggle our state property as well.
                            self.showingAddTask.toggle()
                        }
                        
                       }
                
                }
            
            .padding([.top, .leading])

            TabView {
                PendingTaskView()
                .tabItem {
                  Label("Pending", systemImage: "square")
                }
              
                CompletedTaskView()
                .tabItem {
                  Label("Completed", systemImage: "checkmark.square")
                }

            }
            .padding(.top)
                    
        } //vstack
        

        
    }
    

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
