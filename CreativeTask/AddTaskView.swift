//
//  AddTaskView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct AddTaskView: View {

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "eeee MMM d yyyy"
        return formatter
    }
    
    @State private var name = ""
    @State private var date = Date()
    @State private var completed = false
    @State private var priority = taskPriority.none
        
    var body: some View {

        VStack {
            
            HStack {
                
            TextField("Task Name", text: self.$name)
                .padding(.horizontal)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            
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
                    self.completed = true
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.square")
                        Text("Completed")
                    }
                }
                
                
            }
                        
            DatePicker(selection: $date, in: Date()..., displayedComponents:  [.date]) {
                            Text("Due date")
            }
            .padding(.all)

            
            HStack {
                Button(action: {

                    let addTaskViewModel = AddTaskViewModel(taskName: name, taskDate: date, taskCompleted: completed, taskPriority: priority)
                    addTaskViewModel.addTask()

                }) {
                    Text("Save")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                }
                .disabled(self.name.isEmpty)
                
                .padding()
                
            }
            .padding(.top)

        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
