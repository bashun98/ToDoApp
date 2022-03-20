//
//  ToDoMainPresenter.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation
import CoreData

final class ToDoMainPresenter {
	weak var view: ToDoMainViewInput?
    weak var moduleOutput: ToDoMainModuleOutput?

	private let router: ToDoMainRouterInput
	private let interactor: ToDoMainInteractorInput
  
    private var tasks: [TaskModel] = []

    init(router: ToDoMainRouterInput, interactor: ToDoMainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ToDoMainPresenter: ToDoMainModuleInput {
}

extension ToDoMainPresenter: ToDoMainViewOutput {
    
    var tasksCount: Int {
        tasks.count
    }
    
    func tasks(at index: Int) -> TaskModel {
        tasks[index]
    }

    func addButtonTapped() {
        router.addNewTask { [weak self] text in
            self?.interactor.saveTask(with: text)
            self?.interactor.loadTasks()
        }
    }
    
    func didSelectItem(at index: Int) {
        router.openDetailView()
    }
    
    func loadTasks() {
        interactor.loadTasks()
    }
}

extension ToDoMainPresenter: ToDoMainInteractorOutput {
    func getModel(_ model: [TaskModel]) {
        tasks = model
        view?.updateTableView()
    }
}

extension ToDoMainPresenter: ToDoMainPresenterInput {
    func getTask(with title: String) {
        interactor.saveTask(with: title)
        interactor.loadTasks()
    }
    
}
