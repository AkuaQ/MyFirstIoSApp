//
//  FavouritesViewModelObjectiveCUnitTests.m
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/31.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Dev_Pod-umbrella.h>
@interface FavouritesViewModelObjectiveCUnitTests : XCTestCase

@end

@implementation FavouritesViewModelObjectiveCUnitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGivenFavouriteViewModelReturnSuccess {
    FavouriteViewModel *favouriteViewModel;
    favouriteViewModel = [[FavouriteViewModel alloc] init];
    [favouriteViewModel printFavourites:@"tester@test.com" completion:^(NSMutableArray<FavouriteModel*>* result){
    }];
    XCTAssertNotNil(favouriteViewModel);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
