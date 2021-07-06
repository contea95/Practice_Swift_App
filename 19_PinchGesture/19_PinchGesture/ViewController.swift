//
//  ViewController.swift
//  19_PinchGesture
//
//  Created by 한상혁 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtPinch: UILabel!
    
    var initalFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizer.State.began) {
            initalFontSize = txtPinch.font.pointSize
        }else {
            txtPinch.font = txtPinch.font.withSize(initalFontSize * pinch.scale)
        }
    }


}

