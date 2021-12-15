//
//  Group.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import Foundation
import RealmSwift

class Group: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = "Work"
    @objc dynamic var color: String = "cyan blue"
    let tasks = List<Task>()

}
