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

    var body: some View {
        
        List {
            
            ForEach(tasks) { task in
//                Text("\(task.name ?? "None") \(task.date ?? Date(), formatter: taskDateFormatter)")
                TaskRowView(task: task)
            }
            //.onDelete(perform: deleteItems)
        }
        
        .padding([.top, .leading, .trailing])
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
