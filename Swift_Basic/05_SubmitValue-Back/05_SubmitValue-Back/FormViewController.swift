//
//  FormViewController.swift
//  05_SubmitValue-Back
//
//  Created by 한상혁 on 2021/10/18.
//

import Foundation
import UIKit
class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController로 타입 캐스팅 진행
        let preVC = self.presentingViewController
        // UIViewController객체는 자식의 프로퍼티를 참조할 수 없다.
        // 타입 캐스팅을 통해 ViewController로 캐스팅하고 참조
        guard let vc = preVC as? ViewController else {
            NSLog("error")
            return
        }
        
        // 값 전달
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        // 이전 화면으로 복귀
        self.presentingViewController?.dismiss(animated: true)
    }
}
