//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Wi on 12/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 피드데이터가 보여질 셀입니다.
// xib 파일에서 셀이 어떤식으로 생겼는지 확인해보세요.
// xib 방식은 선택사항입니다. 코드로 해보고 싶은 분들은 새롭게 코드로 구현해보세요.
class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedLabel: UILabel!
    
    // 데이터가 들어올 자리입니다.
    // 이 구현 방식은 선택사항입니다. 다르게 구현해도 괜찮습니다.
    var feedData: FeedData! {
        didSet {
        }
    }
    // 초기함수 입니다.
    // 프로필 이미지뷰를 동그랗게 만들어보세요.
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // 좋아요 버튼이 눌렸을때 호출될 함수 입니다.
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        print("like")
    }
    // 댓글 버튼이 눌렸을때 호출될 함수 입니다.
    // 힌트: HomeVC 에게 댓글 버튼이 눌렸다는걸 알려주세요
    @IBAction func commentButtonDidTap(_ sender: Any) {
        print("comment")

        
    }
    
    
}
