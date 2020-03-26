//
//  FavouritesObjectiveCViewController.m
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/20.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

#import "FavouritesObjectiveCViewController.h"
#import "FavouriteTableViewCell.h"

@interface FavouritesObjectiveCViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *favouritesLabel;

@end

@implementation FavouritesObjectiveCViewController

NSMutableArray *collectionArray;
NSMutableArray *ingredientsArray;
NSMutableArray *imageArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar.topItem setTitle:@"Food Finder"];
    self.db = [FIRFirestore firestore];
}

- (void) viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
    collectionArray = [[NSMutableArray alloc] init];
    ingredientsArray = [[NSMutableArray alloc] init];
    imageArray = [[NSMutableArray alloc] init];
   [[[self.db collectionWithPath:@"favourites"] queryWhereField:@"username" isEqualTo:self.username]
   getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
     if (error != nil) {
       NSLog(@"Error getting documents: %@", error);
     } else {
       for (FIRDocumentSnapshot *document in snapshot.documents) {
           [collectionArray addObject:document.data[@"title"]];
           [ingredientsArray addObject:document.data[@"ingredients"]];
           [imageArray addObject:document.data[@"thumbnail"]];
           [self.tableView reloadData];
       }
     }
   }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [collectionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"FavouriteCell";
 
    FavouriteTableViewCell *cell = (FavouriteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil) {
        cell = [[FavouriteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: simpleTableIdentifier];
    }
    
    cell.titleLabel.text = [collectionArray objectAtIndex:indexPath.row];
    cell.ingredientsLabel.text = [ingredientsArray objectAtIndex:indexPath.row];
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [imageArray objectAtIndex:indexPath.row]]];
    cell.imageView.image = [UIImage imageWithData: imageData];
    return cell;
}
@end
