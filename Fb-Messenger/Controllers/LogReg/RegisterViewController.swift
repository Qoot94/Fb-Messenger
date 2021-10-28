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
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.profilePicPicked(tapGestureRecognizer:)))
           //imageView.isUserInteractionEnabled = true
        profileIMG.addGestureRecognizer(tapGestureRecognizer)
    }
    

    @IBAction func profilePicPicked(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.presentPhotoActionSheet()
    }

}
