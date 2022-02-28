//
//  LocalDatasource.swift
//  Gemmu
//
//  Created by Akashaka on 16/02/22.
//
import RealmSwift
import Foundation
import Combine
import Common

public protocol LocaleDataSourceProtocol: AnyObject {
  func addOrDeleteFavoriteGame(favoritedGame: FavoriteGame, isFavorited: Bool)
  @available(macOS 10.15, *)
  func isGameFavorited(for idGame: Int) -> AnyPublisher<Bool, Error>
}
public final class LocaleDataSource: NSObject {
  @ObservedResults(FavoriteGame.self) var games
  private let realm: Realm?

  private init(realm: Realm?) {
    self.realm = realm
  }

 public static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
    return LocaleDataSource(realm: realmDatabase)
  }

}

public extension LocaleDataSource: LocaleDataSourceProtocol {
public  func isGameFavorited(for idGame: Int) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> {completion in
      if let realm = self.realm {
        let result = realm.object(ofType: FavoriteGame.self, forPrimaryKey: idGame) != nil

        completion(.success(result))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()

  }

public  func addOrDeleteFavoriteGame(favoritedGame: FavoriteGame, isFavorited: Bool) {
    if isFavorited {
      guard let object=realm?.object(
        ofType: FavoriteGame.self,
        forPrimaryKey: favoritedGame.id
      ) else { return }
      $games.remove(object)
    } else {
      $games.append(favoritedGame)
    }

  }

}
