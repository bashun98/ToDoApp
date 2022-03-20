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
    func addNewTask(completion: @escaping (String) -> ()) {
//        let alertVC = UIAlertController(title: "Add New Task", message: nil, preferredStyle: .alert)
//        alertVC.addTextField { textField in
//        }
//
//        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
//            guard let text = alertVC.textFields?.first?.text else { return }
//            completion(text)
//        }))
        
        let vc = AddTaskViewController()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        viewController?.present(vc, animated: true, completion: nil)
        //viewController?.present(alertVC, animated: false, completion: nil)
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
