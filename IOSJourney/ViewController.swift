//
//  ViewController.swift
//  IOSJourney
//
//  Created by ENFINY INNOVATIONS on 7/15/21.
//

import UIKit

class ViewController: UIViewController {
    
    var animateButton = UIButton()
    
    var popupViewHeight: CGFloat = 100
    var topLayoutConstraint: NSLayoutConstraint?
    
    var popupView: SlidingView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        popupView = SlidingView(view: self.view)

        configureAnimateButton()
    
        
    }
    
    
  
    private func configureAnimateButton() {
        animateButton = UIButton(frame: .init(x: 20, y: view.frame.height - 70, width: view.frame.width - 40, height: 50))
        animateButton.backgroundColor = .red
        animateButton.setTitle("Animate", for: .normal)
        view.addSubview(animateButton)
        animateButton.addTarget(self, action: #selector(animateButtonTap), for: .touchUpInside)
    }
    
    @objc func animateButtonTap() {
        
        popupView?.startAnimation(with: .failure)
     

    }
    
    
    
}

