import UIKit
import FirebaseAuth
import JGProgressHUD

class ConversationsViewController: UIViewController {
    // root view controller that gets instantiated when app launches
    // check to see if user is signed in using ... user defaults
    // they are, stay on the screen. If not, show the login screen
    //sec7
    private let spinner = JGProgressHUD(style: .dark)
    
    private let  table: UITableView = {
            var table = UITableView()
            table.isHidden = true // first fetch the conversations, if none (don't show empty convos)
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return table
        }()
        
        private let noConversationsLabel: UILabel = {
            let label = UILabel()
            label.text = "No conversations"
            label.textAlignment = .center
            label.textColor = .gray
            label.font = .systemFont(ofSize: 21, weight: .medium)
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapComposeButton))
        view.addSubview(table)
        view.addSubview(noConversationsLabel)
        setupTableView()
        fetchConversations()
        
        //conversation vc is root, if user is not logged in, signout
        do {
            try FirebaseAuth.Auth.auth().signOut()
        }
        catch {
        }
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
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
extension ConversationsViewController{
 
        
        @objc private func didTapComposeButton(){
            // present new conversation view controller
            // present in a nav controller
            
            let vc = NewConversationViewController()
            let navVC = UINavigationController(rootViewController: vc)
            present(navVC,animated: true)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            table.layer.frame = view.bounds
        }
    
        
        private func setupTableView(){
            
            table.delegate = self
            table.dataSource = self
        }
        
        private func fetchConversations(){
            // fetch from firebase and either show table or label
            
            table.isHidden = false
        }
    }
    extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Hello World"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        // when user taps on a cell, we want to push the chat screen onto the stack
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)// highlight what we select
           
            let vc = ChatViewController()
            vc.title = "Jenny Smith"
            vc.navigationItem.largeTitleDisplayMode = .never
          navigationController?.pushViewController(vc, animated: true)
            //***might be better
            //let chatVC=storyboard?.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
           //
           //            present(chatVC, animated: true, completion: nil)
           //            chatVC.modalPresentationStyle = .fullScreen
        }
    }
    

