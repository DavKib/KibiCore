import SwiftUI

extension Date {
    public static var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    public func withTime(_ stringDate: String) -> Date {
        let date = Self.timeFormatter.date(from: stringDate) ?? self
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: self) ?? self
    }

    public func isSame(_ component: Calendar.Component, as date: Date) -> Bool {
        let result = Calendar.current.compare(self, to: date, toGranularity: component)
        return result == .orderedSame
    }
}

extension TimeInterval {
    public var hours: Double {
        get { self / 3600 }
        set { self = newValue * 3600 }
    }

    public var minutes: Double {
        get { self / 60 }
        set { self = newValue * 60 }
    }

    public init(minutes: Double) {
        self.init(minutes * 60)
    }
}
