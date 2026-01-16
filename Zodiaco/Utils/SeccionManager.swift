//
//  SecionManager.swift
//  Zodiaco
//
//  Created by Tardes on 16/1/26.
//

import Foundation

class SeccionManager{
    // crear funcion de favorito
    let defaults = UserDefaults.standard
    
    // funcion para gaurdar uno nuevo
    func setFavorite( id : String)
    {
        defaults.set(id, forKey: "favorite_Horoscope")
    }
    
    // mirar Cual se guardo
    func getFavorite() -> String{
        defaults.string(forKey: "favorite_Horoscope") ?? "" // si no se guardo ninguno que se guarde como uno en vacio
    }
    
    
    // revisar si el id que me paso es el mismo esta en el mismo valor
 func isFavorite(id: String) -> Bool {
         id == getFavorite()
    }
}
