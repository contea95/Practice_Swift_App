//
//  ViewController.swift
//  02_Scene-Trans01
//
//  Created by 한상혁 on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
        // 이동할 뷰 컨트롤러 객체를 Storyboard ID 정보 이용해 참조
        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // 옵셔널 체인과 옵셔널 바인딩
//        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
//
        
        // guard 조건문을 통한 필터링 사용
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        // 화면 전환 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
            
//        }
        
    }
    
}

