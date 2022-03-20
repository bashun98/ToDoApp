//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Евгений Башун on 19.03.2022.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func getTitleOfTask(_ text: String)
}

class AddTaskViewController: UIViewController {
    
    private let taskTextField = UITextField()
    
    private let highButton: UIButton = {
        let button = UIButton()
        button.setTitle("High", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.7294117647, green: 0.3098039216, blue: 0.3450980392, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let normalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Normal", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.4470588235, green: 0.5921568627, blue: 0.4980392157, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let lowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Low", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.568627451, blue: 0.8196078431, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    weak var delegate: AddTaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Task"
        view.addSubview(taskTextField)
        view.addSubview(stackView)
        stackView.addArrangedSubview(highButton)
        stackView.addArrangedSubview(normalButton)
        stackView.addArrangedSubview(lowButton)
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9176470588, blue: 0.8745098039, alpha: 1)
        taskTextField.delegate = self
        taskTextField.placeholder = "Title of the task"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            taskTextField.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 30),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            
            stackView.topAnchor.constraint(equalTo: taskTextField.topAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            highButton.heightAnchor.constraint(equalToConstant: 50),
            normalButton.heightAnchor.constraint(equalToConstant: 50),
            lowButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        delegate?.getTitleOfTask(textField.text!)
        self.dismiss(animated: true, completion: nil)
        return true
    }
}
