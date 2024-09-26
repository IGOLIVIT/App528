//
//  CurrencyViewModel.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI
import CoreData

final class CurrencyViewModel: ObservableObject {
    
    @AppStorage("photoProfile") var photoProfile: String = ""
    @AppStorage("nameProfile") var nameProfile: String = ""

    @Published var types: [String] = ["Expenses", "Income"]
    @Published var currentType = "Expenses"
    
    @Published var currencies: [String] = ["USD", "EUR", "JPY", "CHF", "TRY", "KZT", "THB", "GBP"]
    @Published var currentCUr = "USD"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCateg: Bool = false

    @Published var curCurrency: String = ""
    @Published var curTitle: String = ""
    @Published var curText: String = ""

    @Published var notes: [CurrencyModel] = []
    @Published var selectedNote: CurrencyModel?

    func addNote() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CurrencyModel", into: context) as! CurrencyModel

        loan.curCurrency = curCurrency
        loan.curTitle = curTitle
        loan.curText = curText

        CoreDataStack.shared.saveContext()
    }

    func fetchNoteAs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CurrencyModel>(entityName: "CurrencyModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.notes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.notes = []
        }
    }
}
