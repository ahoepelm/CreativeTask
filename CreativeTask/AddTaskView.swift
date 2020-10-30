//
//  AddTaskView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "eeee MMM d yyyy hh:mm a"
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
            
            
            DatePicker(selection: $date, in: Date()..., displayedComponents:  [.date, .hourAndMinute]) {
                            Text("Due date")
            }
            .padding(.all)

            
            HStack {
                Button(action: {
                    
                    //print("Values are: \(name) \(dateFormatter.string(from: date)) \(priority)")
                    self.addTask()

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

    
    // MARK: - Custom Mehtods
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.name = name
            newTask.id = UUID()
            newTask.date = date
            newTask.completed = completed
            
            switch priority {
            
            case .low:
                newTask.priority = "low"
            case .medium:
                newTask.priority = "medium"
            case .high:
                newTask.priority = "high"
            default:
                newTask.priority = "none"
            }
            
            
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                //fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }



}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
