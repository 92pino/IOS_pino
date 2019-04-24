//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by JinBae Jeong on 17/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate: class {
    func feedCell(_ comment: FeedTableViewCell, didTapAddButton: UIButton)
}

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var commetViewController: UIButton!
    weak var delegate: FeedTableViewCellDelegate?
    
    var model: FeedData! {
        didSet {
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickNameLabel.text = self.model.nickName
            feedImageView.image = UIImage(named: self.model.feedImage!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        // AppImageView
//        feedImageView.image = UIImage(named: AppImageData.profile + "\(1)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    @IBAction func commentButton(_ sender: UIButton) {
        delegate?.feedCell(self, didTapAddButton: sender)
    }
    
}
