//
//  ViewController.swift
//  CALayer
//
//  Created by Vladimir Sekerko on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me!", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
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
        gradient.colors = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1).cgColor]
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = view.bounds
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }

    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(imageView)
        view.addSubview(mainButton)
    }
    
    @objc private func mainButtonTapped() {
        let controller = SecondViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
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

