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
    }
    func setPetToEdit(_ pet: Pet) {
        self.editPet = pet

        self.name = pet.name ?? ""
        // TODO: preencher todos os parâmetros utilizados na view
    }

    @Published var items: [Pet] = []

    @Published var name: String = ""
    @Published var species: String = ""
    @Published var date: Date = Date()
    @Published var race: String = ""
    @Published var weight: Double = 0.0
    @Published var registered: Bool = false
    @Published var imagepath: URL? = URL(string: "")
    @Published var castrated: Bool = false
    @Published var gender: String = ""

    // @FetchRequest(entity: Pet.entity(), sortDescriptors: [])
    // var items: FetchedResults<Pet>

    var hasError: Bool = false
    init(stack: PetProvider, editPet: Pet? = nil) {
        self.stack = stack
    }

    func fetchTasks() {
        let request = NSFetchRequest<Pet>(entityName: "Pet")
        do {
            items = try stack.viewContext.fetch(request)
        } catch let error {
            print("error fetching. \(error)")
        }
    }
    func addPet() {
        let newPet = Pet(context: stack.viewContext)
        newPet.gender = gender
        newPet.name = name
        newPet.species = species
        newPet.date = date
        newPet.race = race
        newPet.weight = weight
        newPet.registered = registered
        newPet.imagepath = imagepath
        newPet.castrated = castrated
        save()
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
        pet.weight = weight
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
}