//
//  AddTaskViewModel.swift
//  CreativeTask
//
//  Created by Anthony H on 2/17/21.
//

import Foundation
import SwiftUI
import CoreData

class AddTaskViewModel: ObservableObject {
    
    @Published private var tasks: [AddTaskViewModel] = []

    var name: String
    var date: Date
    var completed: Bool
    var priority: taskPriority

    init(taskName: String, taskDate: Date, taskCompleted: Bool, taskPriority: taskPriority) {

        name = taskName
        date = taskDate
        completed = taskCompleted
        priority = taskPriority

    }
    
    // MARK: - Custom Methods
    
    func addTask() {
        withAnimation {

            let newTask = Task(context: PersistenceController.shared.container.viewContext)
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

                try PersistenceController.shared.container.viewContext.save()

            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                //fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                print("Unresolved error \(nsError.localizedDescription), \(String(describing: nsError.localizedFailureReason))")
            }
        }
    }
    
}
