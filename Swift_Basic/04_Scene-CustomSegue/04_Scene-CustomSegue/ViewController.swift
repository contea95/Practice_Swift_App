//
//  ViewController.swift
//  04_Scene-CustomSegue
//
//  Created by 한상혁 on 2021/10/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "custom_segue") {
            NSLog("커스텀 세그 실행")
        } else if (segue.identifier == "action_segue") {
            NSLog("액션 세그 실행")
        } else {
            NSLog("알 수 없는 세그입니다.")
        }
//        NSLog("segueway identifier: \(segue.identifier!)")
    }


}

