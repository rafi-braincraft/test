//
//  CustomButtonViewController.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 21/10/24.
//

import UIKit

class StackViewVC: UIViewController {
    var titleLabel = UILabel()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Stack View"
        
        configureTitleLabel()
        configureStackView()
        // Do any additional setup after loading the view.
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical //if the orientation is vertiacal or horizontal
        stackView.distribution = .fillEqually //all the item on stackview will take the equal place
        stackView.spacing = 2 //space between each button
        
        addButtonsToStackView()
        setStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        let numOfButtons = 10
        for i in 1...numOfButtons {
            let button = CustomButton()
            button.setTitle("\(i)", for: .normal) //for title style
            stackView.addArrangedSubview(button) //adding button to the end of the stackview
        }
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "How is going?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        //titleLabel.backgroundColor = .black
        
        setTitleLabelConstraints()
    }
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }

}
