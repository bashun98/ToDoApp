//
//  ToDoMainContainer.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import UIKit

final class ToDoMainContainer {
    let input: ToDoMainModuleInput
	let viewController: UIViewController
	private(set) weak var router: ToDoMainRouterInput!

	class func assemble(with context: ToDoMainContext) -> ToDoMainContainer {
        let router = ToDoMainRouter()
        let interactor = ToDoMainInteractor()
        let presenter = ToDoMainPresenter(router: router, interactor: interactor)
		let viewController = ToDoMainViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput
        
        router.viewController = viewController

		interactor.output = presenter

        return ToDoMainContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UITableViewController, input: ToDoMainModuleInput, router: ToDoMainRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ToDoMainContext {
	weak var moduleOutput: ToDoMainModuleOutput?
}
