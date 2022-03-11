//
//  ToDoDetailProtocols.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

protocol ToDoDetailModuleInput {
	var moduleOutput: ToDoDetailModuleOutput? { get }
}

protocol ToDoDetailModuleOutput: AnyObject {
}

protocol ToDoDetailViewInput: AnyObject {
}

protocol ToDoDetailViewOutput: AnyObject {
}

protocol ToDoDetailInteractorInput: AnyObject {
}

protocol ToDoDetailInteractorOutput: AnyObject {
}

protocol ToDoDetailRouterInput: AnyObject {
}
