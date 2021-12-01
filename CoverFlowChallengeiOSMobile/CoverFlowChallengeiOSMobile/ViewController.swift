//
//  ViewController.swift
//  CoverFlowChallengeiOSMobile
//
//  Created by Ilya Shpilko on 12/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var centerImage: UIImageView!
    
    var namesImages = ["gorillaz-plasticbeach", "ironmaiden-thefinalfrontier", "kidrock-bornfree", "kingsofleon-comearoundsunshine", "lilwayne-iamnotahumanbeing", "maroon5-handsallover", "mychemicalromance-dangerdays", "order of the black - black label society", "recovery-recovery", "screenshot", "taylorswift-speaknow", "thebandperry-thebandperry", "usher-raymondvraymond", "weezer-hurley"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerImage.image = UIImage(named: namesImages.last!)
        
        if centerImage.image == UIImage(named: namesImages.first!) {
            leftView.isHidden = true
        } else if centerImage.image == UIImage(named: namesImages.last!) {
            rightView.isHidden = true
        }
    }


}

