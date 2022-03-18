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
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .red
        return button
    }()

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
        navigationController?.view.addSubview(addButton)
        setupNavBar()
        setupTableView()
        output.loadTasks()
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
	}
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addButton.layer.cornerRadius = UIScreen.main.bounds.width / 10
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -UIScreen.main.bounds.height / 15),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.height / 30),
            addButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 5),
            addButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 5),
        ])
        
    }
    
    private func setupNavBar() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        navigationItem.title = "ToDo"
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = navigationItem.standardAppearance
    }
    
    private func setupTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
//        tableView.separatorStyle = .automatic
//        
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
       // cell.accessoryType = array[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
//            array.remove(at: indexPath.row)
            //output.updateDB()
            tableView.deleteRows(at: [indexPath], with: .left)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectItem(at: indexPath.row)
        output.didSelectItem(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

//MARK: - Extension

extension ToDoMainViewController: ToDoMainViewInput {
    func updateTableView() {
        tableView.reloadData()
    }
}
