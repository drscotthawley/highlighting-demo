//
//  ViewController.swift
//  HighLightingDemo
//
//  Created by Scott Hawley on 9/2/15.
//  Copyright © 2015 Scott Hawley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myObjectView: UIImageView!
    
    
    @IBOutlet weak var myActionButton: UIButton!
    
    var highlighted = false
    var coverView : UIView!
    
    func getRealFrameForImage(view: UIImageView) -> CGRect {
        let aspect : CGFloat = CGFloat(view.image!.size.width) / view.image!.size.height
        
        let scaledHeight = view.frame.width / aspect
        let frame = CGRectMake(view.frame.minX, view.center.y - scaledHeight/2, view.frame.width, scaledHeight)
        return frame
    }
    func toggleHighlight(view: UIView) {
        highlighted = !highlighted
        
        if highlighted {  //make a new box
           // make a copy of the original image
            print("Making new view for hightlighting")
            coverView = UIView(frame: getRealFrameForImage(view as! UIImageView))
            coverView.backgroundColor = UIColor.blueColor()
            coverView.alpha = 0.5
            view.superview!.addSubview(coverView)
            view.setNeedsDisplay()
            coverView.setNeedsDisplay()
        } else {
            if nil != coverView {
                //coverView.alpha = 0.0
                coverView.removeFromSuperview()
            }
        }
    }
    
    
    
    @IBAction func myActionButtonPress(sender: AnyObject) {
        print("You pushed the button!")
        toggleHighlight(myObjectView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

