//AnimaTF.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 17/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

@IBDesignable
public class AnimaTF: UITextField {
    
    
    
    public lazy var textFieldImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.height * 0.75, height: self.bounds.height * 0.75))
    
    @IBInspectable var textFieldImage: UIImage? {
        didSet {
            textFieldImageView.image = textFieldImage!
        }
    }

    @IBInspectable var activeColour: UIColor? {
        didSet{
            
        }
    }
    @IBInspectable var inactiveColour: UIColor? {
        didSet{
            
        }
    }
   
    
    @IBInspectable var imageWidth: NSNumber? {
        didSet {
            textFieldImageView.frame.size.width = CGFloat(exactly: imageWidth!)!
        }
    }
    @IBInspectable var imageHeight: NSNumber? {
        didSet {
            textFieldImageView.frame.size.height = CGFloat(exactly: imageHeight!)!
        }
    }
    
    private var edgePadding: CGFloat!
    
    
    //called after init, when the rect of the textfield is being drawing
    override public func draw(_ rect: CGRect) {
        
        //Default corner radius
//        self.borderStyle = UITextBorderStyle.line
//        self.textAlignment = NSTextAlignment.center
        
        //set image rendering mode so we can change colour of vector
        if textFieldImageView.image != nil {
            textFieldImageView.image = textFieldImageView.image!.withRenderingMode(.alwaysTemplate)
        }else {
            print("AnimatedTextField -- Image Not Set")
        }
        
        //initial colour
        if inactiveColour != nil {
            textFieldImageView.tintColor = inactiveColour
        }else {
            textFieldImageView.tintColor = self.tintColor
        }
        
        
        //Remove placeholder text because the placeholder is an image
        self.placeholder = ""
        
    }
    

    public override func textRect(forBounds bounds: CGRect) -> CGRect {

        let padding: CGFloat = self.bounds.height * 0.75

        return CGRect(x: (padding + (self.edgePadding * 2)), y: self.bounds.maxY - padding, width: self.frame.width - padding, height: self.bounds.height+padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding: CGFloat = self.bounds.height * 0.75

        return CGRect(x: (padding + (self.edgePadding * 2)), y: self.bounds.maxY - padding, width: self.frame.width - padding, height: self.bounds.height+padding)

    }
    

    
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        
    }
    
    
    convenience init() {
        self.init(frame: .zero)
        setupViews()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    func setupViews() {
//        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        self.edgePadding = (self.bounds.height - (self.bounds.height * 0.75)) / 2
        
        //add uiimageview which was initialized in init?()
        self.addSubview(textFieldImageView)
        //set the center of the uiimageview to self
        textFieldImageView.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)

        callDelegateFuncs()

    }
    
    func callDelegateFuncs() {
        
        self.addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
        
    }
    
    
    @objc func didBeginEditing() {
        //on edit run animation
        
        if self.text == nil || self.text == "" {
            
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.textFieldImageView.center = CGPoint(x: (((self.bounds.height * 0.75) / 2) + self.edgePadding), y: self.bounds.height / 2)
                if self.activeColour != nil {
                    //make sure active colour is set
                    self.textFieldImageView.tintColor = self.activeColour
                }else {
                    self.textFieldImageView.tintColor = self.tintColor
                }
            }) { (success: Bool) -> Void in
            }
            
        } else {
            
            self.textFieldImageView.center = CGPoint(x: (((self.bounds.height * 0.75) / 2) + self.edgePadding), y: self.bounds.height / 2)
            if self.activeColour != nil {
                //make sure active colour is set
                self.textFieldImageView.tintColor = self.activeColour
            }else {
                self.textFieldImageView.tintColor = self.tintColor
            }
            
        }
        
    }
    
   @objc func didEndEditing() {

        if !self.text!.isEmpty {
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                
                if self.inactiveColour != nil {
                    self.textFieldImageView.tintColor = self.inactiveColour
                }else {
                    self.textFieldImageView.tintColor = UIColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
                }
                
            }) { (success: Bool) -> Void in
                //done
                
            }
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.textFieldImageView.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
                if self.inactiveColour != nil {
                    self.textFieldImageView.tintColor = self.inactiveColour
                }else {
                    self.textFieldImageView.tintColor = UIColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
                }
            }) { (success: Bool) -> Void in
                //done
            }
        }
    }

    
    
}
