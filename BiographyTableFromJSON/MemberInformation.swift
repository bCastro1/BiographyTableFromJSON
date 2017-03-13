//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import UIKit
import Foundation

struct TeamInfoStruct {
    //holding all of the member info
    var firstName = String()
    var lastName = String()
    var jobTitle = String()
    var bio = String()
    var identifier = Int()
    var avatar = String()
    
    init(firstName: String, lastName: String, jobTitle: String,
         bio: String, identifier: Int, avatar: String)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
        self.bio = bio
        self.identifier = identifier
        self.avatar = avatar
    }
}

func getTeamInformation()
{
    //json parse
    if let path = Bundle.main.path(forResource: "team", ofType: "json"){
        do {
            let data =  try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let jsonObject = JSON(data: data)
            if jsonObject != JSON.null {

                
                for index in 0 ... jsonObject.count-1{
                    let firstName = jsonObject[index]["firstName"].stringValue
                    let lastName = jsonObject[index]["lastName"].stringValue
                    let title = jsonObject[index]["title"].stringValue
                    let bio = jsonObject[index]["bio"].stringValue
                    let id = jsonObject[index]["id"].intValue
                    let avatar = jsonObject[index]["avatar"].stringValue
                    let newMemberInfo = TeamInfoStruct(firstName: firstName, lastName: lastName, jobTitle: title, bio: bio, identifier: id, avatar: avatar)
                    singleton.teamMember.append(newMemberInfo)
                }
                
            }
            else {
                print("couldnt get json from file")
            }
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    else {
        print("invalid filename/path")
    }
}

//could be more efficient
func getMemberAvatars(){
    for index in 0...singleton.teamMember.count-1
    {
        let url = URL(string: singleton.teamMember[index].avatar)
        let imageData = try? Data(contentsOf: url!)
        let image = UIImage(data: imageData!)
        ImageCache.shared[index as AnyObject] = image
    }
}



