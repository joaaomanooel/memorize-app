//
//  Grid.swift
//  Memorize
//
//  Created by João Neto on 31/08/22.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
  var itemList: [Item]
  var itemView: (Item) -> ItemView

  init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
    itemList = items
    itemView = viewForItem
  }


  var body: some View {
    GeometryReader { geometry in
      renderItemList(for: GridLayout(itemCount: itemList.count, in: geometry.size))
    }
  }

  func renderItemList(for layout: GridLayout) -> some View {
    ForEach(itemList) { item in
      renderItem(for: item, in: layout)
    }
  }

  func renderItem(for item: Item, in layout: GridLayout) -> some View {
    let index = indexOf(item: item)

    return itemView(item)
      .frame(width: layout.itemSize.width, height: layout.itemSize.height)
      .position(layout.location(ofItemAt: index))
  }


  func indexOf(item: Item) -> Int {
    for index in 0..<itemList.count {
      if itemList[index].id == item.id {
        return index
      }
    }

    return 0 // TODO: bogus
  }
}
