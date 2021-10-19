//
//  ViewController.swift
//  06_Msg-AlertController
//
//  Created by 한상혁 on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        
    }
    // 화면이 뜨자마자 자동으로 메시지 창을 띄워주어야 할 때
    override func viewDidAppear(_ animated: Bool) {
        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
//        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)

        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.result.text = "취소버튼 클릭"
        }

        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.result.text = "확인버튼 클릭"
        }

        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
            self.result.text = "실행버튼 클릭"
        }

        let stop = UIAlertAction(title: "중지", style: .default) { (_) in
            self.result.text = "중지버튼 클릭"
        }


        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)

        self.present(alert, animated: true)
    }
    
    @IBAction func alert(_ sender: UIButton){

        // 메시지창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
//        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)

        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            self.result.text = "취소버튼 클릭"
        }

        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            self.result.text = "확인버튼 클릭"
        }

        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in
            self.result.text = "실행버튼 클릭"
        }

        let stop = UIAlertAction(title: "중지", style: .default) { (_) in
            self.result.text = "중지버튼 클릭"
        }


        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)

        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: UIButton) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID contea95@naver.com의 암호를 입력하십시오"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!)입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
            
            if let tf2 = alert.textFields?[1] {
                print("입력된 값은 \(tf2.text!)입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        })
        alert.addTextField(configurationHandler: { (tf2) in
            tf2.placeholder = "두번째"
            tf2.isSecureTextEntry = false
        })
        self.present(alert, animated: false)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "contea95" && loginPw == "1234" {
                self.result.text = "인증되었습니다."
            } else {
                self.result.text = "인증에 실패하였습니다."
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "아이디"
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: false)
    }

}

