//
//  Checklist.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import Foundation

/**
     This struct is a part of the Model and is used to store data of each checklist.
     
     1. This struct has two attributes: three attributes: **id**, **name**, and **items**.
     2. The Checklist struct conforms to Codable (Decodable + Encodable) and Identifiable protocols.
     
     */
struct Checklist: Codable, Identifiable, Equatable {
    /// This attribute is used to uniquely identify each instance of this struct
    var id = UUID()
    /// This attribute is used to store the name of a checklist
    var name: String
    /// This attribute is used to store all items of a particular checklist
    var items: [Item]
}
