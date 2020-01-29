//
//  PersonalViewController.swift
//  Passion
//
//  Created by Xuejin Gao on 1/21/20.
//  Copyright © 2020 Xuejin Gao. All rights reserved.
//

import UIKit
import Parse

import AlamofireImage
import Alamofire

class PersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let user = PFUser.current()
        nameField.text = user?.username
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        delegate.window?.rootViewController = loginViewController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "PersonalPost")
        
//        query.whereKey("author", equalTo: PFUser.current()!)
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
        
//        print(query)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalPostCell") as! PersonalCellTableViewCell
        
        let post = posts[indexPath.row]
        
        let date = post["date"] as! String
        cell.dateLabel.text = date
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        let caption = post["caption"] as! String
        cell.captionLabel.text = caption
        
//        print(caption)
//        print(url)
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
