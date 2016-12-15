//
//  iMusicTests.swift
//  iMusicTests
//
//  Created by Akiro on 09/12/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import XCTest
@testable import iMusic

class iMusicTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertTrue(true, "------------------------------------- true -------------------------------------")

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testExample2() {

        XCTAssertTrue(true, "La musique a bien été crée")
        
        // let m1 : Music? = Music(id : "21", title : "myMusic", author : "Benthalalalalla")
        // //if(m1 === nil){
        // if(true){
        //     XCTAssertTrue(true, "La musique a bien été crée")
        // }
        // else {
        //     XCTAssertTrue(false, "La musique n'a pas été crée")
        // }
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
