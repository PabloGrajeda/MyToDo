//
//  TaskView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 9/12/21.
//

import SwiftUI
import RealmSwift

struct TaskView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    var group: Group
    
    init(for group: Group) {
        self.group = group
        self.taskViewModel = TaskViewModel(for: self.group)
        
    }
    
    var body: some View {
        
        ZStack {
            if let tasks = taskViewModel.tasks {
                
                List {
                    
                    ForEach(tasks) { task in
                        if !task.isInvalidated { /* If task has not been deleted yet */
                            HStack {
                                Image(systemName: task.done ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(Color(taskViewModel.themeColor))
                                Text(task.title)
                                
                            }
                            
                            .onTapGesture {
                                withAnimation(.linear) {
                                    taskViewModel.update(task: task)
                                }
                            }
                        }
                        
                    }
                    .onDelete(perform: taskViewModel.delete)
                }
                .padding(.bottom, 100)
                
            }
            
            AddTextFieldView(themeColor: $taskViewModel.themeColor, textfieldText: $taskViewModel.taskTitle, editingchanged: $taskViewModel.endEditing, placeHolder: "Add a task", addAction: taskViewModel.add)
                .frame(maxHeight: .infinity ,alignment: .bottom)
                .padding(.bottom)
        }
        .navigationTitle(taskViewModel.group.name)
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskView(for: Group())
        }
    }
}
