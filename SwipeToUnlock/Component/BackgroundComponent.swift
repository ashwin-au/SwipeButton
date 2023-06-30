//
//  BackgroundComponent.swift
//  SwipeToUnlock
//
//  Created by Ashwin A U on 30/06/23.
//

import SwiftUI


public struct BackgroundComponent: View {

    @State private var hueRotation = false

    public init() { }

    public var body: some View {
        ZStack(alignment: .leading)  {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.blueBright.opacity(0.6), Color.blueDark.opacity(0.6)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .hueRotation(.degrees(hueRotation ? 20 : -20))

            Text("Slide to unlock")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                hueRotation.toggle()
            }
        }
    }

}


public struct BaseButtonStyle: ButtonStyle {

    public init() { }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.default, value: configuration.isPressed)
    }

}

public extension Color {

    static let pinkBright = Color(red: 247/255, green: 37/255, blue: 133/255)
    static let blueBright = Color(red: 67/255, green: 97/255, blue: 238/255)
    static let blueDark = Color(red: 58/255, green: 12/255, blue: 163/255)

}
