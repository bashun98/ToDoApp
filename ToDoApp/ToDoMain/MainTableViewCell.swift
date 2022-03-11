//
//  MainTableViewCell.swift
//  ToDoApp
//
//  Created by Евгений Башун on 11.03.2022.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier = "MainTableViewCell"
    
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        setupContainerView()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupContainerView() {
        containerView.addSubview(taskLabel)
        containerView.backgroundColor = .red
        containerView.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            taskLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            taskLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            taskLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            taskLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])

    }
    
    public func configure(with task: String) {
        taskLabel.text = task
    }
    
}
