//
//  ViewController.swift
//  FlipViewDemo
//
//  Created by Eiji Kushida on 2018/01/06.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let flipView = FlipView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(flipView)
    }
}
