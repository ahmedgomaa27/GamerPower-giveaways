//
//  GiveawayViewModelTests.swift
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

import XCTest
@testable import Giveaways

class GiveawayViewModelTests: XCTestCase {

    var viewModel: GiveawayViewModel!
    let service = MockGiveawayService()

    override func setUp() {
        super.setUp()
        viewModel = GiveawayViewModel(service: service)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadGiveaways() async {
        await viewModel.fetchGiveaways(selectedPlatform: .all)
        XCTAssertFalse(viewModel.giveaways.isEmpty)
    }
    
    func testFailedLoadGiveaways() async {
        service.throwError = true
        await viewModel.fetchGiveaways(parameters: [:])
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
