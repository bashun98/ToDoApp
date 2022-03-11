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
    func updateTableView(with text: String)
}

protocol ToDoMainViewOutput: AnyObject {
    func addButtonTapped()
    func didSelectItem(at index: Int)
}

protocol ToDoMainInteractorInput: AnyObject {
}

protocol ToDoMainInteractorOutput: AnyObject {
}

protocol ToDoMainRouterInput: AnyObject {
    func addNewTask(completion: @escaping (String)->())
    func openDetailView()
}
