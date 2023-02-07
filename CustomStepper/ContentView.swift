//
//  ContentView.swift
//  CustomStepper
//
//  Created by Madalin Zaharia on 07.02.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var value = 0.0
    
    // MARK: - Init
    init() {
        enableCustomStepper(
            decrementImage: UIImage(systemName: "minus"),
            decrementColor: .systemRed,
            incrementImage: UIImage(systemName: "plus"),
            incrementColor: .systemGreen,
            disabledColor: .systemGray
        )
    }
    
    // MARK: - Drawing
    var body: some View {
        Form {
            Section {
                Stepper(
                    String(value.formatted()),
                    value: $value,
                    in: 0...1,
                    step: 0.1
                )
            }
        }
    }
    
    private func enableCustomStepper(
        decrementImage: UIImage? = UIImage(systemName: "minus"),
        decrementColor: UIColor = .label,
        incrementImage: UIImage? = UIImage(systemName: "plus")!,
        incrementColor: UIColor = .label,
        disabledColor: UIColor? = nil
    ) {
        // Ability to override the decrement image and/or the color of the decrement image while in a normal state.
        UIStepper.appearance().setDecrementImage(decrementImage?.withTintColor(decrementColor, renderingMode: .alwaysOriginal), for: .normal)
        
        // Ability to override the increment image and/or the color of the increment image while in a normal state.
        UIStepper.appearance().setIncrementImage(incrementImage?.withTintColor(incrementColor, renderingMode: .alwaysOriginal), for: .normal)
        
        if disabledColor != nil {
            // Ability to override the decrement image and/or the color of the decrement image while in a disabled state.
            UIStepper.appearance().setDecrementImage(decrementImage?.withTintColor(disabledColor!, renderingMode: .alwaysOriginal), for: .disabled)
            
            // Ability to override the increment image and/or the color of the increment image while in a disabled state.
            UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus")?.withTintColor(disabledColor!, renderingMode: .alwaysOriginal), for: .disabled)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
