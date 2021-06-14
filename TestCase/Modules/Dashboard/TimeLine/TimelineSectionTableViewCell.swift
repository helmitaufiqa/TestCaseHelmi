//
//  TimelineSectionTableViewCell.swift
//  TestCase
//
//  Created by helmi taufiq alhakim on 13/06/21.
//

import UIKit

class TimelineSectionTableViewCell: UITableViewCell {

    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    
    /// variable for setup constraint when timeline expanding or collapsing
    private var originalLeadingConstraint: CGFloat = 0
    private var originalWidthConstraint: CGFloat = 0
    private var originalHeightConstraint: CGFloat = 0
    
    private var collapsedLeadingConstraint: CGFloat = 0
    private var collapsedWidthConstraint: CGFloat = 0
    private var collapsedHeightConstraint: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// setup original original button constraint
        originalLeadingConstraint = buttonLeadingConstraint.constant
        originalWidthConstraint = buttonWidthConstraint.constant
        originalHeightConstraint = buttonHeightConstraint.constant
        yearButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - COFIGURATION SECTION VIEW CELL
    func configure(isCollapsed: Bool) {
        UIView.animate(withDuration: 0.5) {
            if isCollapsed == true {
                self.yearButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                self.yearButton.backgroundColor = UIColor(named: "LightButtonOrange")
                self.buttonLeadingConstraint.constant = self.originalLeadingConstraint + 10
                self.buttonHeightConstraint.constant = self.originalHeightConstraint - 10
                self.buttonWidthConstraint.constant = self.originalWidthConstraint - 20
            } else {
                self.yearButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
                self.yearButton.backgroundColor = UIColor(named: "ButtonOrange")
                self.buttonLeadingConstraint.constant = self.originalLeadingConstraint
                self.buttonHeightConstraint.constant = self.originalHeightConstraint
                self.buttonWidthConstraint.constant = self.originalWidthConstraint
            }
        }
    }
    
}
