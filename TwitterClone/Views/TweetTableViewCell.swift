//
//  TweetTableViewCell.swift
//  TwitterClone
//
//  Created by Haytham on 27/07/2023.
//

import UIKit

protocol TweetTableViewCellDelegate : AnyObject {

    func tweetTableViewCellDidTapReply   ()
    func tweetTableViewCellDidTapRetweet ()
    func tweetTableViewCellDidTapLike    ()
    func tweetTableViewCellDidTapShare   ()

}



class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"

    weak var delegate : TweetTableViewCellDelegate?

    private let actionSpacing: CGFloat = 60

    private let avatarImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .systemGray
        return imageView

    }()

    private let displayNameLabel : UILabel = {
        let displayName = UILabel()
        displayName.text = "Haytham Hany"
        displayName.font = .systemFont(ofSize: 18 ,weight: .bold )
        displayName.translatesAutoresizingMaskIntoConstraints = false
        return displayName
    }()

    private let usernameLabel : UILabel = {
        let username = UILabel()
        username.text = "@elrifay"
        username.textColor = .secondaryLabel
        username.font = .systemFont(ofSize: 16 , weight: .regular)
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()

    private let tweetTextContentLabel : UILabel = {
        let contentView = UILabel()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.numberOfLines = 0
        contentView.text = "This is my Mock-up tweet. it is going to make multiple lines. i believe some more text is enough but lets add some more anyway .. and cheers ..!!!"
        return contentView
    }()



    private let replyButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    private let retweetButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    private let likeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    private let shareButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)

        configureConstrants()
        configureButtons ()
    }


    @objc private func didTapReply(){
        delegate?.tweetTableViewCellDidTapReply()
    }
    @objc private func didTapRetweet(){
        delegate?.tweetTableViewCellDidTapRetweet()
    }
    @objc private func didTapLike(){
        delegate?.tweetTableViewCellDidTapLike()
    }
    @objc private func didTapShare(){
        delegate?.tweetTableViewCellDidTapShare()
    }


    private func configureButtons() {

        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
    }


    private func configureConstrants() {

        let avatarImageViewConstrants = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]

        let displayNameLabelConstrants = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ]

        let usernameLabelConstrants = [
            usernameLabel.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor, constant: 10),
            usernameLabel.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
        ]

        let tweetTextContentLabelConstrants = [
            tweetTextContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor),
            tweetTextContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor, constant: 10),
            tweetTextContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ]

        let replyButtonConstrants = [
            replyButton.leadingAnchor.constraint(equalTo: tweetTextContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetTextContentLabel.bottomAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]

        let retweetButtonConstrants = [
            retweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: actionSpacing),
            retweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor)
        ]

        let likeButtonConstrants = [
            likeButton.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: retweetButton.centerYAnchor)
        ]

        let shareButtonConstrants = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ]



        NSLayoutConstraint.activate(avatarImageViewConstrants)
        NSLayoutConstraint.activate(displayNameLabelConstrants)
        NSLayoutConstraint.activate(usernameLabelConstrants)
        NSLayoutConstraint.activate(tweetTextContentLabelConstrants)
        NSLayoutConstraint.activate(replyButtonConstrants)
        NSLayoutConstraint.activate(retweetButtonConstrants)
        NSLayoutConstraint.activate(likeButtonConstrants)
        NSLayoutConstraint.activate(shareButtonConstrants)

    }







    required init?(coder: NSCoder) {
        fatalError()
    }
}
