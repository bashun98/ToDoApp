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

        button.isHighlighted = true
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
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let acceptButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = #colorLiteral(red: 0.7294117647, green: 0.3098039216, blue: 0.3450980392, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    weak var delegate: AddTaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Task"
        view.addSubview(textFieldStackView)
        view.addSubview(buttonStackView)
        textFieldStackView.addArrangedSubview(taskTextField)
        textFieldStackView.addArrangedSubview(acceptButton)
        buttonStackView.addArrangedSubview(highButton)
        buttonStackView.addArrangedSubview(normalButton)
        buttonStackView.addArrangedSubview(lowButton)
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9176470588, blue: 0.8745098039, alpha: 1)
        taskTextField.delegate = self
        taskTextField.placeholder = "Title of the task"
        highButton.addTarget(self, action: #selector(highPressed), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(normalPressed), for: .touchUpInside)
        lowButton.addTarget(self, action: #selector(lowPressed), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(okPressed), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
   
            
            textFieldStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            textFieldStackView.leadingAnchor.constraint(equalTo:  view.leadingAnchor, constant: 30),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 50),
            
            acceptButton.widthAnchor.constraint(equalTo: textFieldStackView.heightAnchor),
            acceptButton.heightAnchor.constraint(equalTo: acceptButton.widthAnchor),
            
            
            buttonStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            highButton.heightAnchor.constraint(equalToConstant: 50),
            normalButton.heightAnchor.constraint(equalToConstant: 50),
            lowButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc
    private func highPressed() {
  
    }
    
    @objc
    private func normalPressed() {
  
    }
    
    @objc
    private func lowPressed() {
       
    }
    
    @objc
    private func okPressed() {
        delegate?.getTitleOfTask(taskTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
