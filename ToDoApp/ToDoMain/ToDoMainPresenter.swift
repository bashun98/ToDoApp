//
//  ToDoMainPresenter.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

final class ToDoMainPresenter {
	weak var view: ToDoMainViewInput?
    weak var moduleOutput: ToDoMainModuleOutput?

	private let router: ToDoMainRouterInput
	private let interactor: ToDoMainInteractorInput

    init(router: ToDoMainRouterInput, interactor: ToDoMainInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ToDoMainPresenter: ToDoMainModuleInput {
}

extension ToDoMainPresenter: ToDoMainViewOutput {
    
    func addButtonTapped() {
        router.addNewTask { text in
            self.view?.updateTableView(with: text)
        }
    }
    
    func didSelectItem(at index: Int) {
        router.openDetailView()
    }
}

extension ToDoMainPresenter: ToDoMainInteractorOutput {
}
