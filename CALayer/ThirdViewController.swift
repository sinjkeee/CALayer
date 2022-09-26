//
//  ThirdViewController.swift
//  CALayer
//
//  Created by Vladimir Sekerko on 26.09.2022.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    private var customView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        createShapeLayer()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(customView)
    }
    
    private func createShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: customView.bounds,
                                       byRoundingCorners: [.topLeft, .bottomRight],
                                       cornerRadii: CGSize(width: 30, height: 30)).cgPath
        customView.layer.mask = shapeLayer
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            customView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
}
