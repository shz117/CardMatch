//
//  CardcontrollViewController.m
//  CardMatch
//
//  Created by Hongzheng Shi on 2/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "CardcontrollViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"



@interface CardcontrollViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipslable;
@property (nonatomic) int flipCount;
//@property (nonatomic,strong)Deck * deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic) CardMatchingGame *game;
@end


@implementation CardcontrollViewController

-(CardMatchingGame *)game
{
    if (!_game) {_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardsButtons count] usingDeck:[[PlayingCardDeck alloc] init]];}
    return _game;
}



//-(Deck *)deck
//{
//    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
//    return _deck;
//}

-(void)setCardsButtons:(NSArray *)cardsButtons{
    _cardsButtons = cardsButtons;
    [self updateUI];
//    for (UIButton *button in self.cardsButtons){
//        Card* card = [self.deck drawRandomCard];
//        [button setTitle:card.contents forState: UIControlStateSelected];
//        
//    }
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardsButtons){
        Card *card = [self.game cardAtIndex:[self.cardsButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceup;
        cardButton.enabled = !card.isunplayable;
        cardButton.alpha = (card.isunplayable?0.3:1.0);
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score:%d",self.game.score];
}

-(void)setFlipCount:(int)flipCount{
    _flipCount  = flipCount;
    self.flipslable.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
}

- (IBAction)flipcard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardsButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

@end
//