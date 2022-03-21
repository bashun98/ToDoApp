//
//  TasksDataBase.swift
//  ToDoApp
//
//  Created by Евгений Башун on 13.03.2022.
//

import UIKit
import CoreData

struct TasksDataBase: TasksDataBaseDescription {
    
    static let shared: TasksDataBaseDescription = TasksDataBase()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {}
    
    func loadTasks(completion: ([TaskModel])->()) {
        let request: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()
        do {
            let data = try context.fetch(request)
            completion(data)
        } catch {
            print(error)
        }
    }
    
    func saveTasks(with text: String) {
        let newTask = TaskModel(context: context)
        newTask.titleLabel = text
        do {
            try context.save()
        } catch  {
            print(error)
        }
    }

}

