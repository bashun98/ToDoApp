//
//  ToDoDetailContainer.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import UIKit

final class ToDoDetailContainer {
    let input: ToDoDetailModuleInput
	let viewController: UIViewController
	private(set) weak var router: ToDoDetailRouterInput!

	class func assemble(with context: ToDoDetailContext) -> ToDoDetailContainer {
        let router = ToDoDetailRouter()
        let interactor = ToDoDetailInteractor()
        let presenter = ToDoDetailPresenter(router: router, interactor: interactor)
		let viewController = ToDoDetailViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return ToDoDetailContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ToDoDetailModuleInput, router: ToDoDetailRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ToDoDetailContext {
	weak var moduleOutput: ToDoDetailModuleOutput?
}
