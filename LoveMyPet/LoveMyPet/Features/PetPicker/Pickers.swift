import Foundation

struct Constants {
    static let racenao: [String] = ["Não Escolhido"]
    static let raceDog: [String] = ["Labrador Retriever", "Golden Retriever", "Bulldog Inglês", "Poodle",
                                    "Dachshund (Salsicha)",
                                    "Beagle", "Pastor Alemão", "Yorkshire Terrier",
                                    "Boxer", "Rottweiler", "Husky Siberiano", "Pug", "Shih Tzu", "Chihuahua",
                                    "Outros", "Doberman Pinscher"]
    static let raceCat: [String] = ["Siamês", "Persa", "Maine Coon", "Bengal", "Ragdoll", "Sphynx", "British Shorthair",
                                    "Abissínio",
                                    "Gato de pelo curto americano", "Gato de pelo curto europeu",
                                    "Scottish Fold", "Siberiano", "Tonquinês", "Cornish Rex", "Outros",
                                    "Gato de pelo curto brasileiro"]
    static let raceTurtle: [String] = ["Tartaruga de Aldabra", "Tartaruga de Galápagos", "Tartaruga de Esporão",
                                       "Tartaruga Pintada",
                                       "Tartaruga-de-ouvido-vermelho", "Tartaruga-de-caixa",
                                       "Tartaruga-de-barbelas", "Tartaruga-de-carapaça-mole", "Tartaruga-mordedora",
                                       "Tartaruga-marinha",
                                       "Tartaruga-de-pescoço-longo", "Tartaruga-terrestre-russa",
                                       "Tartaruga-de-maçã", "Tartaruga-de-sulcata", "Outros", "Tartaruga-de-algema"]
    static let raceBird: [String] = ["Canário", "Pardal", "Pombo-doméstico", "Cacatua", "Periquito-australiano",
                                     "Arara",
                                     "Papagaio",
                                     "Pintassilgo", "Tucano", "Falcão-peregrino",
                                     "Coruja-buraqueira", "Beija-flor", "Andorinha",
                                     "Gavião-real", "Outros", "Pato-real"]
    static let raceFish: [String] = ["Betta", "Guppy", "Peixe-dourado", "Tetra-neon",
                                     "Acará-disco", "Peixe-anjo", "Ciclídeo", "Peixe-palhaço",
                                     "Molli", "Barbo", "Danio", "Killifish", "Tubarão-de-águas-doces",
                                     "Peixe-gato", "Outros", "Peixe-arco-íris"]
}

enum Species: String, CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    case nãoEscolhido = "Não Escolhido"
    case cachorro = "Cachorro"
    case gato = "Gato"
    case tartaruga = "Tartaruga"
    case pássaro = "Pássaro"
    case peixe = "Peixe"
    var breed: [String] {
        switch self {
        case .nãoEscolhido:
            return Constants.racenao
        case .cachorro:
            return Constants.raceDog
        case .gato:
            return Constants.raceCat
        case .tartaruga:
            return Constants.raceTurtle
        case .pássaro:
            return Constants.raceBird
        case .peixe:
            return Constants.raceFish
        }
    }
}
