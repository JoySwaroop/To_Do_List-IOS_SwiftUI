//  ToDoList
//
//  Created by Joy Swaroop
//

import SwiftUI

struct HomeView: View {
    
    @State private var tasks: [Task] = []
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            NavigationStack{
                VStack{
                    List{
                        ForEach($tasks) { $task in
                            Button(action: {
                                task.isCompleted.toggle()
                                
                            }, label: {
                                HStack{
                                    Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                                        .foregroundStyle(.black)
                                    Text(task.title)
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Text(task.priority.title)
                                        .foregroundStyle(task.priority.colour)
                                        .font(.system(size: 15,weight:.bold))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 5)
                                        .background(Capsule()
                                            .fill(task.priority.colour)
                                            .opacity(0.5))
                                }
                            })
                            
                        }
                        .onDelete(perform: delete)
                        
                    }
                    
                }
                
                .navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        }
                        
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            AssignTaskView(tasks:$tasks)
        }
    }
    private func delete(at offsets:IndexSet){
        tasks.remove(atOffsets: offsets)
        
    }
}

#Preview {
    HomeView()
}
