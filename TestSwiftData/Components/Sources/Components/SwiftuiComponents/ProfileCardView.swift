//
//  SwiftUIView.swift
//  
//
//  Created by Nato Egnatashvili on 19.11.23.
//

import SwiftUI

public struct ProfileCardView: View {
    public init(title: String, bodyString: String, iconURL: URL? = nil) {
        self.title = title
        self.bodyString = bodyString
        self.iconURL = iconURL
    }
    
    var title: String
    var bodyString: String
    var iconURL: URL?
    public var body: some View {
        HStack{
            VStack {
                Text(title).titleTextModifier
                Text(bodyString).bodyTextModifier
            }
            AsyncImageView(iconURL: iconURL)
        }
        .padding([.horizontal, .vertical])
        .frame(width: 200)
        .cardBackground
        
    }
}


#Preview {
    ProfileCardView(title: "Good Morning", bodyString: "Nato Egnatashvili",
                    iconURL: URL.init(string: "https://techcrunch.com/wp-content/uploads/2022/12/lensa-ai-magic-avatar.jpg"))
}
