//
//  Task.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import Foundation
import RealmSwift

class Task: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    
    var parentGroup = LinkingObjects(fromType: Group.self, property: "tasks")
}
