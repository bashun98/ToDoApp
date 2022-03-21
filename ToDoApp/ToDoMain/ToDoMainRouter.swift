//
//  ToDoMainRouter.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import UIKit

final class ToDoMainRouter {
    weak var viewController: UITableViewController?
    weak var presenter: ToDoMainPresenterInput?
    
}

extension ToDoMainRouter: ToDoMainRouterInput {
    func addNewTask() {

        let vc = AddTaskViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        viewController?.present(vc, animated: true, completion: nil)

    }
    
    func openDetailView() {
        let container = ToDoDetailContainer.assemble(with: .init())
        let detailVC = container.viewController
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension ToDoMainRouter: AddTaskViewControllerDelegate {
    func getTitleOfTask(_ text: String) {
        presenter?.getTask(with: text)
    }
}
