//
//  AnimateDetailViewController.swift
//  TestApp
//
//  Created by Prakash Mali on 10/31/20.
//  Copyright © 2020 Prakash Mali. All rights reserved.
//

import UIKit

class Animate1DetailViewController: UIViewController {
    
    @IBOutlet weak var redbox: UIView!
    
    @IBOutlet weak var bluebox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveFastDown()
        moveFastUp()
    }
    
    func moveUp(){
        UIView.animate(withDuration: 0.00001, animations: {
            var redboxFrame = self.redbox.frame
            redboxFrame.origin.y -= self.redbox.frame.size.height
            var blueboxFrame = self.bluebox.frame
            blueboxFrame.origin.y -= self.bluebox.frame.size.height
            
            self.redbox.frame = redboxFrame
            self.bluebox.frame = blueboxFrame
        }) { (make) in
            self.moveDown()
            print("move down")
        }
    }
    func moveDown(){
        UIView.animate(withDuration: 0.00001, animations: {
            var redboxFrame = self.redbox.frame
            redboxFrame.origin.y += self.redbox.frame.size.height
            var blueboxFrame = self.bluebox.frame
            blueboxFrame.origin.y += self.bluebox.frame.size.height
            
            self.redbox.frame = redboxFrame
            self.bluebox.frame = blueboxFrame
        }) { (make) in
            self.moveUp()
            print("move up")
        }
    }
    
    func moveFastDown() {
        UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseIn, animations: {
            var boxFrame = self.bluebox.frame
            boxFrame.origin.y *= self.bluebox.frame.size.height
            
            self.bluebox.frame = boxFrame}) { (make) in
                print("move fast down")
        }
    }
    
    func moveFastUp() {
        UIView.animate(withDuration: 1.5, delay: 1, options: .curveEaseIn, animations: {
            var boxFrame = self.redbox.frame
            boxFrame.origin.y -= self.redbox.frame.size.height * 15
            
            self.redbox.frame = boxFrame}) { (make) in
                print("move fast up")
        }
    }
}
