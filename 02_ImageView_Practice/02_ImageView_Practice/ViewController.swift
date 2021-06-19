//
//  ViewController.swift
//  02_ImageView_Practice
//
//  Created by 한상혁 on 6/17/21.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    let maxImage = 6
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnNext(_ sender: UIButton) {
        if (numImage >= maxImage) {
            numImage = 1
        } else{
            numImage += 1
        }
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
        print("hello")
    }
    @IBAction func btnPrevious(_ sender: Any) {
        if (numImage <= 1) {
            numImage = maxImage
        } else{
            numImage -= 1
        }
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
    

}

