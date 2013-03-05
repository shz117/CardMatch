//
//  Card.h
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceup) BOOL faceUp;
@property (nonatomic,getter = isunplayable) BOOL unplayable;
-(int)match:(NSArray*) othercards;



@end
