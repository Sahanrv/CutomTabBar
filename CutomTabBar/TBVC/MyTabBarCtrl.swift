//
//  MyTabBarCtrl.swift
//  CutomTabBar
//
//  Created by Sahan Ravindu on 5/13/20.
//  Copyright © 2020 Sahan Ravindu. All rights reserved.
//

import UIKit
import SwiftIcons

class MyTabBarCtrl: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
   }
    
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        
        let  btnView = UIView(frame: CGRect(x: (self.view.bounds.width / 2)-40, y: -30, width: 80, height: 90))
        btnView.backgroundColor = .clear
        btnView.layer.cornerRadius = 40
        btnView.clipsToBounds = true
        
        let middImg = UIImageView(frame: CGRect(x: 10, y: 0, width: 60, height: 60))
        middImg.image = #imageLiteral(resourceName: "ic_tb_home_add_post_active")
        middImg.contentMode = .scaleAspectFill
        

        let middleBtn = UIButton(frame: CGRect(x: 10, y: 0, width: 60, height: 60))
        
        let midLB = UILabel(frame: CGRect(x: 0, y: 62, width: 80, height: 20))
        midLB.text = "Add Post"
        midLB.font = UIFont(name: "Helvetica", size: 10)
        midLB.textAlignment = .center
        midLB.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        midLB.clipsToBounds = true
        midLB.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        //STYLE THE BUTTON YOUR OWN WAY
//        middleBtn.setImage(#imageLiteral(resourceName: "ic_tb_home_add_post_active"), for: .normal)
        
        
//        middleBtn.layer.shadowOffset = CGSize(width:5, height:5)
//        middleBtn.layer.shadowRadius = 5
//        middleBtn.layer.shadowColor = UIColor.black.cgColor
//        middleBtn.layer.shadowOpacity = 1.0
        
        
        middleBtn.layer.cornerRadius  = 30
        middleBtn.clipsToBounds = true
        
        middleBtn.backgroundColor = .clear
        
        //add to the tabbar and add click event
        btnView.addSubview(middImg)
        btnView.addSubview(middleBtn)
        btnView.addSubview(midLB)
        self.tabBar.addSubview(btnView)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: AddButtonViewController = storyboard.instantiateViewController(withIdentifier: "AddButtonViewController") as! AddButtonViewController

        vc.hidesBottomBarWhenPushed = true
        let navViewController = self.selectedViewController as? UINavigationController
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navViewController?.pushViewController(vc, animated: true)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "AddButtonViewController") as! AddButtonViewController
//        vc.modalPresentationStyle = .currentContext
//        self.present(vc, animated: true, completion: nil)
    }
    
    
}
