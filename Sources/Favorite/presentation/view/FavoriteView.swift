//
//  FavoriteView.swift
//  Gemmu
//
//  Created by Akashaka on 12/02/22.
//

import SwiftUI
import RealmSwift
import Common
public struct FavoriteView: View {
  @ObservedObject  var presenter: FavoritePresenter
  public init() {}
public  var body: some View {
    ZStack(alignment: .top) {
      Color.flatDarkBackground.ignoresSafeArea()
      VStack {
        if presenter.games.isEmpty {
          Text("You don't have any favourite games")
        } else {
          List(presenter.games, id: \.id) {item in
            presenter.linkBuilder(for: item.id) {
              ItemList(
                title: item.name ,
                releaseDate: item.releaseDate,
                platforms: [item.rank],
                genres: item.genres.sorted(),
                imageUrl: item.imageUrl,
                id: item.id
              ).frame(
                width: .infinity,
                height: 150
              )
            }
            .listRowBackground(Color.flatDarkBackground)
          }
        }
      }

    }.padding(0)
  }
}

