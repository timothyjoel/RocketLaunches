//
//  Publisher+Ext.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import Foundation
import Combine

extension Publisher {
    public func decodeFromJson<Item>(_ type: Item.Type) -> Publishers.Decode<Self, Item, JSONDecoder> where Item : Decodable, Self.Output == JSONDecoder.Input {
        return decode(type: type, decoder: JSONDecoder())
    }
}
