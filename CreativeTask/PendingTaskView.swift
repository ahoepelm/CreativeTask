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
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.name, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    @State private var selection: Set<Task> = []

    var body: some View {
        
        List {
            
            ForEach(tasks) { task in
//                Text("\(task.name ?? "None") \(task.date ?? Date(), formatter: taskDateFormatter)")
                //TaskRowView(task: task)
                TaskRowView(task: task, isExpanded: self.selection.contains(task))
                    .onTapGesture { self.selectDeselect(task) }
                    .animation(.linear(duration: 0.3))
            }
            //.onDelete(perform: deleteItems)
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
