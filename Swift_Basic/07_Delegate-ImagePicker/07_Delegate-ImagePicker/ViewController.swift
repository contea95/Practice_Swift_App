//
//  ViewController.swift
//  07_Delegate-ImagePicker
//
//  Created by 한상혁 on 2021/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        // 추가된 부분 - 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 실행
        self.present(picker, animated: false)
    }
}

// MARK: 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate{
    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.presentingViewController?.dismiss(animated: false)
        picker.dismiss(animated: false) { () in
            // 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false) { () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}
// MARK: 네비게이션 컨트롤러 델리게이트 메소드
extension ViewController: UINavigationControllerDelegate {
    
}
