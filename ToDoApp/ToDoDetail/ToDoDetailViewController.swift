//
//  ToDoDetailViewController.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import UIKit

final class ToDoDetailViewController: UIViewController {
	private let output: ToDoDetailViewOutput

    init(output: ToDoDetailViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .red
	}
}

extension ToDoDetailViewController: ToDoDetailViewInput {
}
