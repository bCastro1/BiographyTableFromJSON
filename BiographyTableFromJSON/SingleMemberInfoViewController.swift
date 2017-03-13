//
//  ViewController.swift
//  BiographyTableFromJSON
//
//  Created by Brendan Castro on 3/13/17.
//  Copyright © 2017 Brendan Castro. All rights reserved.
//

import UIKit

class SingleMemberInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //popup transition effects
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        setupView()
    }
    
    //layer furthest in background
    let visualEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backLabel: UILabel = {
        let label = UILabel()
        label.text = "← Back"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dissmissView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.sizeThatFits(CGSize(width: 10, height: 10))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(SingleMemberInfoViewController.dismissPopup), for:.touchUpInside)
        return button
    }()
    
    var memberScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "notebook")!)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var memberImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var memberName: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var memberTitle: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var memberBio: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 0
        textView.text = "bio"
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.font = UIFont(name: (textView.font?.fontName)!, size: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    //foreground

    func setupView(){
        self.view.addSubview(visualEffectView)          //v0
        visualEffectView.addSubview(memberScrollView)   //v1
        memberScrollView.addSubview(memberImage)        //v2
        memberScrollView.addSubview(memberName)         //v3
        memberScrollView.addSubview(memberTitle)        //v4
        memberScrollView.addSubview(memberBio)          //v5
        visualEffectView.addSubview(backLabel)          //v6
        visualEffectView.addSubview(dissmissView)
        
        //blur effect on whole background screen
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":visualEffectView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]-0-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":visualEffectView]))
        
        
        //invisible button over blur effect
        let topConstraint = addNSLayoutConstraint(containingView: visualEffectView, attribute: .top, item: dissmissView)
        let bottomConstraint = addNSLayoutConstraint(containingView: visualEffectView, attribute: .bottom, item: dissmissView)
        let leftConstraint = addNSLayoutConstraint(containingView: visualEffectView, attribute: .left, item: dissmissView)
        let rightConstraint = addNSLayoutConstraint(containingView: visualEffectView, attribute: .right, item: dissmissView)
        visualEffectView.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
        
        //adding main popup view + back button label
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[v1]-25-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":memberScrollView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-25-[v6]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v6":backLabel]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[v6]-10-[v1]-75-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":memberScrollView, "v6":backLabel]))
        
        //image centered in top portion of popup
        memberScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v2]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":memberImage]))
        memberScrollView.addConstraint(addNSLayoutConstraint(containingView: memberImage, attribute: .centerX, item: memberScrollView))
        
        //name, title, bio all have same margin padding
        memberScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v3]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v3":memberName]))
 
        memberScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v4]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v4":memberTitle]))
 
        memberScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v5]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v5":memberBio]))

        //name, title, bio vertical spacing
        memberScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v2]-15-[v3]-15-[v4]-15-[v5]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2":memberImage, "v3":memberName, "v4":memberTitle,"v5":memberBio]))
        
    }
    
    //attempting to clean up long function call
    func addNSLayoutConstraint(containingView: Any, attribute: NSLayoutAttribute, item: Any) -> NSLayoutConstraint
    {
        var layoutConstraintToReturn = NSLayoutConstraint()
        layoutConstraintToReturn = NSLayoutConstraint(item: containingView, attribute: attribute, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: 0)
        return layoutConstraintToReturn
    }

    @IBAction func dismissPopup(_ sender: UIButton){
        dismiss(animated: true, completion: nil)

    }
}
