//
//  ViewController.swift
//  portfolio
//
//  Created by 이우진 on 2017. 11. 29..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GiftImageView: UIImageView!
    @IBOutlet weak var MovieConstant: NSLayoutConstraint!
    
    @IBOutlet weak var MovieLabel: UILabel!
    @IBOutlet weak var MovieLabel2: UILabel!
    @IBOutlet weak var PangLabel: UILabel!
    @IBOutlet weak var PangLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MovieLabel2.alpha = 0
        MovieLabel2.shadowColor = UIColor.black
        MovieLabel2.shadowOffset.height = -5
        MovieLabel2.shadowOffset.width = 5
        MovieConstant.constant -= view.bounds.width
        PangLabel2.transform = CGAffineTransform(rotationAngle: CGFloat.pi/6)
        PangLabel2.alpha = 0
        PangLabel.alpha = 0
        
        // 제스쳐
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.MovieConstant.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 5, delay: 4, options: .curveEaseInOut, animations: {
            self.MovieLabel2.alpha = 0.7
            self.PangLabel2.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
        PangLabel.center = CGPoint(x:self.PangLabel.center.x-30,y:PangLabel.center.y+20)
        let PangCenter = self.PangLabel.center
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
            self.PangLabel.center = CGPoint(x:PangCenter.x+30,y:PangCenter.y-20)
            self.PangLabel.alpha = 1
            self.PangLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/6)
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.GiftImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/9)
        }) {(success: Bool) in
            if success {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.GiftImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/9)
                }) {(success: Bool) in
                    if success {
                        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                            self.GiftImageView.transform = CGAffineTransform(rotationAngle: 0)
                        })
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func swipeGesture(sender:UIGestureRecognizer){
        // 제스처를 하면 다른 뷰로 이동
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard")
        present(nextView, animated: true, completion: nil)

    }

    @IBAction func PresentBounce(_ sender: Any) {
        let btn = sender as! UIButton
        
        let bounds = btn.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            btn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height:btn.bounds.size.height)
        }) {(success:Bool) in
            if success {
                UIView.animate(withDuration: 0.5, animations: {
                    btn.bounds = bounds
                })
                
            }
        }
    }
}


