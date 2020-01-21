//
//  PersonalViewController.swift
//  Passion
//
//  Created by Xuejin Gao on 1/21/20.
//  Copyright © 2020 Xuejin Gao. All rights reserved.
//

import UIKit
import Parse

class PersonalViewController: UIViewController {

    @IBOutlet weak var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let user = PFUser.current()
        nameField.text = user?.username
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
