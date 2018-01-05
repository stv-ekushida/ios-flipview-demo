//
//  FlipView.swift
//  FlipViewDemo
//
//  Created by Eiji Kushida on 2018/01/06.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit
import QuartzCore

final class FlipView: UIView {
    @IBOutlet weak var baseView: UIView!
    private var frontLayer = CALayer()
    private var backLayer = CALayer()
    private var isFront = true

    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("FlipView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        setupFrontLayer()
        setupBackLayer()
        self.addSubview(view)
    }
    
    /// 表
    private func setupFrontLayer() {
        frontLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        frontLayer.backgroundColor = UIColor.red.cgColor
        frontLayer.isDoubleSided = false
        frontLayer.zPosition = 1
        self.baseView.layer.addSublayer(frontLayer)
    }
    
    /// 裏
    private func setupBackLayer() {
        backLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        backLayer.backgroundColor = UIColor.blue.cgColor
        backLayer.isDoubleSided = true
        self.baseView.layer.addSublayer(backLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanFalse, forKeyPath: kCATransactionDisableActions)
        CATransaction.setAnimationDuration(1.0)
        self.isFront = !self.isFront
        var transform : CATransform3D = CATransform3DIdentity
        
        transform.m34 = 1.0 / -420.0
        
        if self.isFront {
            transform = CATransform3DMakeRotation(0,  0.0, 1.0, 0.0)
        } else {
            transform = CATransform3DMakeRotation(CGFloat(Double.pi),  0.0, 1.0, 0.0)
        }
        self.frontLayer.transform = transform
        self.backLayer.transform = transform
        
        CATransaction.commit()
    }
}
