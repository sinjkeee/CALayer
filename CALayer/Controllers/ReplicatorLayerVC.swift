//
//  ReplicatorLayerVC.swift
//  CALayer
//
//  Created by Vladimir Sekerko on 27.09.2022.
//

import Foundation
import UIKit

class ReplicatorLayerVC: UIViewController {
    
    private var replicatorLayer: CAReplicatorLayer!
    private var sourceLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        replicatorLayer.frame = view.bounds
        replicatorLayer.position = view.center
        
        sourceLayer.frame = CGRect(x: 0.0, y: 0.0, width: 3, height: 17)
        sourceLayer.backgroundColor = UIColor.white.cgColor
        sourceLayer.position = view.center
        sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
        
        startAnimation(delay: 0.1, replicates: 30)
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        
        view.layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
    }
    
    private func startAnimation(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        let angle = CGFloat(Double.pi * 2) / CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        
        replicatorLayer.instanceDelay = delay
        
        sourceLayer.opacity = 0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = Double(replicates) * delay
        opacityAnimation.repeatCount = Float.infinity
        
        sourceLayer.add(opacityAnimation, forKey: nil)
    }
}
