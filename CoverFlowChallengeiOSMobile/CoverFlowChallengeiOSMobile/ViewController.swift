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
    
    var startIndex = 0
    
    // MARK: - Life Cycle View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        startIndex = centerImage(arr: namesImages, element: namesImages.count / 2, right: nil)
        print(startIndex)
        centerImage.image = UIImage(named: namesImages[namesImages.count / 2])
        
        transform3D(left: true, for: leftImage)
        transform3D(left: false, for: rightImage)
        updateUIElements()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

        rightView.addGestureRecognizer(tap)
        rightView.isUserInteractionEnabled = true
        self.view.addSubview(rightView)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        startIndex = centerImage(arr: namesImages, element: startIndex, right: true)
        let elemenInArray = startIndex

        leftImage.image = UIImage(named: namesImages[elemenInArray])
        centerImage.image = UIImage(named: namesImages[elemenInArray + 1])
        
        if elemenInArray + 2 != namesImages.count {
            rightImage.image = UIImage(named: namesImages[elemenInArray + 2])
        } else {
            updateUIElements()
        }
    }
    
    func updateUIElements() {
        if centerImage.image == UIImage(named: namesImages.first!) {
            leftView.isHidden = true
        } else if centerImage.image == UIImage(named: namesImages.last!) {
            rightView.isHidden = true
        }
    }

    func transform3D(left: Bool, for image: UIImageView) {
        let direction: Double
        if left {
            direction = -1.0
        } else {
            direction = 1.0
        }
        
        var transform3D = CATransform3DIdentity
        transform3D.m34 = direction / 1000
        transform3D = CATransform3DRotate(transform3D, CGFloat(M_PI) / 5, 0, 1, 0)

        UIView.animate(withDuration: 1.5, animations: {

            image.layer.transform = transform3D

        })
    }
    
    // MARK: Helper Methods
    func centerImage(arr: [String], element: Int, right: Bool?) -> Int {
        if element == arr.count {
            return element
        }
        
        var result = element
        
        switch right {
        case true: result += 1
        case false: result -= 1
        default: return result
        }
        
        return result
    }
}

