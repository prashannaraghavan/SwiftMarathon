//
//  ViewController.swift
//  TableController
//
//  Created by Prashanna Raghavan on 7/27/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView?
    
    let artist = ["Taylor Swift","Selena Gomez","Ed Sheeran","Coldplay","Chainsmokers"]
    let songs = ["Blank Space","Bad Liar","Shape of You","Scientist","Closer"]
    
    let singles = ["Taylor Swift":"Blank Space","Selena Gomez":"Bad Liar","Ed Sheeran":"Shape of You","Coldplay":"Scientist","Chainsmokers":"Closer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview?.backgroundColor = UIColor.black
        tableview?.separatorColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Singles"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle", for: indexPath) as? CustomTableViewCell
        cell?.setCell(artist: artist[indexPath.row], song: songs[indexPath.row])
        return cell!
    }

}

