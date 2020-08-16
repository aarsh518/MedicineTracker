//
//  DataBaseManager.swift
//  MedicineTracker
//
//  Created by Aarsh Parekh on 07/08/20.
//  Copyright © 2020 Aarsh. All rights reserved.
//

import Foundation
import CoreData

class DataBaseManager {
    private let context = appDelegate.persistentContainer.viewContext
    static let instance = DataBaseManager()
    
    deinit {
    }
    
    private func checkIfDateExist(date: String) -> Bool {
        let fetchRequest: NSFetchRequest<MedicineHistory> = MedicineHistory.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date == %@", date)
        fetchRequest.fetchLimit = 1
        do {
            let data = try context.fetch(fetchRequest)
            return data.count > 0 ? true : false
        } catch {
            return false
        }
    }
    
    func fetchDataFromDB() -> [MedicineHistory]? {
        let fetchRequest: NSFetchRequest<MedicineHistory> = MedicineHistory.fetchRequest()
        do {
            let data = try context.fetch(fetchRequest)
            return data
        } catch {
            return nil
        }
    }
    
    func insert(dateInDB date: String) {
        if !checkIfDateExist(date: date) {
            let managedObj = MedicineHistory(context: context)
            managedObj.date = date
            context.insert(managedObj)
            do {
                try context.save()
            } catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
