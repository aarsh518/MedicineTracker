//
//  TodayViewModel.swift
//  MedicineTracker
//
//  Created by Aarsh Parekh on 07/08/20.
//  Copyright © 2020 Aarsh. All rights reserved.
//

import Foundation

class TodayViewModel {
    
    var medicineDataAry: [MedicineHistory]
    
    init() {
        medicineDataAry = [MedicineHistory]()
        fetchData()
    }
    
    deinit {
    }
    
    func fetchData() {
        medicineDataAry = DataBaseManager.instance.fetchDataFromDB() ?? []
        print(medicineDataAry)
    }
}
