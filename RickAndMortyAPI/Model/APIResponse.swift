//
//  APIResponse.swift
//  RickAndMortyAPI
//
//  Created by Timothy Sonner on 9/29/21.
//

import Foundation

// when you get the error "The data couldn't be read because it is missing." , start commenting out properties on your structs to see which one is causing you grief.

struct APIResponse: Decodable {
    let info: Info
    let results: [Result]
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Result: Decodable, Identifiable, Equatable, Hashable {
    
    let id = UUID()
    let characterID: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
    case characterID = "id"
        case name, status, species, type, gender, origin, location, image, episode, url, created
    }
}

struct Location: Decodable, Equatable, Hashable {
    let name: String
    let url: String
}

struct Origin: Decodable, Equatable {
    let name: String
}

struct Episode: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    } // this coding key enum has to be exhaustive, like all cases accounted for in order for Episode struct to conform to decodable.
}


enum Gender: String, Decodable, Hashable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum Status: String, Decodable, Hashable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


