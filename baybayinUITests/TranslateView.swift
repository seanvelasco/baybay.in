//
//  TranslateView.swift
//  baybayin
//
//  Created by Sean Velasco on 7/23/24.
//

import SwiftUI

struct TranslateView: View {
    @State private var text = ""
    @State private var showCopyMessage = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        TextEditor(text: $text)
                            .scrollContentBackground(.hidden)
                            .background(AppColor.background)
                            .frame(minHeight: 40)
                            .font(.title3)
                        if text != "" {
                            Divider()
                            Text(text)
                                .onTapGesture {
                                    UIPasteboard.general.string = text
                                    withAnimation {
                                        showCopyMessage = true
                                    }
                                }
                                .onAppear {
                                  
                                }
                                .font(.title3)
                                .frame(minHeight: 40)
                        }
                    }
                    .padding()
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }.padding()
            }
            .frame(maxHeight: .infinity)
            .background(AppColor.background)
            .navigationTitle("Translate")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(AppColor.background, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "bookmark")
                    
                }
            }
        }
    }
}

#Preview {
    TranslateView()
}
