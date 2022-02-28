//
//  FavoritePresenter.swift
//  Gemmu
//
//  Created by Akashaka on 20/02/22.
//

import Combine
import RealmSwift
import SwiftUI

public class FavoritePresenter: ObservableObject {
  @ObservedResults(FavoriteGame.self) var games
  private let router: FavoriteRouter

public  init(router: FavoriteRouter) {
    self.router = router
  }

  func linkBuilder<Content: View>(
    for id: Int,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeDetailView(for: id)) { content() }
    .padding(0)
    .buttonStyle(PlainButtonStyle())
  }
}
