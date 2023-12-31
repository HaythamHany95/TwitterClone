//
//  ProfileTableViewHeader.swift
//  TwitterClone
//
//  Created by Haytham on 30/07/2023.
//

import UIKit

class ProfileTableViewHeader: UIView {

    private enum SectionTaps : String {
        case tweets = "Tweets"
        case tweetsAndReplies = "Tweets & Replies"
        case media = "Media"
        case likes = "Likes"
    }

    private var selectedTab: Int = 0 {
        didSet{
            for i in 0..<tabs.count {
                UIView.animate(withDuration: 0.3, delay: 0) {
                    self.sectionStack.arrangedSubviews[i].tintColor = i == self.selectedTab ? .label : .secondaryLabel
                    self.leadingAnchors[i].isActive = i == self.selectedTab ? true : false
                    self.trailingAnchors[i].isActive = i == self.selectedTab ? true : false
                    self.layoutIfNeeded()
                }
            }
        }
    }

    private var leadingAnchors : [NSLayoutConstraint] = []
    private var trailingAnchors : [NSLayoutConstraint] = []


    private let indicator : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return view
    }()

    private var tabs : [UIButton] = ["Tweets","Tweets & Replies","Media","Likes"]
        .map { buttonTitle in
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }


    private lazy var sectionStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: tabs)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()


    private let followingTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "Following"
        return label
    }()

    private let followingCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.text = "52"
        return label
    }()

    private let followersTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "Followers"
        return label
    }()

    private let followersCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.text = "355"
        return label
    }()

    private let joinedDateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Joined Jul 2023"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let joinDateImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar",withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .secondaryLabel
        return imageView
    }()



    private let userBioLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Developer"
        label.textColor = .label
        label.numberOfLines = 3
        return label
    }()


    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@elrifay"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()


    private let displayNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Haytham Hany"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()


    private let profileAvatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        //masksToBounds to make the layer that becomes #circular crop any thing outside the layer
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()


    private let profileHeaderImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "header")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //      backgroundColor = .systemBlue
        addSubview(profileHeaderImageView)
        addSubview(profileAvatarImageView)
        addSubview(displayNameLabel)
        addSubview(usernameLabel)
        addSubview(userBioLabel)
        addSubview(joinDateImageView)
        addSubview(joinedDateLabel)
        addSubview(followingTextLabel)
        addSubview(followingCountLabel)
        addSubview(followersTextLabel)
        addSubview(followersCountLabel)
        addSubview(sectionStack)
        addSubview(indicator)


        configureConstrants()
        configureStackButtons()
    }

    private func configureStackButtons(){
        for (i, button) in sectionStack.arrangedSubviews.enumerated() {
            guard let button = button as? UIButton else {return}
            if i == selectedTab {
                button.tintColor = .label
            }else{
                button.tintColor = .secondaryLabel
            }
            button.addTarget(self, action: #selector(didTapTab), for: .touchUpInside)
        }
    }


    @objc private func didTapTab(_ sender: UIButton) {
        guard let label = sender.titleLabel?.text else {return}
        switch label {
        case SectionTaps.tweets.rawValue :
            selectedTab = 0
        case SectionTaps.tweetsAndReplies.rawValue :
            selectedTab = 1
        case SectionTaps.media.rawValue :
            selectedTab = 2
        case SectionTaps.likes.rawValue:
            selectedTab = 3
        default :
            selectedTab = 0
        }

    }


    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configureConstrants(){

        for i in 0..<tabs.count {
            let leadingAnchor = indicator.leadingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].leadingAnchor)
            leadingAnchors.append(leadingAnchor)
            let trailingAnchor = indicator.trailingAnchor.constraint(equalTo: sectionStack.arrangedSubviews[i].trailingAnchor)
            trailingAnchors.append(trailingAnchor)
        }

        let profileHeaderImageViewConstrants = [
            profileHeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderImageView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderImageView.heightAnchor.constraint(equalToConstant: 150)

        ]

        let profileAvatarImageViewConstrants = [
            profileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileAvatarImageView.centerYAnchor.constraint(equalTo: profileHeaderImageView.bottomAnchor, constant: 10),
            profileAvatarImageView.widthAnchor.constraint(equalToConstant: 80),
            profileAvatarImageView.heightAnchor.constraint(equalToConstant: 80)

        ]

        let displayNameLabelConstrants = [
            displayNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImageView.leadingAnchor),
            displayNameLabel.topAnchor.constraint(equalTo: profileAvatarImageView.bottomAnchor, constant: 20)
        ]

        let usernameLabelConstrants = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 5)
        ]


        let userBioLabelConstrants = [
            userBioLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            userBioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            userBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ]

        let joinDateImageViewConstrants = [
            joinDateImageView.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            joinDateImageView.topAnchor.constraint(equalTo: userBioLabel.bottomAnchor, constant: 5)
        ]

        let joinedDateLabelConstrants = [
            joinedDateLabel.leadingAnchor.constraint(equalTo: joinDateImageView.trailingAnchor, constant: 2),
            joinedDateLabel.bottomAnchor.constraint(equalTo: joinDateImageView.bottomAnchor)
        ]

        let followingCountLabelConstrants = [
            followingCountLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            followingCountLabel.topAnchor.constraint(equalTo: joinedDateLabel.bottomAnchor, constant: 10)
        ]

        let followingTextLabelConstrants = [
            followingTextLabel.leadingAnchor.constraint(equalTo: followingCountLabel.trailingAnchor, constant: 4),
            followingTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]

        let followersCountLabelConstrants = [
            followersCountLabel.leadingAnchor.constraint(equalTo: followingTextLabel.trailingAnchor, constant: 8),
            followersCountLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]

        let followersTextLabelConstants = [
            followersTextLabel.leadingAnchor.constraint(equalTo: followersCountLabel.trailingAnchor, constant: 4),
            followersTextLabel.bottomAnchor.constraint(equalTo: followingCountLabel.bottomAnchor)
        ]


        let sectionStackConstrants = [
            sectionStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            sectionStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            sectionStack.topAnchor.constraint(equalTo: followersTextLabel.bottomAnchor, constant: 5),
            sectionStack.heightAnchor.constraint(equalToConstant: 35)
        ]

        let indicatorConstrants = [
            leadingAnchors[0],
            trailingAnchors[0],
            indicator.topAnchor.constraint(equalTo: sectionStack.arrangedSubviews[0].bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 4)

        ]

        NSLayoutConstraint.activate(profileHeaderImageViewConstrants)
        NSLayoutConstraint.activate(profileAvatarImageViewConstrants)
        NSLayoutConstraint.activate(displayNameLabelConstrants)
        NSLayoutConstraint.activate(usernameLabelConstrants)
        NSLayoutConstraint.activate(userBioLabelConstrants)
        NSLayoutConstraint.activate(joinDateImageViewConstrants)
        NSLayoutConstraint.activate(joinedDateLabelConstrants)
        NSLayoutConstraint.activate(followingCountLabelConstrants)
        NSLayoutConstraint.activate(followingTextLabelConstrants)
        NSLayoutConstraint.activate(followersCountLabelConstrants)
        NSLayoutConstraint.activate(followersTextLabelConstants)
        NSLayoutConstraint.activate(sectionStackConstrants)
        NSLayoutConstraint.activate(indicatorConstrants)
    }


}
