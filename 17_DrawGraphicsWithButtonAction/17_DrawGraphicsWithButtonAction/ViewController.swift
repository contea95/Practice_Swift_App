//
//  ViewController.swift
//  17_DrawGraphicsWithButtonAction
//
//  Created by 한상혁 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    var lastPoint: CGPoint! // 바로 전에 터치하거나 이동한 위치
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.black.cgColor

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtLineSize: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.txtLineSize.addTarget(self, action: #selector(self.txtLineSizeDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        // 선 색상을 설정
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        // 선 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        // 선 두께 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        
        let currPoint = touch.location(in: imgView)
        // 현재 imgView에 있는 전체 이미지를 imgView의 크기로 그림
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }

    @IBAction func btnBlackLine(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRedLine(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnGreenLine(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnBlueLIne(_ sender: UIButton) {
        lineColor = UIColor.link.cgColor
    }
    @IBAction func btnClearButton(_ sender: UIButton) {
        imgView.image = nil
    }
    
    @objc func txtLineSizeDidChange(_ sender: Any) {
        if self.txtLineSize.text != "" {
            lineSize = CGFloat(NSString(string: txtLineSize.text!).floatValue)
        } else {
            lineSize = 2.0
        }
    }
}

