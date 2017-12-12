//
//  introViewController.swift
//  portfolio
//
//  Created by 이우진 on 2017. 11. 29..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit
import LTMorphingLabel


class introViewController: UIViewController, LTMorphingLabelDelegate{
    
    @IBOutlet weak var PortfolioButton1: UIButton!
    @IBOutlet fileprivate var Stack: LTMorphingLabel!
    @IBOutlet fileprivate var Stack2: LTMorphingLabel!
    @IBOutlet fileprivate var Stack3: LTMorphingLabel!
    @IBOutlet fileprivate var Stack4: LTMorphingLabel!
    @IBOutlet fileprivate var Stack5: LTMorphingLabel!
    
    fileprivate var i = -1
    fileprivate var i2 = -1
    fileprivate var i3 = -1
    fileprivate var i4 = -1
    fileprivate var i5 = -1
    fileprivate var textArray = ["JAVA","JSP","SPRING","Android"]
    fileprivate var textArray2 = ["JavaScript","ES6","React",
                                  "React-Native","Ionic"]
    fileprivate var textArray3 = ["MySql","Mongo","Firebase","Realm"]
    fileprivate var textArray4 = ["Swift3","Swift4","RxSwift"]
    fileprivate var textArray5 = ["Node.js","express","Restful"]
    fileprivate var text: String {
        i = i >= textArray.count - 1 ? 0: i + 1
        return textArray[i]
    }
    fileprivate var text2: String {
        i2 = i2 >= textArray2.count - 1 ? 0: i2 + 1
        return textArray2[i2]
    }
    fileprivate var text3: String {
        i3 = i3 >= textArray3.count - 1 ? 0: i3 + 1
        return textArray3[i3]
    }
    fileprivate var text4: String {
        i4 = i4 >= textArray4.count - 1 ? 0: i4 + 1
        return textArray4[i4]
    }
    fileprivate var text5: String {
        i5 = i5 >= textArray5.count - 1 ? 0: i5 + 1
        return textArray5[i5]
    }
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var FaceImageView: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var isSlidemenuHidden = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // constraint 초기화
        sideMenuConstraint.constant = -158
        
        Stack.delegate = self
        FaceImageView.clipsToBounds = true
        FaceImageView.layer.cornerRadius = FaceImageView.frame.width / 2
        FaceImageView.layer.borderWidth = 1
        FaceImageView.layer.borderColor = UIColor.white.cgColor
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        Stack.text = text
        Stack2.text = text2
        Stack3.text = text3
        Stack4.text = text4
        Stack5.text = text5
        
        let idtext = UserDefaults.standard.object(forKey: "userid") as? String
        userIdLabel.text = idtext! + "님"
        welcomeLabel.text = "환영합니다"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Stack.morphingEffect = .evaporate
        Stack.text = text
        Stack2.morphingEffect = .fall
        Stack2.text = text2
        Stack3.morphingEffect = .sparkle
        Stack3.text = text3
        Stack4.morphingEffect = .pixelate
        Stack4.text = text4
        Stack5.morphingEffect = .scale
        Stack5.text = text5
    }

    @objc func update(){
        Stack.text = text
        Stack2.text = text2
        Stack3.text = text3
        Stack4.text = text4
        Stack5.text = text5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MenuButton(_ sender: UIButton) {
        if isSlidemenuHidden {
            sideMenuConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            sideMenuConstraint.constant = -158
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSlidemenuHidden = !isSlidemenuHidden
    }
    
}

extension introViewController {
    
    func morphingDidStart(_ label: LTMorphingLabel) {
        
    }
    
    func morphingDidComplete(_ label: LTMorphingLabel) {
        
    }
    
    func morphingOnProgress(_ label: LTMorphingLabel, progress: Float) {
        
    }
    
}

