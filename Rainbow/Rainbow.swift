import Foundation

import UIKit
// renders the DrawRect in the View
@IBDesignable
//creates class Rainbow
class Rainbow: UIView {
    
    
    //@IBInspectable - renders the image directly on the main storyboard
    //var - creates an instance of a color pallet using UIColor and sets it to a UIColor pallet via a specified range
    @IBInspectable var firstColor: UIColor = UIColor(red: (37.0/255.0), green: (252.0/255), blue: (244.0/255.0), alpha: 1.0)
    @IBInspectable var secondColor: UIColor = UIColor(red: (171.0/255.0), green: (250.0/255), blue: (81.0/255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (238.0/255.0), green: (32.0/255), blue: (53.0/255.0), alpha: 1.0)
    @IBInspectable var fourthColor: UIColor = UIColor (red: (255.0/0.0), green: (0.0/0.0), blue: (0.0/0.0), alpha: 1.0)
    @IBInspectable var fifthColor: UIColor = UIColor.purpleColor()
    @IBInspectable var sixthColor: UIColor = UIColor.blueColor()
    @IBInspectable var seventhColor: UIColor = UIColor.whiteColor()
    @IBInspectable var eighthColor: UIColor = UIColor (red: (0.0/0.0), green: (255.0/255.0), blue: (0.0/0.0), alpha: 1.0)
    @IBInspectable var ninthColor: UIColor = UIColor.greenColor()
    @IBInspectable var tenthColor: UIColor = UIColor.yellowColor()
    
    
    
    //allow to be seen in the inspector panel
    @IBInspectable var firstCircle: CGFloat = 10
    @IBInspectable var secondCircle: CGFloat = 50
    @IBInspectable var thirdCircle: CGFloat = 90
    @IBInspectable var fourthCircle: CGFloat = 130
    @IBInspectable var fifthCircle: CGFloat = 170
    @IBInspectable var sixthCircle: CGFloat = 210
    @IBInspectable var seventhCircle: CGFloat = 250
    @IBInspectable var eighthCircle: CGFloat = 290
    @IBInspectable var ninthCircle: CGFloat = 330
    @IBInspectable var tenthCircle: CGFloat = 370
    
    
    //?
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    //?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    //?
    override func drawRect(rect: CGRect) {
       
        
        //adds ARC's (arc radius, arc cap radius and color)
        self.addCirle(firstCircle, capRadius: 0, color: self.firstColor)
        self.addCirle(secondCircle, capRadius: 10, color: self.secondColor)
        self.addCirle(thirdCircle, capRadius: 20, color: self.thirdColor)
        self.addCirle(fourthCircle, capRadius: 30, color: self.fourthColor)
        self.addCirle(fifthCircle, capRadius: 40, color: self.fifthColor)
        self.addCirle(sixthCircle, capRadius: 50, color: self.sixthColor)
        self.addCirle(seventhCircle, capRadius: 60, color: self.seventhColor)
        self.addCirle(eighthCircle, capRadius: 70, color: self.eighthColor)
        self.addCirle(ninthCircle, capRadius: 80, color: self.ninthColor)
        self.addCirle(tenthCircle, capRadius: 90, color: self.tenthColor)
    }
    
        //adds circle/arc dimentions and bounds using the X and Y coordinate plane
        func addCirle(arcRadius: CGFloat, capRadius: CGFloat, color: UIColor) {
            let x = CGRectGetMidX(self.bounds)
            let y = CGRectGetMidY(self.bounds)
        
        //All parts of the circles are created using the strokeColor and strokeFill commands
        
        //creates bottom oval/semi-circle using UIBezierPath and it's necessary dimentional parameters
        let pathBottom = UIBezierPath(ovalInRect: CGRectMake((x - (arcRadius/2)), (y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathBottom, strokeStart: 0, strokeEnd: 0.5, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
        //creates end-cap oval/semi-circle using UIBezierPath and it's necessary dimentional parameters
        let pathMiddle = UIBezierPath(ovalInRect: CGRectMake((x - (capRadius/2)) - (arcRadius/2), (y - (capRadius/2)), capRadius, capRadius)).CGPath
        self.addOval(0.0, path: pathMiddle, strokeStart: 0, strokeEnd: 1.0, strokeColor: color, fillColor: color, shadowRadius: 5.0, shadowOpacity: 0.5, shadowOffsset: CGSizeZero)
        
        //TOP OVAL
        let pathTop = UIBezierPath(ovalInRect: CGRectMake((x - (arcRadius/2)), (y - (arcRadius/2)), arcRadius, arcRadius)).CGPath
        self.addOval(20.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color, fillColor: UIColor.clearColor(), shadowRadius: 0, shadowOpacity: 0, shadowOffsset: CGSizeZero)
        
    }
    //?
    func addOval(lineWidth: CGFloat, path: CGPathRef, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor, fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize) {
        //?
        
        let arc = CAShapeLayer()
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.CGColor
        arc.fillColor = fillColor.CGColor
        arc.shadowColor = UIColor.blackColor().CGColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        layer.addSublayer(arc)
    
    }

}