//
//  PlayingCardDeck.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
-(id)init {
    self = [super init];
    if (self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (int rank = 0;rank < [PlayingCard maxRank]; rank++){
                PlayingCard* card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
            
    }
    return self;
}
@end
