//
//  ViewController.m
//  charactercounter
//
//  Created by ANIBAL ASPRILLA LOPEZ on 01/09/14.
//  Copyright (c) 2014 Sergio Daniel Lozano Garcia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.word = [[Word alloc] init];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) onContarButtonTap : (UIButton*) sender
{
    self.word.word = self.wordText.text;
    NSString* resultMessage = [[NSString alloc] initWithFormat:@"Escribiste %li caracteres", (long)self.word.numberOfCharacters];
    self.messageCaption.text = resultMessage;
    [self.wordText resignFirstResponder];
}

@end
