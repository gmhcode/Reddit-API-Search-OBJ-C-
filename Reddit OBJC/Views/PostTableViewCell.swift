//
//  PostTableViewCell.swift
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: DVMPost?{
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    
    
    func updateViews(){
        guard let post = post else {return}
        postTitleLabel.text = post.title
        upvotesLabel.text = "\(post.upVotes)"
        commentsLabel.text = "\(post.commentCount)"
        
        DVMPostController.fetchImage(with: post) { (image) in
            guard let image = image else {return};
            DispatchQueue.main.async {
                
                self.imageView?.image = image
            }
            
        }
        
    }
}
