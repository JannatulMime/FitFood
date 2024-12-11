//
//  CustomImageView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import SwiftUI

struct CustomImageView: View {
   
    let uiImage: UIImage?
    let contentMode : ContentMode
   
    
    init(imageData: Data?, contentMode : ContentMode = .fit) {
        if let data = imageData {
            uiImage = UIImage(data: data)
        } else {
            uiImage = nil
        }
        self.contentMode = contentMode
       
    }

    init(uiImage: UIImage?, contenMode : ContentMode = .fit) {
        self.uiImage = uiImage
        self.contentMode = contenMode
    }

    var body: some View {
        ZStack {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                   // .frame(width: size.height, height: size.height)
                    .clipped()
                    
            } else {
                Image("Rice1")
                    .resizable()
                    .scenePadding()
                    .aspectRatio(contentMode: .fill)
                  //  .frame(width: size.height, height: size.height)
                    .clipped()
                
            }
        }
    }
}

#Preview {
    CustomImageView(uiImage: nil)
}
