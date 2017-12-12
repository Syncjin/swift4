//
//  LoginViewController.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 12..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        IDTextField.delegate = self
        PWTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginToIntro(_ sender: UIButton) {
        if IDTextField.text == "" || PWTextField.text == ""{
            let alertController = UIAlertController(title: "Movie Pang", message: "ID와 PASSWORD를 정확히 입력해주세요", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK",style: UIAlertActionStyle.default) { (action: UIAlertAction) in
                if self.IDTextField.text == "" {
                    self.IDTextField.becomeFirstResponder() //텍스트필드 포커스 주기
                } else {
                    self.PWTextField.becomeFirstResponder()
                }
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            let introVC = storyboard?.instantiateViewController(withIdentifier: "introStoryboard") as! introViewController
            if IDTextField.text != nil {
                UserDefaults.standard.set(IDTextField.text, forKey: "userid")
            }
            present(introVC, animated: true, completion: nil)
        }
    }
    
    // 키보드 done 눌렀을 때 내려감
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()    //모든 텍스트필드
        return true
    }
    
    // 터치했을 때
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //뷰를 터치했을 때 내려간다
    }
}
