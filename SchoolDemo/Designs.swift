//
//  Designs.swift
//  SchoolDemo
//
//  Created by Madhukar on 06/03/2020.
//  Copyright © 2020 sailaja. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}

@IBDesignable class ButtonWhatsapp : UIButton {

@IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
@IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
@IBInspectable var shadowOffsetWidth: Int = 0
 @IBInspectable var corner: CGFloat = 0
@IBInspectable var shadowOffsetHeight: Int = 1
@IBInspectable var shadowOpacity: Float = 0.3
override func didMoveToWindow() {
    
    self.layer.borderColor = startColor.cgColor
    self.layer.borderWidth = brderwidth
    self.layer.cornerRadius = corner
    self.layer.shadowColor = UIColor.darkGray.cgColor
    self.layer.shadowRadius = 5
    self.layer.shadowOpacity = 0.5
    self.layer.shadowOffset = CGSize(width:0, height:1)
    self.layer.masksToBounds = false
    self.imageView?.layer.cornerRadius = corner
   
}
}
@IBDesignable class ScocialMediaButtonRound : UIButton {
    
    @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
    @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
    
    override func didMoveToWindow() {
        
        self.layer.borderColor = startColor.cgColor
        self.layer.borderWidth = brderwidth
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width:0, height:1)
        self.layer.masksToBounds = false
        
    }
    
}
@IBDesignable class CircleCard : UIImageView {
    
    var circleLayer:CAShapeLayer!
   
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = layer.frame.size.width / 2
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        
    }
    
}

@IBDesignable class Card: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 13
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    
    @IBInspectable var shadowOpacity: Float = 0.3
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}

@IBDesignable
class AddProfilePictureView: UIButton {

    @IBInspectable var leftHandImage: UIImage? {
        didSet {
            leftHandImage = leftHandImage?.withRenderingMode(.alwaysOriginal)
            setupImages()
        }
    }
    @IBInspectable var rightHandImage: UIImage? {
        didSet {
            rightHandImage = rightHandImage?.withRenderingMode(.alwaysTemplate)
            setupImages()
        }
    }
    @IBInspectable var startColor:   UIColor = .white { didSet { didMoveToWindow() }}
       @IBInspectable var brderwidth:   CGFloat = 1 { didSet { didMoveToWindow() }}
       
       override func didMoveToWindow() {
           
           self.layer.borderColor = startColor.cgColor
           self.layer.shadowColor = UIColor.darkGray.cgColor
           self.layer.shadowRadius = 5
           self.layer.shadowOpacity = 1
           self.layer.shadowOffset = CGSize(width:0, height:1)
           self.layer.masksToBounds = false
           
       }
    func setupImages() {
        if let leftImage = leftHandImage {
            self.setImage(leftImage, for: .normal)
            self.imageView?.contentMode = .scaleAspectFill
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.frame.width - (self.imageView?.frame.width)!)
        }

        if let rightImage = rightHandImage {
            let rightImageView = UIImageView(image: rightImage)
            rightImageView.tintColor = UIColor.lightGray

            let height = self.frame.height / 4
            let width = height + 6
            let xPos = self.frame.width - width
            let yPos = (self.frame.height - height) / 2

            rightImageView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
            self.addSubview(rightImageView)
        }
    }
}
class profileSlideMenu : UITableViewCell{
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var profileImage: CircleCard!
    
}
