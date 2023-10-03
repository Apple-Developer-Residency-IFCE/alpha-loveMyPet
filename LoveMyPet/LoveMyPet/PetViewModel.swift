import CoreData
import SwiftUI
import PhotosUI
class PetViewModel: ObservableObject {
    var stack: PetProvider
    var imageFileManager: ImageFileManager
    private var editPet: Pet?
    @Published var imageData: Data?
    @Published var items: [Pet] = []
    @Published var name: String = ""
    @Published var species: String = ""
    @Published var date: Date = Date()
    @Published var race: String = ""
    @Published var weight: Double = 0.0
    @Published var quilo: Int = 0
    @Published var gram: Int = 0
    @Published var registered: Bool = false
    @Published var castrated: Bool = false
    @Published var gender: String = ""
    var hasError: Bool = false
    init(stack: PetProvider, editPet: Pet? = nil, imageFileManager: ImageFileManager) {
        self.stack = stack
        self.imageFileManager = imageFileManager
    }
    func fetchPet() {
        let request = NSFetchRequest<Pet>(entityName: "Pet")
        do {
            items = try stack.viewContext.fetch(request)
        } catch let error {
            print("error fetching. \(error)")
        }
    }
    func delete() {
        do {
            if let editPet = editPet {
                stack.viewContext.delete(editPet)
                do {
                    try stack.viewContext.save()
                    print("Pet deletado")
                } catch {
                    print("Error ao salvar depois da deleção \(error)")
                }
            } else {
                hasError = true
            }
        }
    }
    func loadImage(name: String) -> Data? {
        imageFileManager.loadImage(named: name)
    }
    func save() async {
        var pet: Pet
        if let editPet = editPet {
            pet = editPet
        } else {
            pet = Pet(context: stack.viewContext)
            pet.id = UUID()
        }
        if let data = self.imageData {
            imageFileManager.saveImage(imageData: data, withName: pet.id!.uuidString)
        }
        pet.gender = gender
        pet.name = name
        pet.species = species
        pet.date = date
        pet.race = race
        pet.weight = (Double(quilo)) + (Double(gram)/10)
        pet.registered = registered
        pet.castrated = castrated
        do {
            try stack.viewContext.save()
            refresh()
        } catch {
            print("Error para salvar o pet: \(error)")
            hasError = true
        }
    }
    
    private func refresh() {
        guard let editPet = editPet,
              let index = items.firstIndex(where: { $0.id! == editPet.id! })
        else { return }
        
        items.remove(at: index)
        items.insert(editPet, at: index)
//        items.append(editPet)
    }

    func clear () {
        DispatchQueue.main.async {
            self.name = ""
            self.species = ""
            self.date = Date()
            self.race = ""
            self.weight = 0.0
            self.registered = false
            self.castrated = false
            self.gender = ""
            self.quilo = 0
            self.gram = 0
            self.imageData = nil
        }
    }
    func setPetToEdit(_ pet: Pet) {
        self.editPet = pet
        self.name = pet.name ?? ""
        self.gender = pet.gender ?? ""
        self.species = pet.species ?? ""
        self.castrated = pet.castrated
        self.race = pet.race ?? ""
        self.weight = pet.weight
        self.quilo = Int(pet.weight)
        self.gram = Int((pet.weight - Double(quilo)) * 10)
        self.registered = pet.registered
        self.date = pet.date ?? Date()
        self.imageData = self.loadImage(name: pet.id!.uuidString)
    }
}
