//  TaskModel.swift
//  ToDoList
//
//  Created by Joy Swaroop
//

import Foundation

struct Task:Identifiable{
    let id = UUID()
    let title : String
    let priority: PriorityType
    var isCompleted: Bool = false
    
}
