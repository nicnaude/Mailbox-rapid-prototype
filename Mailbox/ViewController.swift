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
    
    
    //Lifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide items
        menuImageView.isHidden = true
        rescheduleImageView.isHidden = true
        
        scrollView.contentSize = CGSize(width: 320, height: 2200)
    }

    // Functions
    @IBAction func onPanButtonDrag(_ sender: UIPanGestureRecognizer) {
    print("drag")
        menuImageView.isHidden = false
    }
    
    @IBAction func onMessagePanDrag(_ sender: UIPanGestureRecognizer) {
    print("Message drag")
    }
    
} // The end

