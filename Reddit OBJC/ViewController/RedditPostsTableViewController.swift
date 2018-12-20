//
//  RedditPostsTableViewController.swift
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class RedditPostsTableViewController: UITableViewController {
    
    @IBOutlet weak var postSearchBar: UISearchBar!
    
    var posts: [DVMPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postSearchBar.delegate = self
        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
        cell.post = post
        // Configure the cell...

        return cell
    }
    

    

}


extension RedditPostsTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hit")
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {return}
        
        DVMPostController.fetchAllPostsForSubreddit(withTitle: searchText) { (posts) in
            guard let posts = posts else {return}
            
            DispatchQueue.main.async {
                
                self.posts = posts
                self.tableView.reloadData()
                
            }
            
        }
    }
}
