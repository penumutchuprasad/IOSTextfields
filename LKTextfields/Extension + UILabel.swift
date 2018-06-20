//Extension + UILabel.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 20/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

extension UILabel {
    
    
    func dynamicHeight() -> CGFloat {
        let label = UILabel(frame: self.bounds)
        label.numberOfLines = self.numberOfLines
        label.lineBreakMode = self.lineBreakMode
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.size.height
    }
    
    func requiredWidth() -> CGFloat {
        
        let estimatedSize = CGSize.init(width: 1000, height: self.frame.height)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let str = self.text
        
        let estimatedRect = NSString.init(string: str!).boundingRect(with: estimatedSize, options: options, attributes: [NSAttributedStringKey.font : self.font], context: nil)
        
        return estimatedRect.width
        
    }
    
    
    func requiredHeight() -> CGFloat {
        
        let estimatedSize = CGSize.init(width: self.bounds.width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let str = self.text
        
        let estimatedRect = NSString.init(string: str!).boundingRect(with: estimatedSize, options: options, attributes: [NSAttributedStringKey.font : self.font], context: nil)
        
        return estimatedRect.height
        
    }
    
    
    
    
    
}


extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }

    
}
