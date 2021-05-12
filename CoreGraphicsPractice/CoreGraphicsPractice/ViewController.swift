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
        let batterView = BatterView.init(frame: CGRect(origin: groundView.bounds.origin, size: CGSize(width: 24, height: 24)))
        self.groundView.addSubview(batterView)
        batterView.center = basePoint?[0] ?? CGPoint()
        
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, options: [], animations: {
            self.move(runner: batterView)
        }, completion: { _ in
            self.movingRunners()
        })
        
    }
    
    private var animator: UIViewPropertyAnimator?
    
    //                                    홈   1루   2루  3루
    private var runners: [BatterView?] = [nil, nil, nil, nil]
    private var groundViewObject = GroundView()
    
    private var basePoint: [CGPoint]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setBasePoint()
    }
    
    
    func setBasePoint() {
        basePoint = [ CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120),
                      CGPoint(x: self.groundView.frame.width / 2 + 120, y: self.groundView.frame.height / 2),
                      CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 - 120),
                      CGPoint(x: self.groundView.frame.width / 2 - 120, y: self.groundView.frame.height / 2)
        ]
    }
    


    
    func move(runner: BatterView) {
        runners[0] = runner
        runners.enumerated().filter {
            $0.element != nil
        }.forEach { base, runner in
            movingAnimation(index: base, runner: runner)
        }
    }
    
    func movingAnimation(index: Int, runner: BatterView?) {
        runner?.center = basePoint?[(index+1)%4] ?? CGPoint()
    }
    
    func movingRunners() {
        for i in stride(from: 3, to: -1, by: -1){
            guard runners[i] != nil else { continue }
            if i == 3 {
                runners[i]?.removeFromSuperview()
                runners[i] = nil
            } else {
                runners[i+1] = runners[i]
                runners[i] = nil
            }
        }
    }
    
    
//    func showBatterView() {
//        batterView.isHidden = false
//        batterView.center = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
//    }
    
//    func homeToFirst() {
//        batterView.isHidden = false
//        let animation = CABasicAnimation(keyPath: "position")
//        let firstBasePoint = CGPoint(x: self.groundView.frame.width / 2 + 120, y: self.groundView.frame.height / 2)
//        animation.fromValue = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
//        animation.toValue = firstBasePoint
//        animation.duration = 1
//        batterView.layer.add(animation, forKey: "position")
//        batterView.center = firstBasePoint
//        print(batterView.center)
//    }
//
//    func firstToSecond() {
//        let animation = CABasicAnimation(keyPath: "position")
//        let firstBasePoint = CGPoint(x: self.groundView.frame.width / 2 + 120, y: self.groundView.frame.height / 2)
//        let secondBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 - 120)
//        animation.fromValue = firstBasePoint
//        animation.toValue = secondBasePoint
//        animation.duration = 1
//        batterView.layer.add(animation, forKey: "position")
//        batterView.center = secondBasePoint
//    }
//
//    func secondToThird() {
//        let animation = CABasicAnimation(keyPath: "position")
//        let secondBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 - 120)
//        let thirdBasePoint = CGPoint(x: self.groundView.frame.width / 2 - 120, y: self.groundView.frame.height / 2)
//        animation.fromValue = secondBasePoint
//        animation.toValue = thirdBasePoint
//        animation.duration = 1
//        batterView.layer.add(animation, forKey: "position")
//        batterView.center = thirdBasePoint
//    }
//
//    func thirdToHome() {
//        let animation = CABasicAnimation(keyPath: "position")
//        let thirdBasePoint = CGPoint(x: self.groundView.frame.width / 2 - 120, y: self.groundView.frame.height / 2)
//        let homeBasePoint = CGPoint(x: self.groundView.frame.width / 2, y: self.groundView.frame.height / 2 + 120)
//        animation.fromValue = thirdBasePoint
//        animation.toValue = homeBasePoint
//        animation.duration = 1
//        batterView.layer.add(animation, forKey: "position")
//        batterView.center = homeBasePoint
//        batterView.isHidden = true
//    }
    
}



// One Batter Base Status

// [false, false, false]
// [true, false, false]
// [false, true, false]
// [false, false, true]


