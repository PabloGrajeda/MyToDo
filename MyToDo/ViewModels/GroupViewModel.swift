//
//  GroupManager.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import Foundation
import RealmSwift

class GroupViewModel: ObservableObject {
    
    private var realm = try! Realm()
    
    @Published var groups: Results<Group>?
    @Published var groupName = ""
    @Published var selectedColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    @Published var showColorPicker = false
    
    init() {
        self.groups = realm.objects(Group.self)
    }
    
    func add() {
        if groupName == "" { return }
        
        let newGroup = Group()
        newGroup.name = groupName
        newGroup.color = selectedColor.accessibilityName
        do {
            try realm.write({
                realm.add(newGroup)
            })
        } catch {
            print("Failed adding group \(error)")
        }
        
        
        
        groups = realm.objects(Group.self)
        groupName = ""
    }
    
    func delete(with indexSet: IndexSet) {
        
        guard let safeGroups = groups else { return }
        indexSet.forEach ({ index in
            do {
                try realm.write({
                    let groupToDelete = safeGroups[index]
                    realm.delete(groupToDelete)
                })
            } catch {
                print("Error deleting group \(error)")
            }
            
        })
        // tasks refresh after deletion because Results<Task>? is auto updating
    }
    
}
