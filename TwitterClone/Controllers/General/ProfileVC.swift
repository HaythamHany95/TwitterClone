//
//  ProfileVC.swift
//  TwitterClone
//
//  Created by Haytham on 29/07/2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    private var isStatusBarIsHidden : Bool = true
    
    private let statusBarView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.opacity = 0
        return view
    }()
    
    
    private let profileTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        view.addSubview(profileTableView)
        view.addSubview(statusBarView)
        
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.tableHeaderView = headerView
        profileTableView.contentInsetAdjustmentBehavior = .never
        
        navigationController?.navigationBar.isHidden = true
        
        configureConstrants()
    }
    
    private func configureConstrants(){
        
        let profileTableViewConstrants = [
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ]
        
        let statusBarViewConstrants = [
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 : 20)
        ]
        
        
        NSLayoutConstraint.activate(profileTableViewConstrants)
        NSLayoutConstraint.activate(statusBarViewConstrants)
    }
    
}

extension ProfileVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        
        if yPosition > 80 && isStatusBarIsHidden {
            isStatusBarIsHidden = false
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.statusBarView.layer.opacity = 1
                
            }
        } else if yPosition < 0 && !isStatusBarIsHidden {
            isStatusBarIsHidden = true
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.statusBarView.layer.opacity = 0
            }
        }
    }
    
    
}
