//
//  RegisterPageViewController.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/15.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userConfirmPassword = userConfirmPasswordTextField.text;
        
        //check empty fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)!){
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
        }
        if(userPassword != userConfirmPassword){
            displayMyAlertMessage(userMessage: "Password do not match");
            return;
        }
        //Store data,
        UserDefaults.standard.set(userEmail, forKey:"userEmail");
        UserDefaults.standard.set(userPassword, forKey:"userPassword");
        UserDefaults.standard.synchronize();
        //display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            action in
            self.dismiss(animated: true, completion: nil);
        }
        myAlert.addAction(okAction);
        self.present( myAlert,animated: true, completion:nil);
    }
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true, completion:nil);
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
