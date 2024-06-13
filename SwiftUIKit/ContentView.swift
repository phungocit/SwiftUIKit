//
//  ContentView.swift
//  SwiftUIKit
//
//  Created by Foo on 13/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EmptyView()
    }
}

struct ContentView1: View {
    @EnvironmentObject private var navi: UINavigationController
    let title: String

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ..< 50) { i in
                    Button {
                        navi.pushView(
                            ContentView1(title: "\(i)")
                                .environmentObject(navi)
                        )
                    } label: {
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("\(i) Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundStyle(Color.primary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .searchable(text: .constant(""), prompt: "Search...")
        .navigationTitle(title)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Trailing") {
                    print("Trailing")
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navi.popViewController(animated: true)
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

extension ContentView1: PushViewConfigurable {
    var topBarLeadingView: any View {
        NavigationBarButton(image: "chevron.left") {
            navi.popView()
        }
    }
}

#Preview {
    ContentView()
}
