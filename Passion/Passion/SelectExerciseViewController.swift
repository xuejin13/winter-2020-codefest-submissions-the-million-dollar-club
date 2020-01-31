//
//  SelectExerciseViewController.swift
//  Passion
//
//  Created by Xuejin Gao on 1/29/20.
//  Copyright © 2020 Xuejin Gao. All rights reserved.
//

import UIKit

class SelectExerciseViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let exercises = [
        "Dumbbell Bench Press",
        "Pushups",
        "Close-Grip Barbell Bench Press",
        "Dumbbell Flyes",
        "Incline Dumbbell Press",
        "Low Cable Crossover",
        "Barbell Bench Press - Medium Grip",
        "Dips - Chest Version",
        "Decline Dumbbell Flyes",
        "Bodyweight Flyes",
        "Incline Cable Flye",
        "Decline Barbell Bench Press",
        "Wide-Grip Barbell Bench Press",
        "Wide-Grip Decline Barbell Bench Press",
        "Incline Dumbbell Press Reverse-Grip"
    ]
    
    var searchWord = [String]()
    var isSearching = false
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectExerciseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = exercises.count
        if isSearching{
            count = searchWord.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell")!
        
        if isSearching{
            cell.textLabel!.text = searchWord[indexPath.row]
        }
        else{
            cell.textLabel!.text = exercises[indexPath.row]
        }
        
        return cell
    }
}

extension SelectExerciseViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWord = exercises.filter({$0.prefix(searchText.count) == searchText})
        isSearching = true
        tbView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tbView.reloadData()
    }
}
