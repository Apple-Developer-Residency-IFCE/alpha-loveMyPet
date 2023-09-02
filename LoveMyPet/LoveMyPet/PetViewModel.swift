//
//  TesteViewModel.swift
//  TestesdoAppPets
//
//  Created by userext on 04/08/23.
//
import CoreData
import SwiftUI

class PetViewModel: ObservableObject {
    var stack: PetProvider
    private var editPet: Pet?
    
    @Published var items: [Pet] = []

    @Published var name: String = ""
    @Published var species: String = ""
    @Published var date: Date = Date()
    @Published var race: String = ""
    @Published var weight: Double = 0.0
    @Published var quilo: Int = 0
    @Published var gram: Int = 0
    @Published var registered: Bool = false
    @Published var imagepath: URL? = URL(string: "")
    @Published var castrated: Bool = false
    @Published var gender: String = ""

    var hasError: Bool = false
    init(stack: PetProvider, editPet: Pet? = nil) {
        self.stack = stack
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
    
    func save() {
        var pet: Pet
        if let editPet = editPet {
            pet = editPet
        } else {
            pet = Pet(context: stack.viewContext)
            pet.id = UUID()
        }
        
        pet.gender = gender
        pet.name = name
        pet.species = species
        pet.date = date
        pet.race = race
        pet.weight = (Double(quilo)) + (Double(Double(Int(gram * 10) % 10 ) / 10.0 ))
        pet.registered = registered
        pet.imagepath = imagepath
        pet.castrated = castrated
        
        do {
            try stack.viewContext.save()
        } catch {
            print("Error para salvar o pet: \(error)")
            hasError = true
        }
    }
    func clear () {
        name = ""
        species = ""
        date = Date()
        race = ""
        weight = 0.0
        registered = false
        imagepath = URL(string: "")
        castrated = false
        gender = ""
        quilo = 0
        gram = 0
    }
    func setPetToEdit(_ pet: Pet) {
        self.editPet = pet
        self.name = pet.name ?? ""
        self.gender = pet.gender ?? ""
        self.species = pet.species ?? ""
        self.imagepath = pet.imagepath ?? URL(string: "")
        self.castrated = pet.castrated
        self.race = pet.race ?? ""
        self.weight = pet.weight
        self.quilo = Int(pet.weight)
        self.gram = Int((pet.weight - Double(quilo)) * 10)
        self.registered = pet.registered
        self.date = pet.date ?? Date()
    }
}
