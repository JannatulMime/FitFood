//
//  DefaultFormPicker.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 19/12/24.
//

import SwiftUI

struct DefaultFormPicker: View {
    let iconName : String
    let mainTitle : String
    let rightTitle : String
    var isRequired : Bool = false
  
    
    
    var body: some View {
        HStack{
                Image(systemName: iconName)
                    .resizable()
                   
                    .frame(width: 25, height: 25)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.theme.navyBlue)
                    ).foregroundStyle(Color.white)
         
           
            Text(mainTitle)
                .foregroundStyle(.black)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.horizontal,10)
            
            Spacer()
            
            Text(getRightTitle())
                .foregroundStyle(.gray)
                .font(.system(size: 16))
            
        
                Image(systemName: "chevron.compact.right")
                    .resizable()
                    .frame(width: 7, height: 10)
                    .foregroundStyle(.black)
                    .offset(y:1.5)
                    .padding(.leading,5)
         
            
        }
        .onTapGesture {
           
        }
    }
    
    func getRightTitle() -> String {
        
        return rightTitle
//        if rightTitle.isEmpty || rightTitle == "" {
//            return isRequired ? "Required" : "Select"
//        }
//        return rightTitle
    }
   
}



#Preview {
    DefaultFormPicker(iconName: "timer", mainTitle: "Duration", rightTitle: "20 min")
}

