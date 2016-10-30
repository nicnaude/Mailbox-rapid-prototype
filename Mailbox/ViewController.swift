//
//  ViewController.swift
//  Mailbox
//
//  Created by Nicholas Naudé on 29/10/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedPanelView: UIView!
    
    // Variables
    var feedOriginalCenter: CGPoint!
    var feedSlideOffset: CGFloat!
    var feedSlide: CGPoint!
    var feedHomeSlide: CGPoint!
    
    //Lifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide items
        menuImageView.isHidden = true
        rescheduleImageView.isHidden = true
        
        scrollView.contentSize = CGSize(width: 320, height: 2200)
        feedSlideOffset = 283
        feedSlide = CGPoint(x: feedPanelView.center.x + feedSlideOffset,y: feedPanelView.center.y)
        feedHomeSlide = CGPoint(x: feedPanelView.center.x - feedSlideOffset,y: feedPanelView.center.y)
        self.feedOriginalCenter = feedPanelView.center
        print("At launch: \(feedOriginalCenter)")
    }
    
    // Functions
    @IBAction func onPanButtonDrag(_ sender: UIPanGestureRecognizer) {
        menuImageView.isHidden = false
        
        // let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        print(translation)
        
        if sender.state == .began {
            // self.feedOriginalCenter = self.feedPanelView.center
            
        } else if sender.state == .changed {
            self.feedPanelView.center = CGPoint(x: self.feedOriginalCenter.x + translation.x, y: self.feedOriginalCenter.y)
            
        } else if sender.state == .ended {
            if translation.x < 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Moved left")
                    print(self.feedOriginalCenter)
                    self.feedPanelView.center = self.feedOriginalCenter
                    print("After sliding: \(self.feedOriginalCenter)")
                }
            } else if translation.x > 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Moved right")
                    // self.feedPanelView.center = self.feedSlide
                    
                    self.feedPanelView.center = self.feedSlide
                }
            }
        }
    }
    
    @IBAction func onMessagePanDrag(_ sender: UIPanGestureRecognizer) {
        print("Message drag")
    }
    
} // The end

