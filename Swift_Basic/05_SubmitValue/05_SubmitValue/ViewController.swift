//
//  ViewController.swift
//  05_SubmitValue
//
//  Created by 한상혁 on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {
    // 이메일 주소 입력 텍스트 필드
    @IBOutlet var email: UITextField!
    // 자동갱신 설정 스위치
    @IBOutlet var isUpdate: UISwitch!
    // 갱신 주기 설정 스태퍼
    @IBOutlet var interval: UIStepper!
    
    // 자동갱신 여부 표시 레이블
    @IBOutlet var isUpdateText: UILabel!
    // 갱신주기 텍스트 표시 레이블
    @IBOutlet var intervalText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분마다"
    }
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        // 값 전달 과정 작성
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 화면이동
        //self.present(rvc, animated: true)
        // 네비게이션 컨트롤러로 화면 전환
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
}

