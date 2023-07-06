//
//  BounceButton.swift
//  ThreeButtons
//
//  Created by Aleksandr Bolotov on 06.07.2023.
//

import UIKit

class BounceButton: UIButton {
    override var isHighlighted: Bool {
        didSet { if isHighlighted { isHighlighted = false } }
    }
    
    convenience init(title: String, imageSystemName: String) {
        self.init(frame: .zero)
        setupButton(title: title, imageSystemName: imageSystemName)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchIn()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnd()
    }
    
    private func touchIn() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseInOut],
                       animations: {
            self.transform = .init(scaleX: 0.9, y: 0.9)
        },
                       completion: nil)
    }
    
    private func touchEnd() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseInOut],
                       animations: {
            self.transform = .identity
        },
                       completion: nil)
    }
    
    private func setupButton(title: String = "", imageSystemName: String = "") {
        configuration = .filled()
        setTitle(title, for: .normal)
        setImage(UIImage(systemName: imageSystemName), for: .normal)
        configuration = .filled()
        configuration?.imagePlacement = .trailing
        configuration?.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration?.imagePadding = CGFloat(8)
        configuration?.titlePadding = .zero
    }
}
