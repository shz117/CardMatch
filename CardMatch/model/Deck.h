//
//  Deck.h
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "card.h"

@interface Deck : NSObject
-(void) addCard:(Card *)card atTop:(bool)atTop;
-(Card*) drawRandomCard;
                        
                        

@end
