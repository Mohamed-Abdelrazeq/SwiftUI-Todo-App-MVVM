//
//  ListView.swift
//  To-Do
//
//  Created by mohamed abdelrazek on 26/08/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.tasks.isEmpty {
                Text("No Tasks For Today")
            } else {
                List {
                    ForEach(listViewModel.tasks) { task in
                        ListRowView(task: task)
                            .onTapGesture {
                                withAnimation(.linear) {
                                 }
                            }
                    }
                    .onMove(perform: listViewModel.moveTasks)
                    .onDelete(perform: listViewModel.deleteTask)
                }
                .listStyle(.plain)
                .padding(.top,32)
            }
        }
        .navigationTitle("Todo List XD")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddTaskView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


