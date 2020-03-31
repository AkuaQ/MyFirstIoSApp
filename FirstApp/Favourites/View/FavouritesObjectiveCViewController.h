//
//  FavouritesObjectiveCViewController.h
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/20.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Dev_Pod-umbrella.h>
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface FavouritesObjectiveCViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property NSString *username;
@property (nonatomic, readwrite) FIRFirestore *db;
@end

NS_ASSUME_NONNULL_END
