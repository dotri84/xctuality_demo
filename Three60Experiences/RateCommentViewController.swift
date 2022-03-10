//
//  RateCommentViewController.swift
//  Three60Experiences
//
//  Created by Tri Do on 06/03/2022.
//

import UIKit

class RateCommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbView: UITableView?
    @IBOutlet weak var commentTextField: UITextField?
    
    var comments = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if indexPath.row < comments.count {
            cell.textLabel?.text = comments[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    @IBAction func addComment(_ sender: UIButton) {
        if let text = commentTextField?.text, !text.isEmpty {
            comments.append(text)
        }
        commentTextField?.text = ""
        tbView?.reloadData()
        commentTextField?.resignFirstResponder()
    }
}
