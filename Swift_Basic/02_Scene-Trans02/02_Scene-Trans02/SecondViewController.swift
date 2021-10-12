//
//  SecondViewController.swift
//  02_Scene-Trans02
//
//  Created by 한상혁 on 2021/10/13.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
