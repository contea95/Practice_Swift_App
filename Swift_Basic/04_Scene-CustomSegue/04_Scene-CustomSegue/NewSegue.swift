//
//  NewSegue.swift
//  04_Scene-CustomSegue
//
//  Created by 한상혁 on 2021/10/14.
//

import Foundation
import UIKit
class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        // 세그웨이 출발 뷰 컨트롤러
        let srcUVC = self.source
        // 세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        // fromView에서 toView로 뷰 전환
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlUp)
    }
}
