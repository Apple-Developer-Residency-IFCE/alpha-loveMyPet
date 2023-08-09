//
//  TesteViewModel.swift
//  TestesdoAppPets
//
//  Created by userext on 04/08/23.
//
import CoreData
import SwiftUI

class PetViewModel {
    var stack: PetProvider
    private var editPet: Pet?
    @Published var name: String = ""
    @Published var species: String = ""
    @Published var date: Date = Date()
    @Published var race: String = ""
    @Published var weight: Float = 0
    @Published var registered: Bool = false
    @Published var imagepath: URL? = URL(string: "")
    @Published var castrated: Bool = false
    var hasError: Bool = false
    init(stack: PetProvider, editPet: Pet? = nil) {
        self.stack = stack
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
