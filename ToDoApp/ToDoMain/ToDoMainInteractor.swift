//
//  ToDoMainInteractor.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import Foundation

final class ToDoMainInteractor {
	weak var output: ToDoMainInteractorOutput?
}

extension ToDoMainInteractor: ToDoMainInteractorInput {
}
