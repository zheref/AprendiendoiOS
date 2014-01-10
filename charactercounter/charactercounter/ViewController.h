//
//  ViewController.h
//  charactercounter
//
//  Created by ANIBAL ASPRILLA LOPEZ on 01/09/14.
//  Copyright (c) 2014 Sergio Daniel Lozano Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface ViewController : UIViewController

// Public property signatures
@property (weak, nonatomic) IBOutlet UITextField *wordText;
@property (weak, nonatomic) IBOutlet UILabel *messageCaption;
@property (strong, nonatomic) Word* word;

// Public method signatures
- (IBAction) onContarButtonTap: (UIButton*) sender;

@end
