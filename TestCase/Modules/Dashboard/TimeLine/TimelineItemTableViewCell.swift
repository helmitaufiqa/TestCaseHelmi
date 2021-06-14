//
//  TimelineItemTableViewCell.swift
//  TestCase
//
//  Created by helmi taufiq alhakim on 13/06/21.
//

import UIKit

class TimelineItemTableViewCell: UITableViewCell {

    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var containerItemView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String,
                   courseTitle: String,
                   date: String) {
        titleLabel.text = title
        courseTitleLabel.text = courseTitle
        dateLabel.text = "Awarded on \(date)"
    }
    
    private func setupViews() {
        let bulletViewLayer = bulletView.layer
        bulletViewLayer.borderWidth = 2
        bulletViewLayer.borderColor = UIColor.orange.cgColor
        bulletViewLayer.cornerRadius = bulletView.frame.width/2
        
        containerItemView.layer.cornerRadius = 5
    }
}
