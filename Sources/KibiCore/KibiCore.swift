public struct Test {
    private var title: String = "default"
    
    public init() {}
    
    mutating func setTitle(_ str: String) {
        title = str
    }
    
    func printTitle() {
        print(title)
    }
    
    func getTitle() -> String {
        title
    }
}
