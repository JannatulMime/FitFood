//
//  CommonTopBarView.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import SwiftUI

struct CommonTopBarData {
    var title: String
    var bgColor: Color
    var forgroundColor : Color
    var leftIconName: String
    var rightIconName: String
    var hasShadow : Bool

    init(title: String = "" ,
         bgColor: Color = .blue,
         forgroundColor : Color = .black,
         leftIconName: String,
         rightIconName: String = "",
         hasShadow : Bool = true
    ) {
        self.title = title
        self.bgColor = bgColor
        self.leftIconName = leftIconName
        self.rightIconName = rightIconName
        self.forgroundColor = forgroundColor
        self.hasShadow = hasShadow
    }

    var hasLeftIcon: Bool {
        return !leftIconName.isEmpty
    }

    var hasRightIcon: Bool {
        return !rightIconName.isEmpty
    }
}

struct CommonTopBarView: View {
    @Environment(\.presentationMode) var presentationMode
//
    private var onLeftButtonClicked: (() -> Void)?
    private var onRightButtonClicked: (() -> Void)?
    private var data: CommonTopBarData

    init(data: CommonTopBarData,
         onLeftButtonClicked: (() -> Void)? = nil,
         onRightButtonClicked: (() -> Void)? = nil

    ) {
        self.data = data
        self.onLeftButtonClicked = onLeftButtonClicked
        self.onRightButtonClicked = onRightButtonClicked
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            if data.hasLeftIcon {
                leftButton
            }

            Spacer()
            titleSection
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            if data.hasRightIcon {
                rightButton
            }

        }   .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .font(.title3)
            .foregroundStyle(.black)
            //.foregroundStyle(data.forgroundColor)
            .background(data.bgColor.ignoresSafeArea()
            .shadow(radius: data.hasShadow ? 1 : 0))
           
    }
}

#Preview {
    CommonTopBarView(data: DummyData.dummyCommonTopBar)
}


extension CommonTopBarView {
    private var leftButton: some View {
        Button {
            // presentationMode.wrappedValue.dismiss()
            if let action = onLeftButtonClicked {
                action()
            }
        } label: {
            Image(systemName: data.leftIconName)
        }
    }

    private var titleSection: some View {
        Text(data.title)
            .font(.system(size: 20))
            .fontWeight(.bold)
    }

    private var rightButton: some View {
        Button {
            if let action = onRightButtonClicked {
                action()
            }
        } label: {
            Image(systemName: data.rightIconName)
        }
    }
}
