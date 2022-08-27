//
//  ListModelView.swift
//  To-Do
//
//  Created by mohamed abdelrazek on 26/08/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    let itemKey: String = "items_list"
    
    init() {
        getTasks()
    }
    
    func getTasks(){
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedTasks
    }
    
    func deleteTask(indexSet: IndexSet){
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTasks(indexSet: IndexSet,to: Int){
        tasks.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func addTask(title: String){
        let newTask = TaskModel(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    func updateTask(task: TaskModel){
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index] = task.updateCompletion()
        }
    }
    
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
    
}
