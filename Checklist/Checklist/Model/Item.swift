//
//  Item.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import Foundation

/**
     This struct is a part of the Model and is used to store data of each item of a checklist.
     
     1. This struct has two attributes: three attributes: **id**, **name**, and **isTicked**.
     2. The Item struct conforms to Codable (Decodable + Encodable) Identifiable, Hashable protocols.
     
     */
struct Item: Codable, Identifiable, Hashable, Equatable {
    /// This attribute is used to uniquely identify each instance of this struct
    var id = UUID()
    /// This attribute is used to store the name of an item
    var name: String
    /// This attribute is used to check if Item is ticked or not
    var isTicked: Bool
}
