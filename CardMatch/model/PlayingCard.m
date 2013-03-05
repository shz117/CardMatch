//
//  PlayingCard.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "PlayingCard.h"
@interface PlayingCard()

@end


@implementation PlayingCard

-(int)match:(NSArray *)othercards{
    int score =0;
    if ([othercards count] == 1) {
        PlayingCard *otherCard = [othercards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        } else if (otherCard.rank == self.rank){
            score= 4;
        }
    }
    return score;
}

-(NSString*) contents {
    NSArray* rankstrings = [PlayingCard rankStrings];
    return [rankstrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

-(void) setSuit:(NSString *) suit{
    if ([PlayingCard.validSuits containsObject:suit])
    { _suit = suit; }
}

-(NSString *) suit{
    return _suit?_suit:@"?";
}

+(NSArray *) validSuits{
    return @[@"♠",@"♣",@"♥",@"♦"];
}

+(NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(int) maxRank{
    return [PlayingCard rankStrings].count-1;
}

-(void) setRank:(int)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end
