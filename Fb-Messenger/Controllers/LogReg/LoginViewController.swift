//
//  LoginViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    //MARK: IBOutlet 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var facebookLoginBt: UIButton!
    @IBOutlet weak var GoogleLoginBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    //MARK: Functions
    func logIn(){
        // Firebase Login
        FirebaseAuth.Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { authResult, error in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(self.emailTextField.text!)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
        })

    }
    //MARK: IBActions and user interactions
    @IBAction func LogInUser(_ sender: UIButton) {
        logIn()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
