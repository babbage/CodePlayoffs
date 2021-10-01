import XCTest
@testable import TheDraft

final class StringVsURL: XCTestCase {
    let options = XCTMeasureOptions()
    let metrics: [XCTMetric] = [XCTClockMetric(), XCTMemoryMetric(), XCTCPUMetric()]
    let reserveArrayCapacity = true
    let preferredIterations = 100
    
    // The 10,000 structs playoffs
    func testStringBasedStruct_10K() throws {
        options.iterationCount = preferredIterations
        
        measure(metrics: metrics, options: options) {
            runStringTest(testValues: 10_000)
        }
    }
    
    func testURLBasedStruct_10K() throws {
        options.iterationCount = preferredIterations
        
        measure(metrics: metrics, options: options) {
            runURLTest(testValues: 10_000)
        }
    }
    
    // The 100,000 structs playoffs
    func testStringBasedStruct_100k() throws {
        options.iterationCount = preferredIterations
        
        measure(metrics: metrics, options: options) {
            runStringTest(testValues: 100_000)
        }
    }
    
    func testURLBasedStruct_100k() throws {
        options.iterationCount = preferredIterations
        
        measure(metrics: metrics, options: options) {
            runURLTest(testValues: 100_000)
        }
    }
    
    // The 1,000,000 structs playoffs — takes ~45 seconds per iteration so iteration count <= 10 recommended
    func testStringBasedStruct_1M() throws {
        options.iterationCount = min(10, preferredIterations)
        
        measure(metrics: metrics, options: options) {
            runStringTest(testValues: 1_000_000)
        }
    }
    
    func testURLBasedStruct_1M() throws {
        options.iterationCount = min(10, preferredIterations)
        
        measure(metrics: metrics, options: options) {
            runURLTest(testValues: 1_000_000)
        }
    }
    
    // MARK: - Helper methods
    private func runStringTest(testValues: Int) {
        var structArray = [LinkAsStringStruct]()
        if reserveArrayCapacity {
            structArray.reserveCapacity(testValues)
        }
        
        for _ in 1...testValues {
            let strStruct = LinkAsStringStruct(link: LinkGenerator.link())
            structArray.append(strStruct)
        }
    }
    
    private func runURLTest(testValues: Int) {
        var structArray = [LinkAsURLStruct]()
        if reserveArrayCapacity {
            structArray.reserveCapacity(testValues)
        }
        
        for _ in 1...testValues {
            let urlStruct = LinkAsURLStruct(link: LinkGenerator.link())
            structArray.append(urlStruct)
        }
    }
    
}
