//
//  OnboardingView.swift
//  SwiftUIArchitecture
//
//  Created by Stephan Schulz on 07.01.20.
//  Copyright © 2020 Stephan Schulz. All rights reserved.
//

import AttributedTextView
import SwiftUI
import SwiftUIRouter

struct OnboardingView: View {
    // MARK: - Variables

    var interactor: OnboardingInteractor

    // MARK: - Variables <Environment>

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    // MARK: - Variables <Private>

    @State private var input = String()
    @State private var focus = [false]

    var body: some View {
        GeometryReader { reader in
            List {
                VStack(alignment: .center) {
                    AttributedText(idealWidth:
                        reader.size.width
                            - Interface.Spacing.Onboarding.padding.leading
                            - Interface.Spacing.Onboarding.padding.trailing) {
                        Attributer(self.interactor.l10nTitle)
                            .font(Interface.Fonts.medium.withSize(Interface.Fonts.Sizes.title))
                            .color(Interface.Colors.primary)
                            .paragraphLineBreakModeWordWrapping
                            .paragraphLineSpacing(Interface.Spacing.Fonts.Regular.leading)
                            .paragraphApplyStyling
                            .match(self.interactor.l10nHighlightedCharacters)
                            .color(Interface.Colors.secondary)
                    }
                    Spacer(minLength: Interface.Spacing.Onboarding.spacing)
                    HStack(spacing: 4) {
                        Image(uiImage: "#".image(withAttributes: [
                            .font: UIFont.systemFont(ofSize: Interface.Fonts.Sizes.body, weight: .bold),
                            .foregroundColor: Interface.Colors.primary,
                        ]))
                        TextFieldView(
                            done: { text in
                                guard self.interactor.isValid(text) else {
                                    return
                                }
                                self.interactor.done(text)
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            contentType: .emailAddress,
                            returnVal: .done,
                            font: Interface.Fonts.medium,
                            fontColor: Interface.Colors.primary,
                            placeholder: self.interactor.l10nPlaceholder,
                            characterSet: self.interactor.validCharacters,
                            minCharacters: 2,
                            tag: 0,
                            text: self.$input,
                            isFocusable: self.$focus
                        ).offset(CGSize(width: 0, height: -1))
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                }
                .listRowInsets(Interface.Spacing.Onboarding.padding)
            }
            .padding(EdgeInsets())
        }
        .onAppear {
            self.focus = [true]
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(interactor: OnboardingInteractor(store: AppStore(AppState())))
    }
}
