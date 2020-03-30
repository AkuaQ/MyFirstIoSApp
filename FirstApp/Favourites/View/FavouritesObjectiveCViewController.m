//
//  FavouritesObjectiveCViewController.m
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/20.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import "FavouritesObjectiveCViewController.h"
#import "FavouriteTableViewCell.h"
#import "FavouriteObjectiveCViewModel.h"
#import "FavouriteObjectiveCModel.h"
#import <FirstApp-Swift.h>
#import <Dev_Pod-Swift.h>

@interface FavouritesObjectiveCViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *favouritesLabel;

@end

@implementation FavouritesObjectiveCViewController

FavouriteViewModel *favouriteViewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar.topItem setTitle:@"Food Finder"];
    [AnalyticsRecipeRepo favouritePageTabTapped];
}

- (void) viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
    favouriteViewModel = [[FavouriteViewModel alloc] init];
    [favouriteViewModel printFavourites:self.username completion:^(NSMutableArray<FavouriteModel*>* result){
        favouriteViewModel.collectionArray = result;
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return favouriteViewModel.collectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"FavouriteCell";
    FavouriteTableViewCell *cell = (FavouriteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[FavouriteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier];
    }

    cell.titleLabel.text = [favouriteViewModel.collectionArray objectAtIndex:indexPath.row].title;
    cell.ingredientsLabel.text = [favouriteViewModel.collectionArray objectAtIndex:indexPath.row].ingredients;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [favouriteViewModel.collectionArray objectAtIndex:indexPath.row].thumbnail]];
    cell.imageView.image = [UIImage imageWithData: imageData];
    return cell;
}
@end
