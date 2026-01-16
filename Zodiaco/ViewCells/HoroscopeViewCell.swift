//
//  HoroscopeViewCell.swift
//  Zodiaco
//
//  Created by Tardes on 15/1/26.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    
    //MARK: Declaration
    //Labels y Icon
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var IconimagenView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var FavoriteImageView: UIImageView!
    
    
    
    
    @IBOutlet weak var elementLabel: UILabel! // Nuevo label para el elemento
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    //MARK: Autodeclaracion de valores
    // elementos como dates name icono elemento
    
    func configure(with horoscope: Horoscope) {
        datesLabel.text = horoscope.dates
        nameLabel.text = horoscope.name
        IconimagenView.image = horoscope.getIcon()
        elementLabel.text = horoscope.element.rawValue // Mostrar el elemento
        
        FavoriteImageView.isHidden = !SeccionManager().isFavorite(id: horoscope.id)
        }
    }

