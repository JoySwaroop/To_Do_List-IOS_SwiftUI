//
//  AssignTaskView.swift
//  ToDoList
//
//  Created by Joy Swaroop on 21/07/25.
//

import SwiftUI

struct AssignTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var tasktitle = ""
    @State var selectedPriorityType : PriorityType = .low
    @State var titleAlert = ""
    @State var messageAlert = ""
    @State var showAlert = false
    @Binding var tasks:[Task]
    var body: some View {
        VStack(alignment:.leading) {
            Text("Task Title")
            TextField("Task title", text: $tasktitle)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Text("Priority")
            Picker("Priority", selection: $selectedPriorityType) {
                ForEach(PriorityType.allCases) { selectedPriority in
                    Text(selectedPriority.title)
                }
            }
            Button {
                guard tasktitle.count >= 2 else{
                    showAlert = true
                    titleAlert = "Invalid Title"
                    messageAlert = "Title is less than two Characters"
                    return
                }
                    
                let newTask = Task(title: tasktitle, priority: selectedPriorityType)
                
                tasks.append(newTask)
                    
                    
                    
                    
                    
                    
                dismiss()
            } label: {
                Text("Add task")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top)
            Spacer()

        }
        .padding()
        .alert(titleAlert, isPresented: $showAlert) {
            Button {
                
            } label: {
                Text("OK")
            }

        } message: {
            Text(messageAlert)
        }

        
    }
}

#Preview {
    AssignTaskView(tasks:.constant([]))
}
