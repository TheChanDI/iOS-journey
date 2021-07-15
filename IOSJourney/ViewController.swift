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
    
    
    lazy var popupView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAnimateButton()
        configurePopupView()
        
    }
    
    private func configureAnimateButton() {
        animateButton = UIButton(frame: .init(x: 20, y: view.frame.height - 70, width: view.frame.width - 40, height: 50))
        animateButton.backgroundColor = .red
        animateButton.setTitle("Animate", for: .normal)
        view.addSubview(animateButton)
        animateButton.addTarget(self, action: #selector(animateButtonTap), for: .touchUpInside)
    }
    
    @objc func animateButtonTap() {
        
        //this remove all the active animation happening in the popupView layer
        popupView.layer.removeAllAnimations()
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.topLayoutConstraint?.constant = 0
            self.view.layoutIfNeeded()
        } completion: { (_) in
            UIView.animate(withDuration: 0.2, delay: 1) {
                self.topLayoutConstraint?.constant = -self.popupViewHeight
                self.topLayoutConstraint?.isActive = true
                
                self.view.layoutIfNeeded()
            }
        }
        
        
        
        
    }
    
    private func configurePopupView() {
        view.addSubview(popupView)
        topLayoutConstraint = popupView.topAnchor.constraint(equalTo: view.topAnchor, constant: -popupViewHeight)
        topLayoutConstraint?.isActive = true
        NSLayoutConstraint.activate([
            popupView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            popupView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            popupView.heightAnchor.constraint(equalToConstant: popupViewHeight)
        ])
        
    }
    
    
}

