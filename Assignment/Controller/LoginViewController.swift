//
//  LoginViewController.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/15.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        if((userEmail?.isEmpty)!||(userPassword?.isEmpty)!){
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
            
        }else{
            if(userEmailStored == userEmail){
                
                if(userPasswordStored == userPassword){
                    
                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                    UserDefaults.standard.synchronize();
                    self.dismiss(animated: true, completion: nil);
                }
                else if (userPasswordStored != userPassword){
                    displayMyAlertMessage(userMessage: "incorrect password or email!");
                    return;
                }
                
            }
            else if(userEmailStored != userEmail || userPasswordStored != userPassword){
                displayMyAlertMessage(userMessage: "incorrect password or email!");
                return;
            }
        }
        
        
        GlobalVariable.username = userEmailTextField.text!
    }
    
    func displayMyAlertMessage(userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true, completion:nil);
    }
    
    
    struct GlobalVariable {
        static var username = String()
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
