//
//  Card.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Card.h"
@interface Card()
@end

@implementation Card
@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;
-(BOOL) isfaceUp{
    return _faceUp;
}
-(void) setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
}
-(BOOL) unplayable{
    return _unplayable;
}
-(void) setUnplayable:(BOOL)unplayable{
    _unplayable = unplayable;
}

-(int)match:(NSArray *)othercards{
    int score = 0;
    for (Card *card in othercards){
        if ([card.contents isEqualToString:self.contents]) {
        score++;
        }
    }
    return score;
}


















@end
