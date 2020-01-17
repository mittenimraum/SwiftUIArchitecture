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
    @State private var hint = ""

    var body: some View {
        GeometryReader { reader in
            List {
                VStack(alignment: .leading) {
                    AttributedText(idealWidth:
                        reader.size.width
                            - Interface.Spacing.Onboarding.padding.leading
                            - Interface.Spacing.Onboarding.padding.trailing) {
                        Attributer(self.interactor.l10nTitle)
                            .font(Interface.Fonts.medium.withSize(Interface.Fonts.Sizes.title))
                            .color(Interface.Colors.primary)
                            .paragraphLineBreakModeWordWrapping
                            .paragraphLineSpacing(Interface.Spacing.Fonts.Medium.leading)
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
                                guard self.interactor.isDuplicate(text) == false else {
                                    return
                                }
                                self.presentationMode.wrappedValue.dismiss()
                                self.interactor.done(text)
                            },
                            change: { text in
                                self.hint = self.interactor.isDuplicate(text)
                                    ? self.interactor.l10nDuplicate : ""
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
                        )
                        .offset(CGSize(width: 0, height: -1))
                        .frame(maxWidth: reader.size.width - 100)
                        .clipped()
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    Spacer(minLength: 22)
                    Text(self.hint)
                        .font(Font(Interface.Fonts.medium.withSize(Interface.Fonts.Sizes.hint)))
                        .offset(x: 5, y: 0)
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
