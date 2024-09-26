//
//  HomeViewModel.swift
//  App528
//
//  Created by IGOR on 10/09/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @Published var photoForProfile: [String] = ["man"]
    @Published var currentProfPhoto = ""
    @Published var addName = ""
    
    @Published var isAddProfile: Bool = false
    
    @AppStorage("inc") var inc: Int = 0
    @AppStorage("exp") var exp: Int = 0
    
    @AppStorage("photoProfile") var photoProfile: String = ""
    @AppStorage("nameProfile") var nameProfile: String = ""

    @Published var types: [String] = ["Expenses", "Income"]
    @Published var currentType = "Expenses"
    
    @Published var categories: [String] = ["Products", "Children", "Taxi", "Education", "Health", "Cafe", "Entertaiments", "Transport", "Trips", "Sport", "Cloth", "Taxes", "House", "Fuel", "Credit", "Present", "Pets", "Charity", "Other"]
    @Published var currentCat = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCateg: Bool = false
    @Published var isAddExp: Bool = false
    @Published var isProfile: Bool = false

    @Published var exSum: String = ""
    @Published var exDate: String = ""
    @Published var exComment: String = ""
    @Published var exCat: String = ""

    @Published var expenses: [ExpModel] = []
    @Published var selectedExp: ExpModel?

    func addExp() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExpModel", into: context) as! ExpModel

        loan.exSum = exSum
        loan.exDate = exDate
        loan.exComment = exComment
        loan.exCat = exCat

        CoreDataStack.shared.saveContext()
    }

    func fetchExpenses() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpModel>(entityName: "ExpModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.expenses = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.expenses = []
        }
    }
}
