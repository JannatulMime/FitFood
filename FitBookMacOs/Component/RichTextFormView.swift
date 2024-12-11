//
//  RichTextFormView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import SwiftUI

struct RichTextFormView: View {
    var placeHolder: String = ""
    @Binding var text: NSAttributedString
    @State private var showSheet = false

    var body: some View {
        HStack/*(alignment: .center)*/ {
            HStack {
                Text(text.length == 0 ? placeHolder.toAttributedTextForPlaceHolder() : AttributedString(text))
                    .font(.caption)
                    .foregroundColor(text.length == 0 ? Color.gray : Color.white)

                Spacer()
            }.padding(.leading)
            Image(systemName: "square.and.pencil")
        }
       
        .frame(maxWidth: .infinity, alignment: .top)
       // .modifier(DefaultRoundedRectangleOverlay(cornerRadius: 10))
        .padding()
        .padding()
       
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 2, x: -1, y: 2)
                
        )
        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            RichTextEditorView(text: $text)
        }
    }
}

#Preview {
    RichTextFormView(text: .constant("".toNsAttributedString()))
    // .background(Color.black)
}