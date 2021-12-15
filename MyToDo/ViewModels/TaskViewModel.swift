//
//  TaskViewModel.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 9/12/21.
//


import Foundation
import SwiftUI
import RealmSwift

class TaskViewModel: ObservableObject {
    
    private var realm = try! Realm()
    var themeColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    var endEditing: Bool = false
    @Published var tasks:  Results<Task>?
    @Published var taskTitle: String = ""
    
    var group: Group
    
    
    init(for group: Group) {
        self.group = group
        self.themeColor = UIColor.init(Color(group.color))
        loadTasks()
        
    }
    
    func add() {
        print(taskTitle)
        if taskTitle == "" { return }
        
        do {
            let newTask = Task()
            newTask.title = taskTitle
            try realm.write({
                group.tasks.append(newTask)
            })
            
        } catch {
            print("Error adding task \(error)")
        }
        taskTitle = ""
    }
    
    func loadTasks() {
        self.tasks = group.tasks.sorted(byKeyPath: "done", ascending: true)
    }
    
    func update(task: Task) {
        do {
            try realm.write {
                task.done = !task.done
            }
            loadTasks()
            
        } catch {
            print("Error updating task \(error)")
        }
    }
    
    func delete(with indexSet: IndexSet) {
        
        guard let safeTasks = tasks else { return }
        indexSet.forEach ({ index in
            do {
                try realm.write({
                    let taskToDelete = safeTasks[index]
                    realm.delete(taskToDelete)
                })
            } catch {
                print("Error deleting task \(error)")
            }
            
        })
        // tasks refresh after deletion because Results<Task>? is auto updating
    }
    
}
