//
//  File.swift
//
//
//  Created by Nato Egnatashvili on 19.11.23.
//

import SwiftUI

public struct AsyncImageView: View {
    public init(iconURL: URL? = nil, 
                size: CGSize = .init(width: 70, height: 70),
                cornerType: CornerType = .circle) {
        self.iconURL = iconURL
        self.size = size
        self.cornerType = cornerType
    }
    
    var iconURL: URL?
    var size: CGSize 
    let cornerType: CornerType
    
    public var body: some View {
        AsyncImage(url: iconURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                switch cornerType {
                case .circle:
                    image.shadowCircleImage(size: size)
                case .rectangle:
                    image.RectangleImage(size: size)
                }
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
    }
    
    public enum CornerType {
        case circle
        case rectangle
    }
}

extension Image {
    func shadowCircleImage(size: CGSize) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: size.width, maxHeight: size.height)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
    
    func RectangleImage(size: CGSize) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: size.width, maxHeight: size.height)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
    }
}
