//
//  FavoriteRouter.swift
//  Gemmu
//
//  Created by Akashaka on 20/02/22.
//

import SwiftUI

open class FavoriteRouterBase {

 open func makeDetailView(for id: Int) -> some View {

    return DefaultView()
  }
}
open struct DefaultView: View {
  var body: some View {
    HStack {}
  }
}
