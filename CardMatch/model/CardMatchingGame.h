//
//  CardMatchingGame.h
//  CardMatch
//
//  Created by Hongzheng Shi on 2/14/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"
#import "Deck.h"
@interface CardMatchingGame : NSObject
//designated initializer
-(id)initWithCardCount:(int)count
             usingDeck:(Deck *) deck;
-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property (readonly,nonatomic)int score;
@end
