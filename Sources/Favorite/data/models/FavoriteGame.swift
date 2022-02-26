//
//  FavoriteGame.swift
//  Gemmu
//
//  Created by Akashaka on 12/02/22.
//

import RealmSwift

public class FavoriteGame: Object, Identifiable {
  public  @Persisted(primaryKey: true) public var id: Int
  public  @Persisted var name: String
  public  @Persisted var imageUrl: String
  public  @Persisted var genres: List<String>
  public  @Persisted var releaseDate: String
  public  @Persisted var rank: String
}
