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
        label.font = .systemFont(ofSize: 32)
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
        selectionStyle = .blue
        contentView.addSubview(containerView)
        setupContainerView()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupContainerView() {
        containerView.addSubview(taskLabel)
        containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        containerView.layer.cornerRadius = 12
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            taskLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            taskLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            taskLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            taskLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])

    }
    
    public func configure(with task: String) {
        taskLabel.text = task
    }
    
}
