//
//  FavouriteObjectiveCViewModel.h
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/27.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouriteObjectiveCModel.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN
@interface FavouriteViewModel: NSObject
@property (nonatomic, readwrite) FIRFirestore *db;
@property NSMutableArray<FavouriteModel*> *collectionArray;
- (void)printFavourites: (NSString *) username
completion: (void (^)(NSMutableArray<FavouriteModel*>*))completionBlock;
- (void)addFavourite: (NSString *) username : (NSString *) title;
@end

NS_ASSUME_NONNULL_END
