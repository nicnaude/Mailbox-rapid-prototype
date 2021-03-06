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
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var messageContainerView: UIView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    
    
    // Feed panel variables
    var feedOriginalCenter: CGPoint!
    var feedSlideOffset: CGFloat!
    var feedSlide: CGPoint!
    var feedHomeSlide: CGPoint!
    
    // Message panel variables
    var messageOriginalCenter: CGPoint!
    var messageSlideOffset: CGFloat!
    var messageSlideRight: CGPoint!
    var messageSlideLeft: CGPoint!
    var messageHomeSlide: CGPoint!
    
    // Message container variables
    var comtainerOriginalCenter: CGPoint!
    var containerSlideOffset: CGFloat!
    var containerSlideRight: CGPoint!
    var containerSlideLeft: CGPoint!
    var containerHomeSlide: CGPoint!
    
    //Colors
    var yellowColorMail: UIColor = UIColor(red:0.98, green:0.82, blue:0.27, alpha:1.0)
    var redColorMail: UIColor = UIColor(red:0.91, green:0.33, blue:0.23, alpha:1.0)
    var greyColorMail: UIColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0)
    var brownColorMail: UIColor = UIColor(red:0.84, green:0.65, blue:0.47, alpha:1.0)
    var greenColorMail: UIColor = UIColor(red:0.45, green:0.84, blue:0.41, alpha:1.0)
    
    //Lifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide items
        menuImageView.isHidden = true
        self.rescheduleImageView.alpha = 0
        archiveImageView.isHidden = true
        deleteImageView.isHidden = true
        listImageView.isHidden = true
        laterImageView.isHidden = true
        archiveImageView.isHidden = true
        deleteImageView.isHidden = true
        laterImageView.isHidden = true
        listImageView.isHidden = true
        
        // Main feed panel slide setup
        scrollView.contentSize = CGSize(width: 320, height: 2200)
        feedSlideOffset = 283
        feedSlide = CGPoint(x: feedPanelView.center.x + feedSlideOffset,y: feedPanelView.center.y)
        self.feedOriginalCenter = feedPanelView.center
        
        // Message slide setup
        messageSlideOffset = 60
        self.messageOriginalCenter = messageImageView.center
        messageSlideRight = CGPoint(x: messageImageView.center.x + messageSlideOffset,y: messageImageView.center.y)
        messageSlideLeft = CGPoint(x: messageImageView.center.x - messageSlideOffset,y: messageImageView.center.y)
        
        
        // Message container setup
        containerSlideOffset = 60
        self.comtainerOriginalCenter = messageImageView.center
        containerSlideRight = CGPoint(x: messageContainerView.center.x + containerSlideOffset,y: messageContainerView.center.y)
        containerSlideLeft = CGPoint(x: messageContainerView.center.x - containerSlideOffset,y: messageContainerView.center.y)
        
        print("At launch: \(feedOriginalCenter)")
    }
    
    // Functions
    @IBAction func onPanButtonDrag(_ sender: UIPanGestureRecognizer) {
        menuImageView.isHidden = false
        
        // let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        feedHomeSlide = CGPoint(x: feedOriginalCenter.x, y: feedOriginalCenter.y)
        
        self.feedPanelView.center = CGPoint(x: self.feedOriginalCenter.x + translation.x, y: self.feedOriginalCenter.y)
        
        if sender.state == .began {
            self.feedPanelView.center = self.feedPanelView.center
            
        } else if sender.state == .changed {
            //            self.feedPanelView.center = CGPoint(x: self.feedOriginalCenter.x + translation.x, y: self.feedOriginalCenter.y)
            //            self.messageImageView.center = messageOriginalCenter
            self.messageContainerView.backgroundColor = UIColor(red:0.91, green:0.33, blue:0.23, alpha:0.0)
            
        } else if sender.state == .ended {
            if translation.x < 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Moved left")
                    //                    self.feedPanelView.center = CGPoint(x: self.feedOriginalCenter.x + translation.x, y: self.feedOriginalCenter.y)
                    //                    self.feedOriginalCenter = self.feedPanelView.center
                    self.feedPanelView.center = self.feedOriginalCenter
                }
            } else if translation.x > 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Moved right")
                    self.feedPanelView.center = self.feedSlide
                }
            }
        }
    }
    @IBAction func onScreenEdgePanned(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        messageHomeSlide = CGPoint(x: messageOriginalCenter.x, y: messageOriginalCenter.y)
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            print(translation)
            
            if translation.x > 0 && translation.x < 60 {
                // show grey, sliding right
                print("grey - sliding right")
                self.messageContainerView.backgroundColor = greyColorMail
                
            } else if translation.x >= 60 && translation.x < 170 {
                // show green
                print("green – sliding right")
                self.messageContainerView.backgroundColor = greenColorMail
                self.archiveImageView.isHidden = false
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x >= 170 {
                // show red
                print("red – sliding right")
                self.messageContainerView.backgroundColor = self.redColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = false
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x < 0 && translation.x > -60 {
                // show grey, sliding left
                print("grey – sliding left")
                self.messageContainerView.backgroundColor = greyColorMail
                
            } else if translation.x <= -60 && translation.x > -170 {
                // show yellow
                print("yellow – sliding left")
                self.messageContainerView.backgroundColor = self.yellowColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = false
                self.listImageView.isHidden = true
                
            } else if translation.x <= -170 {
                // show brown
                print("brown – sliding left")
                self.messageContainerView.backgroundColor = self.brownColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = false
            }
            
            self.messageImageView.center = CGPoint(x: self.messageOriginalCenter.x + translation.x, y: self.messageOriginalCenter.y)
            
        } else if sender.state == .ended {
            if translation.x < 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Message left")
                    print("messageOriginalCenter: \(self.messageOriginalCenter)")
                    print("translation: \(translation)")
                    self.messageImageView.center = self.messageOriginalCenter
                    print("After sliding: \(self.feedOriginalCenter)")
                }
            } else if translation.x > 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Message right")
                    self.messageImageView.center = self.messageOriginalCenter
                }
            } else if translation.x <= -60 {
                print("it should show")
                self.rescheduleImageView.alpha = 0
            }
        }
        
    }
    
    @IBAction func onMessagePanDrag(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        messageHomeSlide = CGPoint(x: messageOriginalCenter.x, y: messageOriginalCenter.y)
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            print(translation)
            
            if translation.x > 0 && translation.x < 60 {
                // show grey, sliding right
                print("grey - sliding right")
                self.messageContainerView.backgroundColor = greyColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x >= 60 && translation.x < 170 {
                // show green
                print("green – sliding right")
                self.messageContainerView.backgroundColor = greenColorMail
                self.archiveImageView.isHidden = false
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x >= 170 {
                // show red
                print("red – sliding right")
                self.messageContainerView.backgroundColor = self.redColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = false
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x < 0 && translation.x > -60 {
                // show grey, sliding left
                print("grey – sliding left")
                self.messageContainerView.backgroundColor = greyColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = true
                
            } else if translation.x <= -60 && translation.x > -170 {
                // show yellow
                print("yellow – sliding left")
                self.messageContainerView.backgroundColor = self.yellowColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = false
                self.listImageView.isHidden = true
                
            } else if translation.x <= -170 {
                // show brown
                print("brown – sliding left")
                self.messageContainerView.backgroundColor = self.brownColorMail
                self.archiveImageView.isHidden = true
                self.deleteImageView.isHidden = true
                self.laterImageView.isHidden = true
                self.listImageView.isHidden = false
            }
            
            self.messageImageView.center = CGPoint(x: self.messageOriginalCenter.x + translation.x, y: self.messageOriginalCenter.y)
            
        } else if sender.state == .ended {
            if translation.x < 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Message left")
                    print("messageOriginalCenter: \(self.messageOriginalCenter)")
                    print("translation: \(translation)")
                    self.messageImageView.center = self.messageOriginalCenter
                    print("After sliding: \(self.feedOriginalCenter)")
                    
                    if translation.x <= 100 && translation.x <= 60  {
                        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: {
                            self.rescheduleImageView.alpha = 1.0
                        }, completion: nil)
                    }
                }
            } else if translation.x > 0 {
                UIView.animate(withDuration: 0.3) {
                    print("Message right")
                    self.messageImageView.center = self.messageOriginalCenter
                }
            }
        }
    } // The end of the message drag
    
    
    @IBAction func onMessageTapped(_ sender: UITapGestureRecognizer) {
        print("tap")
        self.messageImageView.center = messageOriginalCenter
        self.messageContainerView.backgroundColor = UIColor(red:0.91, green:0.33, blue:0.23, alpha:0.0)
    } // The end of the message tapped
    
    
    @IBAction func onHamburgerTapped(_ sender: UITapGestureRecognizer) {
        feedHomeSlide = CGPoint(x: feedOriginalCenter.x, y: feedOriginalCenter.y)
    }
    
    
    @IBAction func onOverlayTapped(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            self.rescheduleImageView.alpha = 0
        }
    }
} // The end

