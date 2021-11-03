//
//  RegisterViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

//TODO: if email is not there, show warning.
//if nothing is entered, show warning.-> print error

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNametextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var newEmailtextField: UITextField!
    @IBOutlet weak var newPasswordtextField: UITextField!
    
    @IBOutlet weak var profileIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //profile img customization: make it round
        profileIMG.layer.cornerRadius = profileIMG.bounds.width / 2
        profileIMG.clipsToBounds=true
        profileIMG.layer.borderColor=UIColor.black.cgColor
        //placehilder customization
       
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.profilePicPicked(tapGestureRecognizer:)))
        //imageView.isUserInteractionEnabled = true
        profileIMG.addGestureRecognizer(tapGestureRecognizer)
        
        DatabaseManger.shared.test("qoot", firstNametextField.text!)
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    //MARK: Functions
    //register a new user
    func createUser(){
        Auth.auth().createUser(withEmail: newEmailtextField.text!, password: newPasswordtextField.text!, completion: { [self] authResult , error  in
        guard let result = authResult, error == nil else {
            print("Error creating user\(self.newEmailtextField.text!) ,error:\(String(describing: error?.localizedDescription))")
            return
        }
            //register other user data to firebase
            let userdata = ChatAppUser(firstName: self.firstNametextField.text!, lastName: self.LastNameTextField.text!, emailAddress: self.newEmailtextField.text!)
            DatabaseManger.shared.insertUser(with: userdata)
            
//            DatabaseManger.insertUser(userdata)
        let user = result.user
        print("Created User: \(user)")
            self.navigationController?.popViewController(animated: true)
//            if DatabaseManger.shared.userExists(with: newEmailtextField.text!, completion: (Bool) -> Void){
//
//            }
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
