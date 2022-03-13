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
    
    private var array: [TaskModel] = []

    
//    private var array: [TaskModel] = [TaskModel(task: "15446546545645644465456"),
//                                      TaskModel(task: "15446546545645644465456"),
//                                      TaskModel(task: "15446546545645644465456"),
//                                      TaskModel(task: "15446546545645644465456"),
//                                      TaskModel(task: "15446546545645644465456"),
//                                      TaskModel(task: "15446546545645644465456")]

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
        output.loadTasks()
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
    
    //MARK: - DataSource and Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.tasksCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {return UITableViewCell()}
        cell.configure(with: output.tasks(at: indexPath.row))
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
       // cell.accessoryType = array[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectItem(at: indexPath.row)
        //array[indexPath.row].done = !array[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadData()
    }
    
    
}

//MARK: - Extension

extension ToDoMainViewController: ToDoMainViewInput {
    func updateTableView() {
        tableView.reloadData()
    }
}
