//
//  ViewController.h
//  twitterclient
//
//  Created by ANIBAL ASPRILLA LOPEZ on 01/10/14.
//  Copyright (c) 2014 Sergio Daniel Lozano Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

// Public property signatures
@property (weak, nonatomic) IBOutlet UICollectionView* tweetsCollection;
@property (strong, nonatomic) NSMutableArray* menuItems;

@end
