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
