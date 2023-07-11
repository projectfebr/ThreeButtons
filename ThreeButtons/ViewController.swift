//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Aleksandr Bolotov on 06.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private let my1Button = BounceButton(title: "First Button")
    private let my2Button = BounceButton(title: "Second Medium Button")
    private let my3Button = BounceButton(title: "Third Button")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(my1Button)
        view.addSubview(my2Button)
        view.addSubview(my3Button)
        
        my3Button.addTarget(self, action: #selector(openModal), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if (my1Button.transform == .identity && my2Button.transform == .identity && my3Button.transform == .identity) {
            my1Button.setInsets()
            my1Button.center.x = view.frame.width/2
            my1Button.frame.origin.y = view.safeAreaInsets.top
            
            my2Button.setInsets()
            my2Button.center.x = my1Button.center.x
            my2Button.frame.origin.y = my1Button.frame.maxY + 8
            
            my3Button.setInsets()
            my3Button.center.x = my2Button.center.x
            my3Button.frame.origin.y = my2Button.frame.maxY + 8
        }
    }
    
    @objc private func openModal() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        present(vc, animated: true)
    }
}

