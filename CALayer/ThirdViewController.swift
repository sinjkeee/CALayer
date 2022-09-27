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
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("To replicator layer", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        view.addSubview(mainButton)
    }
    
    private func createShapeLayer() {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: customView.bounds,
                                       byRoundingCorners: [.topLeft, .bottomRight],
                                       cornerRadii: CGSize(width: 30, height: 30)).cgPath
        customView.layer.mask = shapeLayer
    }
    
    @objc private func mainButtonTapped() {
        
        let controller = ReplicatorLayerVC()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            customView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            mainButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
