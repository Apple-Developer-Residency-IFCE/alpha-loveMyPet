//
//  Pickers.swift
//  LoveMyPet
//
//  Created by userext on 28/09/23.
//

import Foundation

struct Constants {
    static let raceDog: [String] = ["Labrador Retriever",
                                    "Golden Retriever",
                                    "Bulldog Inglês",
                                    "Poodle", "Dachshund (Salsicha)", "Beagle",
                                    "Pastor Alemão", "Yorkshire Terrier", "Boxer",
                                    "Rottweiler", "Husky Siberiano", "Pug", "Shih Tzu", "Chihuahua", "Outros",
                                    "Doberman Pinscher"]
    static let raceCat: [String] = ["Siamês", "Persa", "Maine Coon",
                                    "Bengal", "Ragdoll", "Sphynx", "British Shorthair",
                                    "Abissínio", "Gato de pelo curto americano", "Gato de pelo curto europeu", "Scottish Fold", "Siberiano", "Tonquinês", "Cornish Rex","Outros", "Gato de pelo curto brasileiro"]
    static let raceTurtle: [String] = ["Tartaruga de Aldabra", "Tartaruga de Galápagos",
                                       "Tartaruga de Esporão", "Tartaruga Pintada", "Tartaruga-de-ouvido-vermelho", "Tartaruga-de-caixa", "Tartaruga-de-barbelas", "Tartaruga-de-carapaça-mole", "Tartaruga-mordedora", "Tartaruga-marinha",
                                       "Tartaruga-de-pescoço-longo", "Tartaruga-terrestre-russa", "Tartaruga-de-maçã", "Tartaruga-de-sulcata","Outros", "Tartaruga-de-algema"]
    static let raceBird: [String] = ["Canário", "Pardal", "Pombo-doméstico", "Cacatua",
                                     "Periquito-australiano", "Arara", "Papagaio", "Pintassilgo",
                                     "Tucano", "Falcão-peregrino", "Coruja-buraqueira", "Beija-flor", "Andorinha", "Gavião-real","Outros", "Pato-real"]
    static let raceFish: [String] = ["Betta", "Guppy", "Peixe-dourado", "Tetra-neon",
                                     "Acará-disco", "Peixe-anjo", "Ciclídeo", "Peixe-palhaço", "Molli", "Barbo", "Danio", "Killifish", "Tubarão-de-águas-doces", "Peixe-gato","Outros", "Peixe-arco-íris"]
    
}

enum Species: String, Codable ,CaseIterable {
    
    case dog = "Cachorro"
    case cat = "gato"
    case turtle = "Tartaruga"
    case bird = "Pássaro"
    case fish = "Peixe"
    var breed: [String] {
        switch self {
        case .dog:
            return Constants.raceDog
        case .cat:
            return Constants.raceCat
        case .turtle:
            return Constants.raceTurtle
        case .bird:
            return Constants.raceBird
        case .fish:
            return Constants.raceFish
        }
    }
}

