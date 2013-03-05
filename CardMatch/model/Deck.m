//
//  Deck.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(strong,nonatomic)NSMutableArray *cards;
@end

@implementation Deck
-(NSMutableArray* ) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}




-(void)addCard:(Card *)card atTop:(bool)atTop{
    if (card){
        if (atTop){
            [self.cards insertObject:card atIndex:0];
        }else {
            [self.cards addObject:card];
        }
    }
}


-(Card*)drawRandomCard{
    Card* randomcard = nil;
    if (self.cards.count){
        int index = arc4random()%self.cards.count;
        randomcard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomcard;
}













@end
