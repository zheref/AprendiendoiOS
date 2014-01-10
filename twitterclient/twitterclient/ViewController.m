//
//  ViewController.m
//  twitterclient
//
//  Created by ANIBAL ASPRILLA LOPEZ on 01/10/14.
//  Copyright (c) 2014 Sergio Daniel Lozano Garcia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Private property signatures
@property (strong, nonatomic) NSURLSession* session;
@property (strong, nonatomic) NSURLSessionConfiguration* sessionConfiguration;

// Private method signatures
/*
- (void) onRequestCompletionHandler: (NSData*) data, (NSURLResponse*) response, (NSError*) error) {
    
}
 */

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.menuItems = [[NSMutableArray alloc] init];
    
    NSURL* url = [NSURL URLWithString: @"http://mejorandoios.herokuapp.com/api/courses/all"];
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    
    self.sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration: self.sessionConfiguration];
    
    NSURLSessionTask* task = [self.session dataTaskWithRequest: request
                                           completionHandler: ^(NSData* data, NSURLResponse* response, NSError* error) {
                                               NSHTTPURLResponse* urlResponse = (NSHTTPURLResponse*) response;
                                               
                                               if (urlResponse.statusCode == 200) {
                                                   NSLog(@"It came to 200 status");
                                                   [self handleResults: data];
                                               }
                                           }
                              ];
    
    [task resume];
    
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.0
}

- (void) handleResults: (NSData*) data
{
    NSError* jsonError;
    NSDictionary* response = [NSJSONSerialization JSONObjectWithData: data
                                                  options:            NSJSONReadingAllowFragments
                                                  error:              &jsonError];
    if (response)
    {
        NSLog(@"%@", response[@"data"]);
        
        for (NSDictionary* dataDictionary in response[@"data"])
        {
            [self.menuItems addObject: dataDictionary];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tweetsCollection reloadData];
        });
    }
}

// Public method implementations for UICollectionView
- (NSInteger) collectionView:         (UICollectionView*) collectionView
              numberOfItemsInSection: (NSInteger)         section        {
    return [self.menuItems count];
}

- (UICollectionViewCell*) collectionView:         (UICollectionView*) collectionView
                          cellForItemAtIndexPath: (NSIndexPath*)      indexPath       {
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell"
                                                 forIndexPath:                           indexPath];
    
    return cell;
    
}

@end
