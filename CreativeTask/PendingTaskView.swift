//
//  PendingTaskView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct PendingTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: true)],
        predicate: NSPredicate(format: "completed != true"),
        animation: .default)
    private var tasks: FetchedResults<Task>
    @State private var selection: Set<Task> = []

    var body: some View {
        
        List {
            
            Section(header: Text("Pending Tasks")) {
                ForEach(tasks) { task in
                    // Leaving this here since the expand method isn't taking button taps
                    //                Text("\(task.name ?? "None") \(task.date ?? Date(), formatter: taskDateFormatter)")
                    //TaskRowView(task: task)
                    TaskRowView(task: task, isExpanded: self.selection.contains(task))
                        .onTapGesture { self.selectDeselect(task) }
                        .animation(.linear(duration: 0.3))
                }
                .onDelete(perform: deleteItems)
            }
        }
        
        .padding([.top, .leading, .trailing])
    }
    
    private func selectDeselect(_ task: Task) {
        if selection.contains(task) {
            selection.remove(task)
        } else {
            selection.insert(task)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            
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

private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, HH:MM a"
    return formatter
}()

struct PendingTaskView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTaskView()
    }
}
