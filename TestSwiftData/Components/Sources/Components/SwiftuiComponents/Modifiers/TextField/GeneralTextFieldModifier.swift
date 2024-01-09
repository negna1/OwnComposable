//
//  File.swift
//  
//
//  Created by Nato Egnatashvili on 20.11.23.
//

import SwiftUI

struct GeneralTextFieldModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .shadow(radius: 10)
            .padding([.vertical], 4)
            .padding([.horizontal], 16)
            .font(.caption2)
    }
}

extension View {
    public var generalTextFieldModifier: some View {
        modifier(GeneralTextFieldModifier())
    }
}
