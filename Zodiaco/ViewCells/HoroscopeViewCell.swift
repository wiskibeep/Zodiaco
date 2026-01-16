//
//  HoroscopeViewCell.swift
//  Zodiaco
//
//  Created by Tardes on 15/1/26.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var datesLabel: UILabel!
    
    
    @IBOutlet weak var IconimagenView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func configure(with horoscope: Horoscope)
    {
        datesLabel.text = horoscope.dates
        nameLabel.text = horoscope.name
        IconimagenView.image = horoscope.getIcon()
    }

}
