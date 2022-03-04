public struct Test {
    private var title: String = "default"
    
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
