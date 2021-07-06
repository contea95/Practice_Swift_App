//
//  ViewController.swift
//  09_PageControl
//
//  Created by 한상혁 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {

    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left :
                if pageControl.currentPage < images.count {
                    pageControl.currentPage += 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                }
                else {
                    
                }
            case UISwipeGestureRecognizer.Direction.right :
                if pageControl.currentPage > 0 {
                    pageControl.currentPage -= 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                }
                else {
                    
                }
            default :
                break
            }
            
        }
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

