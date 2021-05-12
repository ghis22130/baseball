//
//  ViewController.swift
//  CoreGraphicsPractice
//
//  Created by Jun Ho JANG on 2021/05/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var groundView: GroundView!
    @IBOutlet weak var batterView: BatterView!
    
    
    
    @IBAction func animationButton(_ sender: Any) {
        showBatterView()
        homeToFirst()
    }
    
    private var animator: UIViewPropertyAnimator?
    
    //                                    1루   2루  3루
    private var runners: [BatterView?] = [nil, nil, nil]
    private var groundViewObject = GroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showBatterView() {
        batterView.isHidden = false
        batterView.center = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
    }

    func homeToFirst() {
        batterView.isHidden = false
        let animation = CABasicAnimation(keyPath: "position")
        let firstBasePoint = CGPoint(x: self.groundView.frame.width / 2 + 120, y: self.groundView.frame.height / 2)
        animation.fromValue = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
        animation.toValue = firstBasePoint
        animation.duration = 1
        batterView.layer.add(animation, forKey: "position")
        batterView.center = firstBasePoint
    }
    
    func firstToSecond() {
        let animation = CABasicAnimation(keyPath: "position")
        let firstBasePoint = CGPoint(x: self.groundView.frame.width / 2 + 120, y: self.groundView.frame.height / 2)
        let secondBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 - 120)
        animation.fromValue = firstBasePoint
        animation.toValue = secondBasePoint
        animation.duration = 1
        batterView.layer.add(animation, forKey: "position")
        batterView.center = secondBasePoint
    }
    
    func secondToThird() {
        let animation = CABasicAnimation(keyPath: "position")
        let secondBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 - 120)
        let thirdBasePoint = CGPoint(x: self.groundView.frame.width / 2 - 120, y: self.groundView.frame.height / 2)
        animation.fromValue = secondBasePoint
        animation.toValue = thirdBasePoint
        animation.duration = 1
        batterView.layer.add(animation, forKey: "position")
        batterView.center = thirdBasePoint
    }
    
    func thirdToHome() {
        let animation = CABasicAnimation(keyPath: "position")
        let thirdBasePoint = CGPoint(x: self.groundView.frame.width / 2 - 120, y: self.groundView.frame.height / 2)
        let homeBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
        animation.fromValue = thirdBasePoint
        animation.toValue = homeBasePoint
        animation.duration = 1
        batterView.layer.add(animation, forKey: "position")
        batterView.center = homeBasePoint
        batterView.isHidden = true
    }
    
}



// One Batter Base Status

// [false, false, false]
// [true, false, false]
// [false, true, false]
// [false, false, true]


