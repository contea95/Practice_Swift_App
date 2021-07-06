//
//  ViewController.swift
//  09_PageControl
//
//  Created by 한상혁 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {

    var initImgHeight: CGFloat!
    var initImgWidth: CGFloat!
    var initImgOrigin: CGPoint!
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initImgHeight = imgView.frame.height
        initImgWidth = imgView.frame.width
        initImgOrigin = imgView.frame.origin
        
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
                if pageControl.currentPage < images.count {
                    pageControl.currentPage += 1
                }
            case UISwipeGestureRecognizer.Direction.right :
                if pageControl.currentPage > 0 {
                    pageControl.currentPage -= 1
                }
            default :
                break
            }
            
            imgView.frame.origin = initImgOrigin
            imgView.frame.size = CGSize(width: initImgWidth, height: initImgHeight)
            print("width: \(String(describing: initImgWidth)), Height: \(String(describing: initImgHeight))")
            
            imgView.image = UIImage(named: images[pageControl.currentPage])
            
        }
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.frame.origin = initImgOrigin
        imgView.frame.size = CGSize(width: initImgWidth, height: initImgHeight)
        
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

