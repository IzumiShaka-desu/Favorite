//
//  FavoritePresenter.swift
//  Gemmu
//
//  Created by Akashaka on 20/02/22.
//

import Combine
import RealmSwift
import SwiftUI

public class FavoritePresenter<DetailView: View>: ObservableObject {
  let router: ((_ id: Int) -> DetailView)

public  init(router: @escaping ((Int) -> DetailView)) {
    self.router = router
  }

  func linkBuilder<Content: View>(
    for id: Int,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: self.router(id)) { content() }
    .padding(0)
    .buttonStyle(PlainButtonStyle())
  }
}
