//
//  FavoriteGame.swift
//  Gemmu
//
//  Created by Akashaka on 12/02/22.
//

import RealmSwift

public class FavoriteGame: Object, Identifiable {
    @Persisted(primaryKey: true) public var id: Int
    @Persisted public var name: String
    @Persisted public var imageUrl: String
    @Persisted public var genres: List<String>
    @Persisted public var releaseDate: String
    @Persisted public var rank: String
}
