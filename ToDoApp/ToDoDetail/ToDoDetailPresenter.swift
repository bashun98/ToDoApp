//
//  ToDoDetailPresenter.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

final class ToDoDetailPresenter {
	weak var view: ToDoDetailViewInput?
    weak var moduleOutput: ToDoDetailModuleOutput?

	private let router: ToDoDetailRouterInput
	private let interactor: ToDoDetailInteractorInput

    init(router: ToDoDetailRouterInput, interactor: ToDoDetailInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ToDoDetailPresenter: ToDoDetailModuleInput {
}

extension ToDoDetailPresenter: ToDoDetailViewOutput {
}

extension ToDoDetailPresenter: ToDoDetailInteractorOutput {
}
