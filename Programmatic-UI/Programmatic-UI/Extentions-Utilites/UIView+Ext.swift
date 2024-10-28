//
//  UIView+Ext.swift
//  Programmatic-UI
//
//  Created by BCL Device 10 on 20/10/24.
//
import UIKit

extension UIView {
    func pin(to superView: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true //left
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true //right
    }
}
