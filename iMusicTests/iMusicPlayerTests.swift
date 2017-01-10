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
    var multimediaDH : MultimediaDataHelper!
    var musicList :[Music] = []
    
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
        //Play music online during 5 secondes
        musicViewController!.launchMusicWithId(musicId: "583c186c21cb3a100df74f38")
        sleep(1)
    }
    
    func TestB(){
        //Test Play
        var isPlaying = musicViewController?.player.isPlaying
        XCTAssertTrue(isPlaying!, "Not onStart()")
        
        //Test Pause
        musicViewController?.player.pause()
        isPlaying = musicViewController?.player.isPlaying
        XCTAssertFalse(isPlaying!, "Not onPause()")
    }
    
    func TestC(){
        //Test Current time not a the begining
        let currentTime = (musicViewController?.player.currentTime)!
        XCTAssertGreaterThan(currentTime, 0.0, "Current time = 0.0")
        
        //Test Stop
        musicViewController?.stopMusic()
        let currentTimeOnStop = (musicViewController?.player.currentTime)!
        XCTAssertEqual(currentTimeOnStop, 0.0, "Current time different to 0.0")
    }
    
    

}
