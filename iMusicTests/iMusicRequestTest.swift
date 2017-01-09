//
//  iMusicRequestTest.swift
//  iMusic
//
//  Created by Akiro on 08/01/2017.
//  Copyright © 2017 Esgi. All rights reserved.
//

import XCTest
@testable import iMusic

class iMusicRequestTest: XCTestCase {
    
    var multimediaDH : MultimediaDataHelper!
    var musicList :[Music] = []
    var videoList :[Video] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testPerformanceExample() {
        self.measure {} // Put the code you want to measure the time of here.
    }
    
    
    func testGetMusicList(){
        multimediaDH?.musics(){
            (result: [Music]) in
            self.musicList = result
            XCTAssertGreaterThan(self.musicList.count, 0, "Les musiques n'ont pas été récuperées")
        }
    }
    
    func testGetVideoList(){
        multimediaDH?.videos(){
            (result: [Video]) in
            self.videoList = result
            XCTAssertGreaterThan(self.videoList.count, 0, "Les videos n'ont pas été récuperées")
        }
    }
    
}
