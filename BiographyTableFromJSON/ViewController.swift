//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import UIKit

class MainDisplayTableViewController: UITableViewController {
    
    var thumbnailPictures:[UIImage] = []
    var detailedMemberPictures:[UIImage] = []
    let singleMemberViewController = SingleMemberInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Member Biographies"
        tableView.register(TeamMemberCell.self, forCellReuseIdentifier: "teamMemberCell")
        getMemberAvatars()
        
        //cropping images for future use
        resizeThumbnailPictures()
        resizeMemberInfoPictures()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton.teamMember.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "teamMemberCell", for: indexPath) as! TeamMemberCell
        cell.nameLabel.text = singleton.teamMember[indexPath.row].firstName
        cell.titleLabel.text = singleton.teamMember[indexPath.row].jobTitle
        cell.memberImage.image = thumbnailPictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        singleMemberViewController.memberImage.image = self.detailedMemberPictures[indexPath.row]
        singleMemberViewController.memberName.text = "\(singleton.teamMember[indexPath.row].firstName) \(singleton.teamMember[indexPath.row].lastName)"
        singleMemberViewController.memberTitle.text = "\(singleton.teamMember[indexPath.row].jobTitle)"
        singleMemberViewController.memberBio.text = "\(singleton.teamMember[indexPath.row].bio)"
        self.present(singleMemberViewController, animated: true, completion: nil)
    }
    
    func resizeThumbnailPictures()
    {
        for index in 0...singleton.teamMember.count-1
        {
            var resizedImage = UIImage()
            resizedImage = resizeImageBasedOnParameterHeight(80, image: ImageCache.shared[index as AnyObject]!)!
            thumbnailPictures.append(resizedImage)
        }
    }
    
    func resizeMemberInfoPictures()
    {
        let memberPictureBasedOnScreenSize = self.view.frame.width - 120
        for index in 0...singleton.teamMember.count-1
        {
            var resizedImage = UIImage()
            resizedImage = resizeImageBasedOnParameterHeight(memberPictureBasedOnScreenSize, image: ImageCache.shared[index as AnyObject]!)!
            detailedMemberPictures.append(resizedImage)
        }
    }
}


