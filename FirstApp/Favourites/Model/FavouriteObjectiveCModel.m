//
//  FavouriteObjectiveCModel.m
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/27.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavouriteObjectiveCModel.h"

@implementation FavouriteModel

- (id)initWithName:(NSString *)title
andIngredients:(NSString *)ingredients
andWebsite:(NSString *)href
          andImage:(NSString *)thumbnail {
    self = [super init];
    if (self) {
        self.title = title;
        self.ingredients = ingredients;
        self.href = href;
        self.thumbnail = thumbnail;
    }
    return self;
}
@end
