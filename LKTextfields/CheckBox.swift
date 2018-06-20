//CheckBox.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 20/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

@IBDesignable
class CheckBox: UIControl {
    
    @IBInspectable var text: String = "" {
        didSet{
            
        }
    }
    
    @IBInspectable var checkColor: UIColor = .blue {
        didSet{
            
        }
    }
    
    @IBInspectable var boxFillColor: UIColor = .blue {
        didSet{
            
        }
    }
    
    @IBInspectable var boxBorderColor: UIColor = .blue {
        didSet{
            
        }
    }
    
    @IBInspectable var labelTextColor: UIColor = .blue {
        didSet{
            
        }
    }
    
    @IBInspectable var labelFont: UIFont = .systemFont(ofSize: 12) {
        didSet{
            
        }
    }
    
    
    let not = (!)
    
    var isChecked: Bool = true {
        
        didSet{
           // self.draw(self.frame)
            self.setNeedsDisplay()
        }
        
    }
    var isEnableddd: Bool = true
    var showTextLabel: Bool = false
    
    var label: UILabel!
    var textIsSet: Bool = false
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    
    
    
    func setupViews() {
        
        self.backgroundColor = .clear

    }
    
    //Our code for drawing the control goes here
    override func draw(_ rect: CGRect) {
        
        boxFillColor.setFill()
        boxBorderColor.setStroke()
        
        if showTextLabel {
            
            if not(textIsSet) {
                
                label = UILabel.init(frame: CGRect(x: self.frame.size.width/4 + 5, y: 0, width: self.frame.size.width*3/4 - 5, height: self.frame.size.height))
                label.backgroundColor = .clear
                self.addSubview(label)
                textIsSet = true
                
            }
            label.font = labelFont
            label.textColor = labelTextColor
            label.text = text
            
            let boxPath = UIBezierPath.init(roundedRect: CGRect(x: 2, y: 2, width: self.frame.width - 4, height: self.frame.height - 4), cornerRadius: self.frame.width / 5)
            boxPath.lineWidth = 4.0
            
            boxPath.fill()
            boxPath.stroke()
            
            if isChecked {
                
                let checkPath = UIBezierPath.init()
                checkPath.lineWidth = 5
                checkPath.move(to: CGPoint(x: self.frame.width * (1/5), y: self.frame.height / 5))
                checkPath.addLine(to: CGPoint(x: self.frame.width/8, y: self.frame.height * (4/5)))
                checkPath.addLine(to: CGPoint(x: self.frame.width / 20, y: self.frame.height / 2))
                checkColor.setStroke()
                checkPath.stroke()
                
                
            }
            
        } else {
            
            let boxPath = UIBezierPath.init(roundedRect: CGRect(x: 2, y: 2, width: self.frame.width - 4, height: self.frame.height - 4), cornerRadius: self.frame.width / 5)
            boxPath.lineWidth = 4.0
            
            boxPath.fill()
            boxPath.stroke()
            
            if isChecked {
                
                let checkPath = UIBezierPath.init()
                checkPath.lineWidth = 5
                checkPath.move(to: CGPoint(x: self.frame.width * (4/5), y: self.frame.height / 5))
                checkPath.addLine(to: CGPoint(x: self.frame.width/2, y: self.frame.height * (4/5)))
                checkPath.addLine(to: CGPoint(x: self.frame.width / 5, y: self.frame.height / 2))
                checkColor.setStroke()
                checkPath.stroke()
                
                
            }
    
            
        }
        
        if isEnableddd {
            
            self.alpha = 1.0
            self.isUserInteractionEnabled = true
            
        } else {
            
            self.alpha = 0.6
            self.isUserInteractionEnabled = false
        }
        
        self.setNeedsDisplay()
        
    }
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        self.isChecked = not(isChecked)
        
        return true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
    
    
    
    
    
    
    
    
    
}
