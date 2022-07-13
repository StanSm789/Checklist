//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import Foundation

/**
     This struct is a part of the ViewModel and is used to communicate between the View and the Mode (Checklist).
     
     1. This struct has two attributes: two attributes: **id** and **name**.
     2. The ChecklistViewModel struct conforms to Codable (Decodable + Encodable) and Identifiable protocols.
     
*/
struct ChecklistViewModel: Codable, Identifiable, Equatable {
    static func == (lhs: ChecklistViewModel, rhs: ChecklistViewModel) -> Bool {
        return lhs.checklist == rhs.checklist
    }
    
    /// This attribute is used to uniquely identify each instance of this struct
    var id = UUID()
    /// This attribute is used to store an instance if a Checklist struct
    var checklist: Checklist
    
    
}
