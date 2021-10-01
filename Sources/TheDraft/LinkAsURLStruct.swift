import Foundation

public struct LinkAsURLStruct {
    var link: URL?
    
    init(link: String?) {
        self.link = (link != nil) ? URL(string: link!) : nil
    }
}
