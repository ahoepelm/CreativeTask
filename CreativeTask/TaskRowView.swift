//
//  TaskRowView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct TaskRowView: View {
    
    @State private var priority = taskPriority.none
    
    var task: Task
    let isExpanded: Bool
    
    var body: some View {
        
        HStack {
            
            content
            Spacer()
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text("\(task.name ?? "None")  - Due \(task.date ?? Date(), formatter: taskDateFormatter)")
            
            if isExpanded {
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Button(action: {
                            self.priority = taskPriority.low
                        }) {
                            Text("Low")
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .foregroundColor(.green)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.green, lineWidth: 5)
                                )
                        }
                        
                        Button(action: {
                            self.priority = taskPriority.medium
                        }) {
                            Text("Medium")
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .foregroundColor(.orange)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.orange, lineWidth: 5)
                                )
                        }
                        
                        Button(action: {
                            self.priority = taskPriority.high
                        }) {
                            Text("High")
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .foregroundColor(.red)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.red, lineWidth: 5)
                                )
                        }
                        
                        Button(action: {
                            print("button was tapped")
                        }) {
                            Image(systemName: "calendar")
                        }

                    } //HStack
                    
                }
                .padding(.top)
                
            }
        }
    }
    
}


private let taskDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd yyyy"
    return formatter
}()

//struct TaskRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskRowView(task: <#Task#>, isExpanded: <#Bool#>)
//    }
//}
