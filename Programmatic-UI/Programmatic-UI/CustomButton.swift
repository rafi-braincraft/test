//
//  CustomButton.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 21/10/24.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) { //when we use storyboard
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemMint
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 28)
        layer.cornerRadius = 10
    }
}
