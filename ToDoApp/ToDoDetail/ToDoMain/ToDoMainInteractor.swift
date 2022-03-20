//
//  ToDoMainInteractor.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

final class ToDoMainInteractor {
	weak var output: ToDoMainInteractorOutput?
    private let dataBase: TasksDataBaseDescription
    
    init(dataBase: TasksDataBaseDescription = TasksDataBase.shared) {
        self.dataBase = dataBase
    }
}

extension ToDoMainInteractor: ToDoMainInteractorInput {
    func saveTask(with text: String) {
        dataBase.saveTasks(with: text)
    }
    
    func loadTasks() {
        dataBase.loadTasks { model in
            output?.getModel(model)
        }
    }
}
