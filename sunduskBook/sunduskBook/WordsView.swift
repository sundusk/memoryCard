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
    @State private var showAlert = false
    @State private var selectedCardTitle = ""
    @State private var cardTwoTitle = ""
    @State private var isFlipped = false

    var body: some View {
        VStack {
            Text("这是Card页面")
                .font(.title)
                .padding()

            List {
                ForEach(viewModel.cards) { card in
                    VStack(alignment: .leading) {
                        Button(action: {
                            selectedCardTitle = card.title
                            cardTwoTitle = card.content
                            showAlert = true
                        }) {
                            Text(card.title)
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                .onDelete(perform: delete)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            Group {
                if showAlert {
                    ZStack {
                        Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            ZStack {
                                Text(selectedCardTitle)
                                    .font(.title)
                                    .frame(width: 300, height: 300)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .opacity(isFlipped ? 0 : 1)
                                    .rotation3DEffect(
                                        .degrees(isFlipped ? 180 : 0),
                                        axis: (x: 0, y: 1, z: 0)
                                    )

                                ScrollView {
                                    Text(cardTwoTitle)
                                        .font(.title)
                                        .padding()
                                }
                                .frame(width: 300, height: 300)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .opacity(isFlipped ? 1 : 0)
                                .rotation3DEffect(
                                    .degrees(isFlipped ? 0 : -180),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                            }
                            .onTapGesture {
                                withAnimation {
                                    isFlipped.toggle()
                                }
                            }
                            .frame(width: 300, height: 300)
                            
                            Button(action: {
                                showAlert = false
                            }) {
                                Text("关闭")
                                    .font(.headline)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
        )
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.deleteCard(at: offsets)
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView().environmentObject(CardsViewModel())
    }
}
