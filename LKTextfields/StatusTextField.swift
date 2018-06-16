//StatusTextField.swift
/*
 * LKTextfields
 * Created by penumutchu.prasad@gmail.com on 16/06/18
 * Is a product created by abnboys
 * For the LKTextfields in the LKTextfields
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

@IBDesignable
public class StatusTextField: UITextField {
    
    
    @IBInspectable  public var defaultColor: UIColor = .black {
        
        didSet{
            
            
        }
        
    }
    
    
    @IBInspectable public var activeColor: UIColor = .blue {
        
        didSet{
            
            
        }
        
    }
    
    
    lazy var bottomLine: CALayer = {
        let layer = CALayer()
        layer.borderColor = self.defaultColor.cgColor
        layer.borderWidth = 1.0
        return layer
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    
    // MARK: Public functions
    public func showErrorHint() {
        rightImageView.image = #imageLiteral(resourceName: "wrng")
        self.rightView = rightImageView
        
    }
    
    public func showCorrectHint() {
        rightImageView.image = #imageLiteral(resourceName: "corct")
        self.rightView = rightImageView
    }
    
    public func clearHint() {
        rightImageView.image = nil
        self.rightView = rightImageView
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setRightImageViewBounds()
        setBottomLineFrame()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupViews()
    }
    
    
    public override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        self.bottomLine.borderColor = activeColor.cgColor
        return true
    }
    
    public override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        self.bottomLine.borderColor = defaultColor.cgColor
        return true
    }
    
    // MARK: Private functions
    private func setBottomLineFrame() {
        
        let x: CGFloat = 0
        let y: CGFloat = self.bounds.height  - 1
        let width: CGFloat = self.bounds.width - (self.rightView?.bounds.width ?? 0)
        let height: CGFloat = 1.0
        
        bottomLine.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func setRightImageViewBounds() {
        let width: CGFloat = self.bounds.height * 0.75
        let height: CGFloat = width
        rightImageView.bounds = CGRect(x: 0, y: 0, width: width, height: height)
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
        
        self.rightViewMode = .always
        self.clearHint()
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.tintColor = #colorLiteral(red: 1, green: 0.5687396455, blue: 0.7875213163, alpha: 1)
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        
    }
    
    
    
}
