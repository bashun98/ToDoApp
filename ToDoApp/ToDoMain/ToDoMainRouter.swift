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
}

extension ToDoMainRouter: ToDoMainRouterInput {
    func addNewTask(completion: @escaping (String) -> ()) {
        let alertVC = UIAlertController(title: "Add New Task", message: nil, preferredStyle: .alert)
        alertVC.addTextField { textField in
        }
        
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            guard let text = alertVC.textFields?.first?.text else { return }
            completion(text)
        }))

        viewController?.present(alertVC, animated: false, completion: nil)
    }
    
}
