//
//  ListRowView.swift
//  To-Do
//
//  Created by mohamed abdelrazek on 26/08/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let task: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(task: TaskModel(title: "TASK NAME", isCompleted: false))
    }
}
