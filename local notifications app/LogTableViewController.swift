//
//  TableViewController.swift
//  local notifications app
//
//  Created by admin on 23/12/2021.
//

import UIKit

class LogTableViewController: UITableViewController {
    
    var timer: MyTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timer?.timers.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        guard let timer = timer else {
            return cell
        }
        cell.textLabel?.text = timer.getTimerDetails(at: indexPath.row)
        return cell
    }

}
