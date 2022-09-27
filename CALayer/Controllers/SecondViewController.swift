//
//  SecondViewController.swift
//  CALayer
//
//  Created by Vladimir Sekerko on 23.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = 1
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return shapeLayer
    }()
    
    private let overShapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return shapeLayer
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.masksToBounds = true
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
    
    private lazy var toThirdVCButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next!", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.tintColor = .white
        button.addTarget(self, action: #selector(toThirdVCButtonTapped), for: .touchUpInside)
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
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        view.layer.addSublayer(shapeLayer)
        view.layer.addSublayer(overShapeLayer)
        view.addSubview(imageView)
        view.addSubview(mainButton)
        view.addSubview(toThirdVCButton)
    }
    
    /*
     var full = CGFloat(Double.pi * 2)
     var quarter = CGFloat(Double.pi / 2)
     var half = CGFloat(Double.pi)
     var threeQuarter = CGFloat(3 * Double.pi / 2)
     */
    
    private func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath(arcCenter: imageView.center,
                                radius: imageView.frame.width / 2,
                                startAngle: 0.0,
                                endAngle: CGFloat(Double.pi * 2),
                                clockwise: true)
        shapeLayer.path = path.cgPath
    }
    
    private func startAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = true
        animation.delegate = self
        overShapeLayer.add(animation, forKey: nil)
    }
    
    @objc private func mainButtonTapped() {
        startAnimation()
    }
    
    @objc private func toThirdVCButtonTapped() {
        let controller = ThirdViewController()
        present(controller, animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            imageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            mainButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 150),
            mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            
            toThirdVCButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 20),
            toThirdVCButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            toThirdVCButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            toThirdVCButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - CAAnimationDelegate
extension SecondViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        dismiss(animated: true)
    }
}
