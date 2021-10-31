//
//  RegisterViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNametextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var newEmailtextField: UITextField!
    @IBOutlet weak var newPasswordtextField: UITextField!
    
    @IBOutlet weak var profileIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileIMG.layer.cornerRadius = profileIMG.bounds.width / 2
        profileIMG.clipsToBounds=true
        profileIMG.layer.borderColor=UIColor.black.cgColor
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.profilePicPicked(tapGestureRecognizer:)))
        //imageView.isUserInteractionEnabled = true
        profileIMG.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: Functions
    //register a new user
    func createUser(){
        FirebaseAuth.Auth.auth().createUser(withEmail: newEmailtextField.text!, password: newPasswordtextField.text!, completion: { authResult , error  in
        guard let result = authResult, error == nil else {
            print("Error creating user")
            return
        }
        let user = result.user
        print("Created User: \(user)")
    })
    }
    //MARK: IBActions and user interactions
    //open photo picker when tab gesture happens in uiimageview
    @IBAction func profilePicPicked(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.presentPhotoActionSheet()
    }
    @IBAction func signUpUser(_ sender: UIButton) {
        createUser()
    }
    
}
