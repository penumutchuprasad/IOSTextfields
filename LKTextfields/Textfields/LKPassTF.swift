//LKPassTF.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 16/09/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

@IBDesignable
class LKPassTF: UITextField {
    
    private var showAndHideButton = UIButton.init(type: .custom)
    
    @IBInspectable var passwordRightImage: UIImage = #imageLiteral(resourceName: "wrng") {
        
        didSet{
            self.showAndHideButton.setImage(passwordRightImage, for: .normal)
            self.showAndHideButton.setImage(passwordRightImage, for: .highlighted)
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupViews()
    }
    
    private func setupViews() {
        
        self.rightViewMode = .always
        self.showAndHideButton.setImage(passwordRightImage, for: .normal)
        self.showAndHideButton.setImage(passwordRightImage, for: .highlighted)

        self.showAndHideButton.addTarget(self, action: #selector(onShowAndHide(sender:)), for: .touchUpInside)
        self.rightView = showAndHideButton
        self.showAndHideButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        self.rightView?.backgroundColor = .gray
        self.showAndHideButton.imageView?.tintColor = .blue

    }
    
    @objc private func onShowAndHide(sender: UIButton) {
        
        self.isSecureTextEntry = !(self.isSecureTextEntry)
        
    }
    
   
}
