//
//  ToDoMainViewController.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//  
//

import UIKit

final class ToDoMainViewController: UITableViewController {
	private let output: ToDoMainViewOutput
    
    private var array: [TaskModel] = [TaskModel(task: "15446546545645644465456"),
                                      TaskModel(task: "15446546545645644465456"),
                                      TaskModel(task: "15446546545645644465456"),
                                      TaskModel(task: "15446546545645644465456"),
                                      TaskModel(task: "15446546545645644465456"),
                                      TaskModel(task: "15446546545645644465456")]

    init(output: ToDoMainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setupNavBar()
        setupTableView()
        
	}
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.title = "ToDo"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = navigationItem.standardAppearance
    }
    
    private func setupTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    @objc
    private func didTapAddButton() {
        output.addButtonTapped()
    }
    
    
    //MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {return UITableViewCell()}
        cell.configure(with: array[indexPath.row].task)
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return cell
    }
}

extension ToDoMainViewController: ToDoMainViewInput {
    func updateTableView(with text: String) {
        array.append(TaskModel(task: text))
        tableView.reloadData()
    }
    
}
