//
//  ViewController.swift
//  15_CameraPhotoLibraryPractice
//
//  Created by 한상혁 on 2021/07/05.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let ImagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var numImage = 0
    var flagImageSave = false
    

    @IBOutlet var imgTop: UIImageView!
    @IBOutlet var imgLeft: UIImageView!
    @IBOutlet var imgRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            ImagePicker.delegate = self
            ImagePicker.sourceType = .camera
            ImagePicker.mediaTypes = [kUTTypeImage as String]
            ImagePicker.allowsEditing = false
            
            present(ImagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            ImagePicker.delegate = self
            ImagePicker.sourceType = .photoLibrary
            ImagePicker.mediaTypes = [kUTTypeImage as String]
            ImagePicker.allowsEditing = true
            
            present(ImagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    @IBAction func btnInitImageView(_ sender: UIButton) {
        imgTop.image = nil
        imgLeft.image = nil
        imgRight.image = nil
        numImage = 0
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        selectImageView(captureImage, numImage: numImage)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage -= 1
        self.dismiss(animated: true, completion: nil)
    }
    
    func selectImageView(_ captureImage: UIImage, numImage: Int) {
        if (numImage % 3) == 1 {
            imgTop.image = captureImage
        } else if (numImage % 3) == 2 {
            imgLeft.image = captureImage
        } else if (numImage % 3) == 0 {
            imgRight.image = captureImage
        }
    }
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

