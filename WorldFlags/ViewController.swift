//
//  ViewController.swift
//  WorldFlags
//
//  Created by Felipe Gil on 2021-06-01.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        flags += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        title = "World Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        flags.sort()
    }


}
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailsViewController {
            vc.nameOfImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}


