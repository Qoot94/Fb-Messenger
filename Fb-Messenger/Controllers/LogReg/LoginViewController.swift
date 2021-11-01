//
//  LoginViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit
import FirebaseAuth
//TODO: if email is not there, show warning.
//if nothing is entered, show warning.-> print error

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
        FirebaseAuth.Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { [weak self] authResult, error in
            guard let strongSelf = self else{
                return
            }
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(strongSelf.emailTextField.text!)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
            //smt here is wrong???  x
            strongSelf.navigationController?.popViewController(animated: true)
            //dismiss(animated: true, completion: nil)
            
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
