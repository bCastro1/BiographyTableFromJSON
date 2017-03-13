//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import UIKit

class TeamMemberCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var memberImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var memberInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var memberPictureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    func setupViews(){
        
        addSubview(memberInfoView)
        addSubview(memberPictureView)
        memberInfoView.addSubview(nameLabel)
        memberInfoView.addSubview(titleLabel)
        memberPictureView.addSubview(memberImage)
        
        //picture thumbnail view on left and member info view on right
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[v1(80)]-5-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":memberInfoView,"v1":memberPictureView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":memberInfoView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[v1]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":memberPictureView]))
        
        //name and title with thumbnail padding
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":titleLabel]))
        
        // 80x80 image taking up whole thumbnail view
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v2]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":memberImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v2]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":memberImage]))
        
        //name slightly above title
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":titleLabel]))
    }

}
