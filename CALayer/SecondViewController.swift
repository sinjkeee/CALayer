//
//  SecondViewController.swift
//  CALayer
//
//  Created by Vladimir Sekerko on 23.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go back!", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.opacity = 0.5
        gradient.colors = [#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1).cgColor, #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        gradientLayer.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(imageView)
        view.addSubview(mainButton)
    }
    
    @objc private func mainButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            imageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
