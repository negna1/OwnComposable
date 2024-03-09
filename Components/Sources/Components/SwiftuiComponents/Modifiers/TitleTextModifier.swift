//
//  File.swift
//
//
//  Created by Nato Egnatashvili on 19.11.23.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font( .system(size: 10, weight: .light))
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.leading, 5)
    }
}

extension View {
    var titleTextModifier: some View {
        modifier(TitleTextModifier())
    }
}

struct BodyTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font( .system(size: 12, weight: .bold))
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.leading, 5)
    }
}

extension View {
    var bodyTextModifier: some View {
        modifier(BodyTextModifier())
    }
}
