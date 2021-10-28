//
//  RegisterViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var profileIMG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileIMG.layer.cornerRadius = profileIMG.bounds.width / 2
        profileIMG.clipsToBounds=true
        profileIMG.layer.borderColor=UIColor.black.cgColor
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pickProfilePhoto(tapGestureRecognizer:)))
        profileIMG.isUserInteractionEnabled = true
        profileIMG.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    @IBAction func pickProfilePhoto(tapGestureRecognizer: UITapGestureRecognizer){
        let ImagePressed = tapGestureRecognizer.view as! UIImageView
        self.presentPhotoActionSheet()
        print("tapppp")
    }

}
