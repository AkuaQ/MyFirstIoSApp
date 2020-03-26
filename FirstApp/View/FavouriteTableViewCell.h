//
//  FavouriteTableViewCell.h
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/26.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavouriteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsLabel;

@end

NS_ASSUME_NONNULL_END
