//
//  NewConversationViewController.swift
//  Fb-Messenger
//
//  Created by Hamad Wasmi on 21/03/1443 AH.
//

import UIKit
import JGProgressHUD
class NewConversationViewController: UIViewController {
    private let spinner = JGProgressHUD(style: .dark)
    
    private let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "search for users"
        return searchBar
    }()
    
    private let  table: UITableView = {
            var table = UITableView()
            table.isHidden = true // first fetch the conversations, if none (don't show empty convos)
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return table
        }()
    
    private let noSearchResultLabel: UILabel = {
        let label = UILabel()
        label.text = "No Matches"
        label.isHidden = true
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissSelf))
        searchBar.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    @objc private func dismissSelf(){
        dismiss(animated: true)
    }
}
extension NewConversationViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
    }
}
