//
//  ViewController.swift
//  11_Navigation
//
//  Created by 한상혁 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController, Editdelegate{
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    // EditViewController로 정보를 보내는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use Button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        if isZoom {
            if orgZoom {
                
            } else {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if orgZoom {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.width/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
            
        }
        
    }
    

}

