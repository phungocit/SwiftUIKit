//
//  NavigationBarButton.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI

struct NavigationBarButton: View {
    let image: String
    let action: (() -> Void)?

    init(image: String, action: (() -> Void)? = nil) {
        self.image = image
        self.action = action
    }

    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: image)
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationBarButton(image: "xmark") {}
}
