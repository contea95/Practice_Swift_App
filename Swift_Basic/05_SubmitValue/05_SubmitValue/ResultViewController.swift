//
//  ResultViewController.swift
//  05_SubmitValue
//
//  Created by 한상혁 on 2021/10/16.
//

import Foundation
import UIKit
class ResultViewController: UIViewController {
    // 화면 값 표시 레이블
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    // email 값 받는 변수
    var paramEmail: String = ""
    // update 값 받는 변수
    var paramUpdate: Bool = false
    // interval 값 받는 변수
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신 "
    }
    
    @IBAction func onBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
