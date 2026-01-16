//
//  DetailViewController.swift
//  Zodiaco
//
//  Created by Tardes on 15/1/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var IconImageView: UIImageView!

    

    
    
    
    
    //MARK: Lifecycle
    var horoscope:Horoscope!
    
    
    
    // Session manager
    var session: SeccionManager = SeccionManager()
    var isFavorite: Bool = false
    
    
    //MARK: Subtitulos
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = horoscope.name
        
        if #available(iOS 26.0, *) {
            navigationItem.subtitle = horoscope.dates
            
        }
        else {
            // FALLBACK on earlier version
            
        }
        
        IconImageView.image = horoscope.getIcon()
        
        
        
        
        
        
        
        isFavorite = session.isFavorite(id: horoscope.id)
        setFavoriteIcon()
        
    }
    
    // Activar el Corazon
    // asignar donde modificar

    @IBOutlet weak var favoriteButtonItem: UIBarButtonItem!
    
    
    func setFavoriteIcon(){
        if isFavorite {
            favoriteButtonItem.image = UIImage(systemName: "heart.fill")
            
        }else {
            favoriteButtonItem.image = UIImage(systemName: "heart")
        }
    }

    // si pulsamos que haga esto
    @IBAction func SetFavorite(_ sender: Any) {
        // Cambair de color
        //FavoriteButtonItem.image = UIImage(systemName: "heart.fill")

        isFavorite = !isFavorite
        if isFavorite {
            session.setFavorite(id: horoscope.id)
        }
        else {
            session.setFavorite(id:"")
            
        }
        setFavoriteIcon()
        
    }
    
    
    @IBAction func share(_ sender: Any) {
        let text = "Estoy compartiendo "
        
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        //activityViewController.excludedActivityTypes = [Ui ]
        
        
        self.present(activityViewController, animated: true, completion: nil)
    
        
        
    }
    
    
    


}
