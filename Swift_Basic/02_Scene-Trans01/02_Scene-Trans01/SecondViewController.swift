//
//  SecondViewController.swift
//  02_Scene-Trans01
//
//  Created by 한상혁 on 2021/10/13.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
