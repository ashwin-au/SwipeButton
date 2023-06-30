//
//  ContentView.swift
//  SwipeToUnlock
//
//  Created by Ashwin A U on 30/06/23.
//

import SwiftUI

public struct UnlockButton: View {

    @State private var isLocked = true
    @State private var isLoading = false

    public init() { }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                BackgroundComponent()
                DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width)
            }
        }
        .frame(height: 50)
        .padding()
        .padding(.bottom, 20)
        .onChange(of: isLocked) { isLocked in
            guard !isLocked else { return }
            simulateRequest()
        }
    }

    private func simulateRequest() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
        }
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockButton()
    }
}
