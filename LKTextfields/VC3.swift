//VC3.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 20/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class VC3: UIViewController {
    
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



        lbl1.text = "jfjksdfb bfefewge ewrgewurerteytre dvfgda gfgdfa effcfeuqwiewqo bjckbcjkaf dfdhgfhjda shagfhjdgfyeuaw dbdsajfgahjgf ahjfghjadfg"

//        lbl2.text = "scbb sahs hasdhas jhsdghja jhsdghjsdg shjagdhjgd jahsgdhjsgdhj jahsgdhjs jadghsjdghs jgyewryu dfdjshf wjeiwr ashduewyruet okdosklfdkvfjgg euryeuwirtyutr eyryeuwqtredabhj hefgfgja shjfgjfg yfyueyurtywqr wyewuirewoofwdjsnd sdgweryewtruyw"
        
        lbl2.text = "This is my label sfjkf jkffjkf fgegfekw fgEGFEGW EFEJ"

        print(lbl1.dynamicHeight())
        print(lbl2.requiredHeight())
        
        let desc = "fjkewfke kejrewgre ieuriewru eryuewtre r bchdjshdjs hefghj shdh wrgqqe aduwefg wehfwh egorkg edbwfgb"

        let myLbl = UILabel()
        myLbl.text = desc
        myLbl.numberOfLines = 0
        myLbl.backgroundColor = .yellow
        myLbl.font = UIFont.boldSystemFont(ofSize: 12)
        myLbl.frame = CGRect(x: 20, y: 500, width: self.view.frame.width-40, height: desc.height(withConstrainedWidth: self.view.frame.width-40, font: myLbl.font))
        
        view.addSubview(myLbl)

    }

}
