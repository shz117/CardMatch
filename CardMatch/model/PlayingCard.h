//
//  PlayingCard.h
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString* suit;
@property (nonatomic) int rank;
+(NSArray *) validSuits;
+(int) maxRank;





@end
