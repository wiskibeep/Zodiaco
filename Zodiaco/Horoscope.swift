//
//  Pricipal.swift
//  Zodiaco
//
//  Created by Tardes on 14/1/26.
//

import Foundation
import UIKit

struct Horoscope{
    
    let id: String
    let name: String
    let dates: String

    
    static let welcome = "Hola"
    
    func getIcon() -> UIImage? {
        UIImage(named: "horoscope_icon ")
        
    }
    
    static let horoscopeList: [Horoscope] = [
        Horoscope(id: "Aries", name: "Aries", dates: "21 Marzo al 19 Abril"),
        Horoscope(id: "Taurus", name: "Tauro", dates: "20 Abril al 20 Mayo"),
        Horoscope(id: "Gemini", name: "Géminis", dates: "21 Mayo al 20 Junio"),
        Horoscope(id: "Cancer", name: "Cáncer", dates: "21 Junio al 22 Julio"),
        Horoscope(id: "Leo", name: "Leo", dates: "23 Julio al 22 Agosto"),
        Horoscope(id: "Virgo", name: "Virgo", dates: "23 Agosto al 22 Septiembre"),
        Horoscope(id: "Libra", name: "Libra", dates: "23 Septiembre al 22 Octubre"),
        Horoscope(id: "Scorpio", name: "Escorpio", dates: "23 Octubre al 21 Noviembre"),
        Horoscope(id: "Sagittarius", name: "Sagitario", dates: "22 Noviembre al 21 Diciembre"),
        Horoscope(id: "Capricorn", name: "Capricornio", dates: "22 Diciembre al 19 Enero"),
        Horoscope(id: "Aquarius", name: "Acuario", dates: "20 Enero al 18 Febrero"),
        Horoscope(id: "Pisces", name: "Piscis", dates: "19 Febrero al 20 Marzo"),
    ]
        
    
}

