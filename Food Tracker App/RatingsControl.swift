//
//  RatingsControl.swift
//  Food Tracker App
//
//  Created by Alexander Sacks on 8/6/17.
//  Copyright © 2017 Alexander Sacks. All rights reserved.
//

import UIKit

@IBDesignable class RatingsControl: UIStackView {
    
    // MARK: Properties
    private var ratingsButtons = [UIButton]()
    
    var rating = 0
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
    
    // MARK: Private Methods
    private func setupButtons() {
        
        // clear any existing buttons
        for button in ratingsButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingsButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in:bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
        // Create the button
        let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        // Setup the button action
        button.addTarget(self, action: #selector(RatingsControl.ratingButtonTapped(button:)), for: .touchUpInside)
        
        // Add the button to the stack
        addArrangedSubview(button)
            
            
        // Add the new button to the rating button array
            ratingsButtons.append(button)
        }
        
    }
    
}
