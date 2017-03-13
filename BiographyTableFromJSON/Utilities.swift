//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import Foundation
import UIKit

class MemberClass{
    static let sharedMemberInfo = MemberClass()
    var teamMember:[TeamInfoStruct] = []
}

var singleton = MemberClass.sharedMemberInfo

func resizeImageBasedOnParameterHeight(_ height: CGFloat, image: UIImage) ->UIImage?
{
    //new height based on the image view bounds
    //scale image to size of imageView
    let scale = height / image.size.height
    
    //new width based on the scale of height
    let newWidth = image.size.width * scale
    
    //making the new photo with new given height + width
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: height))
    image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: height))
    let newImageToDisplay = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImageToDisplay
}

func resizeImageBasedOnParameterWidth(_ width: CGFloat, image: UIImage) ->UIImage?
{
    //new width based on the image view bounds
    //scale image to size of imageView
    let scale = width / image.size.width
    
    //new height based on the scale of width
    let newHeight = image.size.height * scale
    
    //making the new photo with new given height + width
    UIGraphicsBeginImageContext(CGSize(width: width, height: newHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: width, height: newHeight))
    let newImageToDisplay = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImageToDisplay
}

