//
//  PageViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/04/06.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .forward,
                animated: true,
                completion: nil)
        }
    }

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "Recipe"),
                self.newColoredViewController(color: "Favourite")]
    }()

    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)PageViewController")
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }

            let previousIndex = viewControllerIndex - 1

            guard previousIndex >= 0 else {
                return orderedViewControllers.last
            }

            guard orderedViewControllers.count > previousIndex else {
                return nil
            }

            return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }

            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count

            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
            }

            guard orderedViewControllersCount > nextIndex else {
                return nil
            }

            return orderedViewControllers[nextIndex]
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?
            .first, let firstViewControllerIndex = orderedViewControllers
                .firstIndex(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }
}
