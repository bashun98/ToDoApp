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
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 1
       // label.backgroundColor = .red
        return label
    }()
    
    private let indicatorImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let priorityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
       // label.sizeToFit()
        label.textColor = .gray

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let boarder: UIView = {
        let boarder = UIView()
       // boarder.backgroundColor = .red
        boarder.translatesAutoresizingMaskIntoConstraints = false
        return boarder
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
       // stackView.backgroundColor = .blue
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .blue
        contentView.addSubview(stackView)
        boarder.addSubview(priorityLabel)
        stackView.addArrangedSubview(indicatorImageView)
        stackView.addArrangedSubview(taskLabel)
        stackView.addArrangedSubview(boarder)
        
        
        boarder.layer.borderWidth = 3.0
        boarder.layer.borderColor = UIColor.gray.cgColor
        boarder.layer.cornerRadius = 15
        //        contentView.layer.rasterizationScale = UIScreen.main.scale
        //        contentView.layer.shouldRasterize = true
        //
        //        contentView.layer.cornerRadius = 8
        //        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        //        contentView.layer.shadowRadius = 8
        //        contentView.layer.shadowColor = UIColor.gray.cgColor
        //        contentView.layer.shadowOpacity = 0.8

        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            indicatorImageView.widthAnchor.constraint(equalToConstant: 12),
            indicatorImageView.heightAnchor.constraint(equalToConstant: 12),
            
            

            boarder.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: -10),
            boarder.widthAnchor.constraint(equalToConstant: 80),
            
            priorityLabel.centerXAnchor.constraint(equalTo: boarder.centerXAnchor),
            priorityLabel.centerYAnchor.constraint(equalTo: boarder.centerYAnchor)
        ])
        
    }
    
    public func configure(with model: TaskModel) {
        taskLabel.text = model.titleLabel
        priorityLabel.text = "High"
      //  priority.titleLabel?.text = "High"
        indicatorImageView.image = UIImage(named: "green")
    }
    
}
