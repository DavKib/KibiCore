import Foundation


public protocol Loggable { 
    
    public func log( to destination: LogMessage.LogDestination? = nil,
              format: LogMessage.LogFormat? = nil,
              _ input: String, 
              _ file: String = #file, 
              _ function: String = #function, 
              _ line: Int = #line ) {
        
        let message = LogMessage(destination: destination,
                                           file: file, 
                                           function: function, 
                                           line: line, 
                                           input: input,
                                           format: format)
        message.log()
    }
    
    public func log<I: Error>( to destination: LogMessage.LogDestination? = nil,
                        format: LogMessage.LogFormat? = nil,
                        _ input: I, 
                        _ file: String = #file, 
                        _ function: String = #function, 
                        _ line: Int = #line ) {
        
        let message = LogMessage(destination: destination,
                                 file: file, 
                                 function: function, 
                                 line: line, 
                                 input: "\(input)",
                                 format: format)
        message.log()
    }
    
}
