//
//  BounceButton.swift
//  ThreeButtons
//
//  Created by Aleksandr Bolotov on 06.07.2023.
//

import UIKit

class BounceButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.transform = self.isHighlighted ? .init(scaleX: 0.9, y: 0.9) : .identity
            }
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            self.imageView?.tintColor = .systemGray3
            self.setTitleColor(.systemGray3, for: .normal)
            self.backgroundColor = .systemGray2
        } else {
            self.backgroundColor = .systemBlue
            self.setTitleColor(.white, for: .normal)
            self.imageView?.tintColor = .white
        }
    }
 
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setImage(.init(systemName: "arrow.forward.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
        setImage(.init(systemName: "arrow.forward.circle")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        
        tintColorDidChange()
        
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        
        setInsets()
    }
    
    func setInsets() {
        let titleImageSpace: CGFloat = 8
        
        contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14 + titleImageSpace)
        sizeToFit()
        
        let imageWidth = imageView?.frame.width ?? .zero
        self.titleEdgeInsets = .init(top: 0, left: -imageWidth, bottom: 0, right: imageWidth)
        let titleWidth = titleLabel?.frame.width ?? .zero
        self.imageEdgeInsets = .init(top: 0, left: titleWidth + titleImageSpace, bottom: 0, right: -titleWidth - titleImageSpace)
        

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
