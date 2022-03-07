import Foundation

struct LogMessage {
    
    private static var destination: LogDestination = .console
    private static var format: LogFormat = .full
    
    enum LogFormat {
        case short 
        case full
    }
    
    enum LogDestination: Int {
        case console
        case debug
        case file
    }
    
    var destination: LogDestination?
    var file: String
    var function: String
    var line: Int
    var input: String
    var format: LogFormat?
    
    private var castedFormat: LogFormat { format ?? Self.format }
    private var castedDestination: LogDestination { destination ?? Self.destination }
    
    private var timestamp: Date { Date() }
    
    private var filename: String {
        file.split(separator: "/").suffix(2).joined(separator: "/")
    }
    
    var description: String {
        switch castedFormat {
        case .short: return "\(input)"
        case .full: return "\(filename)#\(line) \(Self.self).\(function): \(input)"
        }
    }
    
    func log() {
        switch castedDestination {
        case .console: print(description)
        case .debug: debugPrint(description)
        case .file: break //TODO: logging to file implementieren
        }
    }
    
    func config(to destination: LogDestination? = nil, format: LogFormat? = nil) {
        Self.destination = destination ?? Self.destination
        Self.format = format ?? Self.format
    }
    
}
