import XCTest
@testable import MeCabObjC

final class MeCabTests: XCTestCase {
    func testLink() {
        XCTAssertEqual(MeCabVersion, "0.996")
        print(Tagger(url: URL(string: "/usr/local/lib/mecab/dic/ipadic")!).parseNode("すもももももももものうち").compactMap((\.surface)))
    }
}
