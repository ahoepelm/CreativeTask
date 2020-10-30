//
//  TaskRowView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    
    var body: some View {
        
        HStack {
            Button(action: {
                print("Button action")
            }) {
                HStack {
                    Image(systemName: "square")
                    Text("\(task.name ?? "None") \(task.date ?? Date(), formatter: taskDateFormatter)")
                }
            }
//                  Text("\(task.name ?? "None") \(task.date ?? Date(), formatter: taskDateFormatter)")
            Spacer()
        }
    }
}

private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd, HH:MM a"
    return formatter
}()

//struct TaskRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskRowView(task: task)
//    }
//}
