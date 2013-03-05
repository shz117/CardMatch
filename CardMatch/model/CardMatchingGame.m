//
//  CardMatchingGame.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/14/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (readwrite,nonatomic) int score;
@property (strong,nonatomic) NSMutableArray *cards; //of Card
@end
@implementation CardMatchingGame

-(NSMutableArray*) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1;

-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isunplayable){
        if (!card.isFaceup) {
            for (Card* otherCard in self.cards) {
                if (otherCard.isFaceup && !otherCard.isunplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore){
                        [card setUnplayable:YES];
                        [otherCard setUnplayable:YES];
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        [otherCard setFaceUp:NO];
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceup;
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index]:nil;
}

-(id)initWithCardCount:(int)count
             usingDeck:(Deck *) deck;
{
    self = [super init];
    if (self){
        for (int i = 0; i < count; i++){
            Card* card = [deck drawRandomCard];
            if (card) {
            self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}
@end
