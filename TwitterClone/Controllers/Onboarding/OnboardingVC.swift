//
//  OnboardingVC.swift
//  TwitterClone
//
//  Created by Haytham on 04/08/2023.
//

import UIKit

class OnboardingVC: UIViewController {

    private let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()

    private let promptLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Have an account already?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.tintColor = .gray
        return label
    }()

    private let creatAccaountButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.tintColor = .white
        return button
    }()

    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.text = "See what's happening in the world right now"
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(creatAccaountButton)
        view.addSubview(promptLabel)
        view.addSubview(loginButton)

        creatAccaountButton.addTarget(self, action: #selector(didtapCreateAccount), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)

        configureConstarnts()
    }

    @objc private func didTapLogin() {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }


    @objc private func didtapCreateAccount() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func configureConstarnts() {
        let welcomeLabelConstrants = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]

        let creatAccaountButtonConstrants = [
            creatAccaountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            creatAccaountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            creatAccaountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
            creatAccaountButton.heightAnchor.constraint(equalToConstant: 60)
        ]

        let promptLabelConstrants = [
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            promptLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ]

        let loginButtonConstrants = [
            loginButton.leadingAnchor.constraint(equalTo: promptLabel.trailingAnchor, constant: 10),
            loginButton.centerYAnchor.constraint(equalTo: promptLabel.centerYAnchor)
        ]

        NSLayoutConstraint.activate(welcomeLabelConstrants)
        NSLayoutConstraint.activate(creatAccaountButtonConstrants)
        NSLayoutConstraint.activate(promptLabelConstrants)
        NSLayoutConstraint.activate(loginButtonConstrants)
    }

    
}
