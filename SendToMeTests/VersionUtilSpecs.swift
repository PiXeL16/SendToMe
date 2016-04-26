import Foundation
import Nimble
import Quick
import SendToMe

class VersionUtilSpecs: QuickSpec {
    
    override func spec() {
        
        it("gets a version succesfully"){
            
            expect(VersionUtil.getAppVersion()).toNot(beEmpty())
            
        }
    }
    
}

