//
//  ViewController.swift
//  Dynamics
//
//  Created by Ethan Halprin on 18/04/2017.
//

import UIKit


class ViewController: UIViewController, UICollisionBehaviorDelegate
{
    var dynamicAnimator    : UIDynamicAnimator!
    var collisionBehavior  : UICollisionBehavior!
    var gravityBehavior    : UIGravityBehavior!
    var elasticityBehavior : UIDynamicItemBehavior!
    
    var drop1 : UIView!
    var drop2 : UIView!
    var drop3 : UIView!
    var drop4 : UIView!
    var drop5 : UIView!
    var drop6 : UIView!
    var drop7 : UIView!
    var drop8 : TRIView!

    @IBOutlet var fallButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var elasticityLabel: UILabel!
    @IBOutlet var elasticitySlider: UISlider!
    @IBOutlet var elasticityValue: UILabel!
    
    @IBOutlet var frictionLabel: UILabel!
    @IBOutlet var frictionSlider: UISlider!
    @IBOutlet var frictionValue: UILabel!
    
    @IBOutlet var resistanceLabel: UILabel!
    @IBOutlet var resistanceSlider: UISlider!
    @IBOutlet var resistanceValue: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 
        fallButton.layer.borderColor  = fallButton.titleLabel?.textColor?.cgColor
        fallButton.layer.borderWidth  = 2.0
        fallButton.layer.cornerRadius = 5.0

        resetButton.layer.borderColor  = resetButton.titleLabel?.textColor?.cgColor
        resetButton.layer.borderWidth  = 2.0
        resetButton.layer.cornerRadius = 5.0

        let unit: String = ""

        self.elasticityValue.text = String.localizedStringWithFormat("%.2f %@", self.elasticitySlider.value, unit)
        
        self.frictionValue.text = String.localizedStringWithFormat("%.2f %@", self.frictionSlider.value, unit)
        
        self.resistanceValue.text = String.localizedStringWithFormat("%.2f %@", self.resistanceSlider.value, unit)

        setViews()
    }
    internal func setViews()
    {
        //
        // Build Views
        //
        drop1 = UIView(frame:CGRect(x     : 10,
                                    y     : 220,
                                    width : 40,
                                    height: 70))
        drop1.backgroundColor = UIColor.yellow
        
        drop2 = UIView(frame:CGRect(x     : 60,
                                    y     : 220,
                                    width : 40,
                                    height: 40))
        drop2.backgroundColor = UIColor.brown
        circlize(view: drop2)
        
        drop3 = UIView(frame:CGRect(x     : 120,
                                    y     : 220,
                                    width : 40,
                                    height: 60))
        drop3.backgroundColor = UIColor.red
        
        drop4 = UIView(frame:CGRect(x     : 180,
                                    y     : 220,
                                    width : 40,
                                    height: 80))
        drop4.backgroundColor = UIColor.orange
        
        drop5 = UIView(frame:CGRect(x     : 250,
                                    y     : 220,
                                    width : 40,
                                    height: 40))
        drop5.backgroundColor = UIColor.blue
        circlize(view: drop5)

        drop6 = UIView(frame:CGRect(x     : 310,
                                    y     : 220,
                                    width : 40,
                                    height: 40))
        drop6.backgroundColor = UIColor.magenta
        
        drop7 = UIView(frame:CGRect(x     : 355,
                                    y     : 220,
                                    width : 15,
                                    height: 15))
        drop7.backgroundColor = UIColor.darkGray
        circlize(view: drop7)
        
        drop8 = TRIView(frame: CGRect(x: 260, y: 260, width: 50 , height: 50))
        drop8.backgroundColor = .clear
        //
        // addSubview
        //
        self.view.addSubview(drop1)
        self.view.addSubview(drop2)
        self.view.addSubview(drop3)
        self.view.addSubview(drop4)
        self.view.addSubview(drop5)
        self.view.addSubview(drop6)
        self.view.addSubview(drop7)
        self.view.addSubview(drop8)
    }
    func circlize(view : UIView!)
    {
        guard let _ = view else { return }
        
        view.layer.cornerRadius = view.frame.size.width/2
        view.clipsToBounds      = true
        view.layer.borderColor  = view.backgroundColor?.cgColor
        view.layer.borderWidth  = 5.0
    }
    func dropViews(elast: Float, fric: Float, resist: Float)
    {
        //
        // Append all views to a UIDynamicItem array (UIView naturally conforms to)
        //
        var dynamicItems : [UIDynamicItem] = []
        
        dynamicItems.append(drop1)
        dynamicItems.append(drop2)
        dynamicItems.append(drop3)
        dynamicItems.append(drop4)
        dynamicItems.append(drop5)
        dynamicItems.append(drop6)
        dynamicItems.append(drop7)
        dynamicItems.append(drop8)
        //
        // Set Beaviors
        //
        gravityBehavior = UIGravityBehavior(items: dynamicItems)

        collisionBehavior = UICollisionBehavior(items: dynamicItems)
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets.zero)
        collisionBehavior.collisionDelegate = self

        elasticityBehavior = UIDynamicItemBehavior(items: dynamicItems)
        elasticityBehavior?.elasticity = CGFloat(elast)
        elasticityBehavior?.friction   = CGFloat(fric)
        elasticityBehavior?.resistance = CGFloat(resist)
        //
        // Finally allocate UIDynamicAnimator & attach behaviors to it
        //
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicAnimator.addBehavior(gravityBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        dynamicAnimator.addBehavior(elasticityBehavior)
    }
    //
    // UICollisionBehaviorDelegate
    //
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint)
    {
        print("beganContactFor")
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?)
    {
        print("endedContactFor")
    }
    //
    // @IBActions
    //
    @IBAction func fallTouchUpInside(_ sender: UIButton)
    {
        dropViews(elast : elasticitySlider.value,
                  fric  : frictionSlider.value,
                  resist: resistanceSlider.value)
    }
    @IBAction func resetTouchUpInside(_ sender: UIButton)
    {
        dynamicAnimator    = nil
        collisionBehavior  = nil
        gravityBehavior    = nil
        elasticityBehavior = nil

        drop1.removeFromSuperview()
        drop2.removeFromSuperview()
        drop3.removeFromSuperview()
        drop4.removeFromSuperview()
        drop5.removeFromSuperview()
        drop6.removeFromSuperview()
        drop7.removeFromSuperview()
        drop8.removeFromSuperview()

        setViews()
    }
    @IBAction func elastSliderValChanged(_ sender: UISlider)
    {
        let value: Float = self.elasticitySlider.value
        let unit: String = ""
        
        self.elasticityValue.text = String.localizedStringWithFormat("%.2f %@", value, unit)
    }
    @IBAction func fricSliderValChanged(_ sender: UISlider)
    {
        let value: Float = self.frictionSlider.value
        let unit: String = ""
        
        self.frictionValue.text = String.localizedStringWithFormat("%.2f %@", value, unit)
    }
    @IBAction func resistSliderValChanged(_ sender: UISlider)
    {
        let value: Float = self.resistanceSlider.value
        let unit: String = ""
        
        self.resistanceValue.text = String.localizedStringWithFormat("%.2f %@", value, unit)
    }
}


