//
//  ViewController.swift
//  RobinhoodInterview
//
//  Created by Zhen Gong on 10/3/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class ThreadSafeArray {
    
    init() {
        array = []
    }
    
    func objectAtIndex(index: Int) -> Int? {
        var result: Int?
        queue.sync {
            result = array[index]
        }
        return result
    }

    
    func append(value: Int) {
        queue.async(flags: .barrier) {
            self.array.append(value)
        }
    }
    
    let queue = DispatchQueue(label: "queuename", attributes: .concurrent)
    private var array: [Int]
}

class ViewController: UIViewController {
    
    let customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        customView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        customView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        customView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        print("here")
        self.view.bringSubviewToFront(customView)
        let translation = sender.translation(in: self.view)
        customView.center = CGPoint(x: customView.center.x + translation.x, y: customView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
         
        if sender.state == .began {
           print("Gesture began")
        } else if sender.state == .changed {
           print("Gesture is changing")
        } else if sender.state == .ended {
           print("Gesture ended")
        }
        
                
        if velocity.y > 0 {
           UIView.animate(withDuration: 0.3) {
            self.customView.backgroundColor = UIColor.green
           }
        } else {
           UIView.animate(withDuration: 0.3) {
            self.customView.backgroundColor = UIColor.yellow
           }
        }
    }

}

