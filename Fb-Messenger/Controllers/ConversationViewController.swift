import UIKit
import FirebaseAuth
class ConversationsViewController: UIViewController {
    // root view controller that gets instantiated when app launches
    // check to see if user is signed in using ... user defaults
    // they are, stay on the screen. If not, show the login screen
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
        }
        catch {
        }
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
  
    }
    override func viewWillAppear(_ animated: Bool) {
        validateAuth()
    }
    private func validateAuth(){
        // current user is set automatically when you log a user in
        if FirebaseAuth.Auth.auth().currentUser == nil {
            // present login view controller
//            let vc = LoginViewController()
//            let nav = UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: false)
            let loginvc=storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
            
            present(loginvc, animated: true, completion: nil)
            loginvc.modalPresentationStyle = .fullScreen
        }
    }
}
