//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import UIKit

class MainDisplayTableViewController: UITableViewController {
    
    var userPictureLinks: [String] = []
    var userPictures: [UIImage] = []
    var thumbnailPictures:[UIImage] = []
    var detailedMemberPictures:[UIImage] = []
    let singleMemberViewController = SingleMemberInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Member Biographies"
        tableView.register(TeamMemberCell.self, forCellReuseIdentifier: "teamMemberCell")
        //getMemberAvatars()
        print("teammeber: count: :: \(singleton.teamMember.count)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton.teamMember.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "teamMemberCell", for: indexPath) as! TeamMemberCell
        cell.nameLabel.text = singleton.teamMember[indexPath.row].firstName
        cell.titleLabel.text = singleton.teamMember[indexPath.row].jobTitle
        //cell.memberImage.image = thumbnailPictures[indexPath.row]
        cell.memberImage.downloadedFrom(link: singleton.teamMember[indexPath.row].avatar)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        singleMemberViewController.memberImage.downloadedFrom(link: singleton.teamMember[indexPath.row].avatar)
        singleMemberViewController.memberName.text = "\(singleton.teamMember[indexPath.row].firstName) \(singleton.teamMember[indexPath.row].lastName)"
        singleMemberViewController.memberTitle.text = "\(singleton.teamMember[indexPath.row].jobTitle)"
        singleMemberViewController.memberBio.text = "\(singleton.teamMember[indexPath.row].bio)"
        self.present(singleMemberViewController, animated: true, completion: nil)
    }
    
}


