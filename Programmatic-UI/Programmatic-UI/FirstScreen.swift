//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 20/10/24.
//

import UIKit

class FirstScreen: UIViewController {

    let videoTableButton = UIButton() // initializing button
    let stackButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemMint
        setUpButton()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true //making title size large
        
    }
    
    func setUpButton() {
        view.addSubview(videoTableButton) //dragging and dropping a button on the view
        videoTableButton.configuration = .filled() //type of the button
        videoTableButton.configuration?.baseBackgroundColor = .systemPink // color of the button
        videoTableButton.configuration?.title = "Table"
        
        videoTableButton.addTarget(self, action: #selector(goToSecondScreen), for: .touchUpInside) //.touchUpInside = normal tap //what will do when button pressed
        
        videoTableButton.translatesAutoresizingMaskIntoConstraints = false //don't use auto layout //we will set up manually
        
        NSLayoutConstraint.activate([
            videoTableButton.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 12),
            videoTableButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            videoTableButton.widthAnchor.constraint(equalToConstant: 200),
            videoTableButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        //nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true //we can activate a group of together, then we don't have to use isActive everytime
        
        view.addSubview(stackButton)
        stackButton.configuration = .filled()
        stackButton.configuration?.baseBackgroundColor = .systemPink
        stackButton.configuration?.title = "Stack"
        stackButton.addTarget(self, action: #selector(goToStackScreen), for: .touchUpInside)
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackButton.leadingAnchor.constraint(equalTo: videoTableButton.trailingAnchor, constant: 20)
            ,stackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ,stackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
            ,stackButton.widthAnchor.constraint(equalToConstant: 200)
            ,stackButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    
    //because it is a selector so @objc
    @objc func goToSecondScreen() {
        let secondScreen = VideoListVC()
        secondScreen.title = "Second Screen" //setting the title of second screen
        
        navigationController?.pushViewController(secondScreen, animated: true) //pushing a new view controller on top of the stack, after back button press, it will be back at first screen
        
    }
    @objc func goToStackScreen() {
        let stackScreen = StackViewVC()
        stackScreen.title = "BC Stack Screen"
        
        navigationController?.pushViewController(stackScreen, animated: true) 
    }

}

