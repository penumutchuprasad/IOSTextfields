//VC2.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 20/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class VC2: UIViewController {
    
    
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        imgView1.image = #imageLiteral(resourceName: "wrng").resizedImage(newSize: imgView1.frame.size)
//        imgView2.image = #imageLiteral(resourceName: "wrng").resizedImage(newSize: imgView2.frame.size)
//        imgView3.image = #imageLiteral(resourceName: "wrng").resizedImage(newSize: imgView3.frame.size)
        
        imgView1.image = #imageLiteral(resourceName: "corct").resizedImageWithinRect(rectSize: imgView1.frame.size)
        imgView2.image = #imageLiteral(resourceName: "corct").resizedImageWithinRect(rectSize: imgView2.frame.size)
        imgView3.image = #imageLiteral(resourceName: "corct").resizedImageWithinRect(rectSize: imgView3.frame.size)

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
