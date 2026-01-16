//
//  Pricipal.swift
//  Zodiaco
//
//  Created by Tardes on 14/1/26.
//

import UIKit

//MARK: Elementos del horoscopo

enum HoroscopeElement: String {
    case fuego = "Fuego"
    case tierra = "Tierra"
    case aire = "Aire"
    case agua = "Agua"
}

//MARK: estructura de elemento
struct Horoscope {
    let id: String
    let name: String
    let dates: String
    let element: HoroscopeElement

    //MARK: LLamada al icono
    func getIcon() -> UIImage? {
        UIImage(named: "horoscope-icons/\(id)_icon")
    }
    
    //MARK: Lista de contenido
    
    static let horoscopeList: [Horoscope] = [
        Horoscope(id: "aries", name: "Aries", dates: "21 Marzo al 19 Abril", element: .fuego),
        Horoscope(id: "taurus", name: "Tauro", dates: "20 Abril al 20 Mayo", element: .tierra),
        Horoscope(id: "gemini", name: "Géminis", dates: "21 Mayo al 20 Junio", element: .aire),
        Horoscope(id: "cancer", name: "Cáncer", dates: "21 Junio al 22 Julio", element: .agua),
        Horoscope(id: "leo", name: "Leo", dates: "23 Julio al 22 Agosto", element: .fuego),
        Horoscope(id: "virgo", name: "Virgo", dates: "23 Agosto al 22 Septiembre", element: .tierra),
        Horoscope(id: "libra", name: "Libra", dates: "23 Septiembre al 22 Octubre", element: .aire),
        Horoscope(id: "scorpio", name: "Escorpio", dates: "23 Octubre al 21 Noviembre", element: .agua),
        Horoscope(id: "sagittarius", name: "Sagitario", dates: "22 Noviembre al 21 Diciembre", element: .fuego),
        Horoscope(id: "capricorn", name: "Capricornio", dates: "22 Diciembre al 19 Enero", element: .tierra),
        Horoscope(id: "aquarius", name: "Acuario", dates: "20 Enero al 18 Febrero", element: .aire),
        Horoscope(id: "pisces", name: "Piscis", dates: "19 Febrero al 20 Marzo", element: .agua),
    ]
}
