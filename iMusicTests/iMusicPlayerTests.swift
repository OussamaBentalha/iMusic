//
//  iMusicPlayerTests.swift
//  iMusic
//
//  Created by Akiro on 08/01/2017.
//  Copyright © 2017 Esgi. All rights reserved.
//

import XCTest
@testable import iMusic

class iMusicPlayerTests: XCTestCase {
    
    var musicViewController : MusicViewController?
    
    override func setUp() {
        super.setUp()
        self.musicViewController = MusicViewController(nibName: "MusicViewController", bundle: nil)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testA(){
        //Play music online
        musicViewController!.launchMusicWithId(musicId: "583c186c21cb3a100df74f38")
    }
    
    
    
    
}
