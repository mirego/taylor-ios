//
//  UIViewSafeAreaTests.swift
//  TaylorTests
//
//  Created by Antoine Lamy on 2017-12-28.
//  Copyright © 2017 Mirego. All rights reserved.
//

import XCTest
import Taylor

class UIViewSafeAreaTests: XCTestCase {
    private var viewController: TestViewController!
    private var navigationController: UINavigationController!
    private var window: UIWindow!

    override class func setUp() {
        super.setUp()
        UIViewController.enableCompatibilitySafeAreaInsets()
    }
    
    override func setUp() {
        super.setUp()
        viewController = TestViewController()
        navigationController = UINavigationController(rootViewController: viewController)
    }

    override func tearDown() {
        super.tearDown()
        viewController = nil
        navigationController = nil
        window = nil
    }

    private func setupWindow(with viewController: UIViewController) {
        window = UIWindow()
        window.rootViewController = viewController
        window.addSubview(viewController.view)

        // Testing UIViewController's layout methods is kind of bad
        // but needed in our case so we need to wait some time
        RunLoop.current.run(until: Date().addingTimeInterval(1))
    }

    func testOpaqueNavigationBar() {
        navigationController.navigationBar.barStyle = .blackOpaque
        navigationController.navigationBar.isTranslucent = false
        setupWindow(with: navigationController)

        let expectedSafeAreaInsets = UIEdgeInsets.zero
        let expectedOffsetViewSafeAreaInsets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            XCTAssertEqual(viewController.view.safeAreaInsets, expectedSafeAreaInsets)
            XCTAssertEqual(viewController.mainView.offsetView.safeAreaInsets, expectedOffsetViewSafeAreaInsets)
            XCTAssertFalse(viewController.mainView.safeAreaInsetsDidChangeCalled)
        }
        XCTAssertEqual(viewController.mainView.compatibilitySafeAreaInsets, expectedSafeAreaInsets)
        XCTAssertEqual(viewController.mainView.offsetView.compatibilitySafeAreaInsets, expectedOffsetViewSafeAreaInsets)
        XCTAssertFalse(viewController.mainView.compatibilitySafeAreaInsetsDidChangeCalled)
    }

    func testTranslucentNavigationBar() {
        let expectedSafeAreaInsets: UIEdgeInsets
        let expectedOffsetViewSafeAreaInsets: UIEdgeInsets
        if #available(iOS 11.0, *) {
            viewController.additionalSafeAreaInsets = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 0)
            expectedSafeAreaInsets = UIEdgeInsets(top: 54, left: 10, bottom: 30, right: 0)
            expectedOffsetViewSafeAreaInsets = UIEdgeInsets(top: 44, left: 10, bottom: 0, right: 0)
        } else {
            expectedSafeAreaInsets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
            expectedOffsetViewSafeAreaInsets = UIEdgeInsets(top: 34, left: 0, bottom: 0, right: 0)
        }
        navigationController.navigationBar.barStyle = .blackTranslucent
        setupWindow(with: navigationController)


        if #available(iOS 11.0, *) {
            XCTAssertEqual(viewController.view.safeAreaInsets, expectedSafeAreaInsets)
            XCTAssertEqual(viewController.mainView.offsetView.safeAreaInsets, expectedOffsetViewSafeAreaInsets)
            XCTAssertTrue(viewController.mainView.safeAreaInsetsDidChangeCalled)
        }
        XCTAssertEqual(viewController.mainView.compatibilitySafeAreaInsets, expectedSafeAreaInsets)
        XCTAssertEqual(viewController.mainView.offsetView.compatibilitySafeAreaInsets, expectedOffsetViewSafeAreaInsets)
        XCTAssertTrue(viewController.mainView.compatibilitySafeAreaInsetsDidChangeCalled)
    }
}

fileprivate class TestViewController: UIViewController, IgnoreNewerSafeAreaInsets {
    var mainView: TestView { return self.view as! TestView }
    override func loadView() {
        self.view = TestView()
    }
}

fileprivate class TestView: UIView, CompatibilitySafeAreaInsetsUpdate, IgnoreNewerSafeAreaInsets {
    let offsetView = UIView()
    var safeAreaInsetsDidChangeCalled: Bool = false
    var compatibilitySafeAreaInsetsDidChangeCalled: Bool = false

    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.red

        offsetView.backgroundColor = UIColor.green
        addSubview(offsetView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        offsetView.frame = CGRect(x: 0, y: 10, width: bounds.width, height: 100)
    }

    func compatibilitySafeAreaInsetsDidChange() {
        compatibilitySafeAreaInsetsDidChangeCalled = true
    }

    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        safeAreaInsetsDidChangeCalled = true
    }
}
