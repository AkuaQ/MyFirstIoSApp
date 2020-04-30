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
#import <Dev_Pod-umbrella.h>
#import <CoreData/CoreData.h>

@interface FavouritesObjectiveCViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *favouritesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIButton *profileImageButton;
@property ProfileRepo* profileImageRepo;
@property UIImage* profileImage;
@end

@implementation FavouritesObjectiveCViewController

FavouriteViewModel *favouriteViewModel;
UIImagePickerController *imagePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.profileImageRepo = [[ProfileRepo alloc] init];
    [self.navigationController.navigationBar.topItem setTitle:@"Profile"];
    [AnalyticsRecipeRepo favouritePageTabTapped];
}

- (void) viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
    self.profileImageRepo = [[ProfileRepo alloc] init];
    self.profileImage = [self.profileImageRepo fetch];
    self.profileImageView.image = self.profileImage;
    favouriteViewModel = [[FavouriteViewModel alloc] init];
    [favouriteViewModel printFavourites:self.username completion:^(NSMutableArray<FavouriteModel*>* result){
        favouriteViewModel.collectionArray = result;
        [self.tableView reloadData];
    }];
}
- (IBAction)profileImageButtonTapped:(id)sender {
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker  didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.profileImageRepo = [[ProfileRepo alloc] init];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.profileImageRepo save:UIImagePNGRepresentation(image)];
    
    self.profileImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)aboutButtonTapped:(UIButton *)sender {
    UIViewController *pageController       = [[self storyboard] instantiateViewControllerWithIdentifier:@"PageViewController"];
    [self.navigationController pushViewController:pageController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return favouriteViewModel.collectionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
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
