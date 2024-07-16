//
//  WordsView.swift
//  sunduskBook
//
//  Created by IosDeveloper on 2024/7/15.
//

// WordsView.swift
import SwiftUI

struct WordsView: View {
    @EnvironmentObject var viewModel: CardsViewModel

    var body: some View {
        VStack {
            Text("这是单词页面")
                .font(.title)
                .padding()

            List(viewModel.cards) { card in
                VStack(alignment: .leading) {
                    Text(card.title)
                        .font(.headline)
                    Text(card.content)
                        .font(.subheadline)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WordsView().environmentObject(CardsViewModel())
}
