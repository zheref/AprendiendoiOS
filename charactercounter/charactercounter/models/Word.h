//
//  Word.h
//  charactercounter
//
//  Created by ANIBAL ASPRILLA LOPEZ on 01/09/14.
//  Copyright (c) 2014 Sergio Daniel Lozano Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

// Public property signatures

@property (strong, nonatomic) NSString* word;
@property (strong, nonatomic) NSString* key;

// Public method signatures
- (NSInteger) numberOfCharacters;

@end
