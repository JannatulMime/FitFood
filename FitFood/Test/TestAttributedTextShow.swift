//
//  TestAttributedTextShow.swift
//  FitFood
//
//  Created by Habibur Rahman on 16/12/24.
//

import SwiftUI
import RichTextKit

struct TestAttributedTextShow: View {
    @StateObject var context = RichTextContext()
    
    @Binding var attributedText : NSAttributedString
    @State var output: AttributedString?
    
//    let attributedString = NSAttributedString(string: "\"Test recipe { NSColor = \"<UIDynamicCatalogSystemColor: 0x600001a2ab20; name = labelColor>\"; NSFont = \"\\\".SFNS-Regular 16.00 pt. P [] (0x14ff2c160) fobj=0x14ff2c160, spc=4.48\\\"\"; NSParagraphStyle = \"Alignment Natural, LineSpacing 0, ParagraphSpacing 0, ParagraphSpacingBefore 0, HeadIndent 0, TailIndent 0, FirstLineHeadIndent 0, LineHeight 0/0, LineHeightMultiple 0, LineBreakMode WordWrapping, Tabs (\\n 28L,\\n 56L,\\n 84L,\\n 112L,\\n 140L,\\n 168L,\\n 196L,\\n 224L,\\n 252L,\\n 280L,\\n 308L,\\n 336L\\n), DefaultTabInterval 0, Blocks (\\n), Lists (\\n), BaseWritingDirection LeftToRight, HyphenationFactor 0, TighteningForTruncation NO, HeaderLevel 0 LineBreakStrategy 0 PresentationIntents (\\n) ListIntentOrdinal 0 CodeBlockIntentLanguageHint ''\"; }red{ NSColor = \"<UIDynamicCatalogSystemColor: 0x600001b83060; name = systemPinkColor>\"; NSFont = \"\\\".SFNS-Regular 16.00 pt. P [] (0x14ff2c160) fobj=0x14ff2c160, spc=4.48\\\"\"; NSParagraphStyle = \"Alignment Natural, LineSpacing 0, ParagraphSpacing 0, ParagraphSpacingBefore 0, HeadIndent 0, TailIndent 0, FirstLineHeadIndent 0, LineHeight 0/0, LineHeightMultiple 0, LineBreakMode WordWrapping, Tabs (\\n 28L,\\n 56L,\\n 84L,\\n 112L,\\n 140L,\\n 168L,\\n 196L,\\n 224L,\\n 252L,\\n 280L,\\n 308L,\\n 336L\\n), DefaultTabInterval 0, Blocks (\\n), Lists (\\n), BaseWritingDirection LeftToRight, HyphenationFactor 0, TighteningForTruncation NO, HeaderLevel 0 LineBreakStrategy 0 PresentationIntents (\\n) ListIntentOrdinal 0 CodeBlockIntentLanguageHint ''\"; }\"\n(string)\nedit\ndelete\n\n\n")
    var body: some View {
        
        //Text(AttributedString( attributedString))
        
        RichTextEditor(text: $attributedText, context: context).onChange(of: attributedText){
            
            output = AttributedString(attributedText)
        }
        
        
        
     //   print(attributedText.string)
        //Text(output ?? AttributedString)
        
        Spacer()
    }
}

#Preview {
    TestAttributedTextShow( attributedText: .constant( "text".toNsAttributedString()))
}
