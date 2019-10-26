//
//  FlagModifier.swift
//  GuessTheFlag
//
//  Created by Daniel O'Leary on 10/17/19.
//  Copyright © 2019 Impulse Coupled Dev. All rights reserved.
//

import SwiftUI

struct FlagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 80.0))
            .shadow(color: .black, radius: 2.0, x: 1, y: 2)
    }
	
}

struct ButtonRotation: ViewModifier {
	@State private var rotationAmount = 0.0
	
	func body(content: Content) -> some View {
		content
			.rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
	}
}




extension View {
    func buttonStyle() -> some View {
		self.modifier(FlagModifier())
    }
	func rotation() -> some View {
		self.modifier(ButtonRotation())
	}
}
