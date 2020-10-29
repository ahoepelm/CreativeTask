//
//  ContentView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection = 0
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        //        List {
        //            ForEach(items) { item in
        //                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
        //            }
        //            .onDelete(perform: deleteItems)
        //        }
        //        .toolbar {
        //            #if os(iOS)
        //            EditButton()
        //            #endif
        //
        //            Button(action: addItem) {
        //                Label("Add Item", systemImage: "plus")
        //            }
        //        }
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
                
                Text("8")
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
            //.padding(.bottom)
           
            HStack(alignment: .top) {
                
                Button("Pending") {
                    withAnimation {
                        selection = 0
                    }
                }
            
                
                Button("Completed") {
                    withAnimation {
                        selection = 1
                    }
                    
                }
                Spacer()
            }
            .padding([.top, .leading])
            
            TabView(selection: $selection) {
            
                if selection == 0 {
                PendingTaskView()
                } else {
                    CompletedTaskView()
                }
            
            }
            .padding(.top)
                    
//            ZStack(alignment: .bottom) {
//
//                Button("next") {
//                    withAnimation {
//                        selection = 1
//                    }
//                }
//
//                       TabView(selection: $selection) {
//                           Text("Hello").tag(0)
//                           Text("World").tag(1)
//                       }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//
//                   }
        } //vstack
        

        
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
