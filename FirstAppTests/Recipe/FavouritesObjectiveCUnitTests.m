//
//  FavouritesObjectiveCUnitTests.m
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/31.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Dev_Pod-umbrella.h>
@interface FavouritesObjectiveCUnitTests : XCTestCase

@end

@implementation FavouritesObjectiveCUnitTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGivenRecipeReturnNotNil{
    FavouriteModel* favouriteModel = [FavouriteModel alloc];

    favouriteModel = [favouriteModel initWithName:@"Cookies" andIngredients:@"butter, eggs, flour, sugar" andWebsite:@"www.recipe.com" andImage:@"www.thumbnail_recipe.com"];
    XCTAssertNotNil(favouriteModel);
}

@end
