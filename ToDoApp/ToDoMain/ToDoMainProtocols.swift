//
//  ToDoMainProtocols.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

protocol ToDoMainModuleInput {
    var moduleOutput: ToDoMainModuleOutput? { get }
}

protocol ToDoMainModuleOutput: AnyObject {
}

protocol ToDoMainViewInput: AnyObject {
    func updateTableView()
}

protocol ToDoMainViewOutput: AnyObject {
    var tasksCount: Int { get }
    func tasks(at index: Int) -> TaskModel
    func addButtonTapped()
    func didSelectItem(at index: Int)
    func loadTasks()
}

protocol ToDoMainInteractorInput: AnyObject {
    func saveTask(with text: String)
    func loadTasks()
}

protocol ToDoMainInteractorOutput: AnyObject {
    func getModel(_ model: [TaskModel])
}

protocol ToDoMainRouterInput: AnyObject {
    func addNewTask()
    func openDetailView()
}

protocol TasksDataBaseDescription {
    func loadTasks(completion: ([TaskModel])->())
    func saveTasks(with text: String)
}

protocol ToDoMainPresenterInput: AnyObject {
    func getTask(with title: String)
}
