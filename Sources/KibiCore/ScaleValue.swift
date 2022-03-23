import SwiftUI

@available(iOS 13.0, *)
@propertyWrapper
public struct ScaleValue: DynamicProperty {
    @State public var value: CGFloat
    @State public var scaleValue: CGFloat = 1.0

    private let minimumValue: CGFloat
    private let maximumValue: CGFloat

    public var projectedValue: ScaleValue { self }

    public var wrappedValue: CGFloat {
        get { max(min(value * scaleValue, maximumValue), minimumValue) }
        nonmutating set {
            self.scaleValue = 1.0
            self.value = max(min(newValue, maximumValue), minimumValue)
        }
    }

    public var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                self.scaleValue = value.magnitude
            }
            .onEnded { value in
                wrappedValue = wrappedValue
            }
    }

    public init(wrappedValue: CGFloat, min: CGFloat, max: CGFloat) {
        minimumValue = min
        maximumValue = max
        self.value = wrappedValue
    }
}
