//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Aleksandr Bolotov on 06.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var my1Button: BounceButton = {
        var button = BounceButton(title: "First Button", imageSystemName: "arrow.forward.circle")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var my2Button: BounceButton = {
        var button = BounceButton(title: "Second Medium Button", imageSystemName: "arrow.forward.circle")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var my3Button: BounceButton = {
        var button = BounceButton(title: "Third Button", imageSystemName: "arrow.forward.circle")
        button.addTarget(nil, action: #selector(openModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(my1Button)
        view.addSubview(my2Button)
        view.addSubview(my3Button)
        setupConstraints()
    }
    
    @objc private func openModal() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        present(vc, animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            my1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            my1Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            my2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            my2Button.topAnchor.constraint(equalTo: my1Button.bottomAnchor, constant: 24),
            my3Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            my3Button.topAnchor.constraint(equalTo: my2Button.bottomAnchor, constant: 24)
        ])
    }
}

