//
//  File.swift
//
//
//  Created by Nato Egnatashvili on 19.11.23.
//

import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

extension View {
    var cardBackground: some View {
        modifier(CardBackground())
    }
}
