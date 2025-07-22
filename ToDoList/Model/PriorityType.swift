//  PriorityType.swift
//  ToDoList
//
//  Created by Joy Swaroop
//

import Foundation
import SwiftUI

enum PriorityType: CaseIterable,Identifiable {
    case low, medium , high
    var id : Self {self}
    
    
    var title :String{
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    var colour : Color {
        switch self {
        case .low:
            return Color.green
        case .medium:
            return Color.blue
        case .high:
            return Color.red
            
        }
    }
}
