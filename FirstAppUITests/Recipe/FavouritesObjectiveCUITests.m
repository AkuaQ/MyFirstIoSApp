//
//  FavouritesObjectiveCUITests.m
//  FirstAppUITests
//
//  Created by Akua Afrane-Okese on 2020/03/30.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FavouritesObjectiveCUITests : XCTestCase

@end

@implementation FavouritesObjectiveCUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
}

- (void)tearDown {
}

- (void)testGivenFavouritesTabReturnSuccess {
        XCUIApplication *application = [[XCUIApplication alloc] init];
    [application launch];
    XCUIElement* loginButton = application.buttons[@"Login"];
    [loginButton tap];
    XCUIElement* emailLogin = application.textFields[@"emailLogin"];
    [emailLogin tap];
    [emailLogin typeText:@"tester@test.com"];
    XCUIElement* password = application.secureTextFields[@"passwordLogin"];
    [password tap];
    [password typeText: @"testpassword1?"];
    XCUIElement* logInButton = application.buttons[@"Log in"];
    [logInButton tap];
    sleep(8);
    XCUIElement* tabFavourites = application.tabBars.buttons[@"Favourites"];
    [tabFavourites tap];
    sleep(2);
    XCTAssertTrue(application.staticTexts[@"My Favourites:"].exists);
}

- (void)testGivenFavouritesListAddRemoveFavouriteReturnSuccess {
        XCUIApplication *application = [[XCUIApplication alloc] init];
    [application launch];
    XCUIElement* loginButton = application.buttons[@"Login"];
    [loginButton tap];
    XCUIElement* emailLogin = application.textFields[@"emailLogin"];
    [emailLogin tap];
    [emailLogin typeText:@"tester@test.com"];
    XCUIElement* password = application.secureTextFields[@"passwordLogin"];
    [password tap];
    [password typeText: @"testpassword1?"];
    XCUIElement* logInButton = application.buttons[@"Log in"];
    [logInButton tap];
    sleep(8);
    XCUIElement* tabRecipes = application.tabBars.buttons[@"Recipe List"];
    [tabRecipes tap];
    sleep(2);
    XCUIElement* searchRecipes = application.searchFields[@"Search for recipes"];
    [searchRecipes tap];
    [searchRecipes typeText:@"Chocolate cake"];
    XCUIElement* search = application.buttons[@"search"];
    [search tap];
    sleep(8);
    XCUIElement* recipe = application.staticTexts[@"Tim and Tracy's Chocolate Cake (Boiled)"];
    [recipe tap];
    XCUIElement* favouriteButton = application.buttons[@"favouritesButton"];
    [favouriteButton tap];
    XCUIElement* backButton = application.buttons[@"Recipe List"];
    [backButton tap];
    XCUIElement* tabFavourites = application.tabBars.buttons[@"Favourites"];
    [tabFavourites tap];
    sleep(8);
    [tabRecipes tap];
    [recipe tap];
    [favouriteButton tap];
    [backButton tap];
    [tabFavourites tap];
     sleep(8);
    XCTAssertTrue(application.staticTexts[@"My Favourites:"].exists);
}

@end
