//
//  CMVTextForGame.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 12/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMVGameViewController.h"

@interface CMVTextForGame : NSObject


@property(strong,nonatomic)UITextView *descriptionView;
@property (nonatomic, strong)NSString * textToBeRead;
@property(strong, nonatomic)CMVGameViewController *viewController;
-(void)updateOurJackpots;

-(NSMutableAttributedString *)fairRoulette;
-(NSMutableAttributedString *)multipleChances;
-(NSMutableAttributedString *)simpleChances;
-(NSMutableAttributedString *)sectorAndFinals;
-(NSMutableAttributedString *)generalRules;

-(NSMutableAttributedString *)frenchRoulette;
-(NSMutableAttributedString *)generalFrench;
-(NSMutableAttributedString *)sectorFrench;


-(NSMutableAttributedString *)blackJack;
-(NSMutableAttributedString *)variationsBJ;
-(NSMutableAttributedString *)generalBJ;

-(NSMutableAttributedString *)midTrenteEtQuarante;
-(NSMutableAttributedString *)apresMTQ;
-(NSMutableAttributedString *)generalMTQ;

-(NSMutableAttributedString *)texasHold;
-(NSMutableAttributedString *)differentTH;
-(NSMutableAttributedString *)flopTH;
-(NSMutableAttributedString *)betTH;
-(NSMutableAttributedString *)notesTH;

-(NSMutableAttributedString *)puntoBanco;
-(NSMutableAttributedString *)notesPunto;

-(NSMutableAttributedString *)chemin;
-(NSMutableAttributedString *)cheminTheGame;
-(NSMutableAttributedString *)playingChemin;
-(NSMutableAttributedString *)generalChemin;

-(NSMutableAttributedString *)carribeanPoker;
-(NSMutableAttributedString *)progresiveCarribean;
-(NSMutableAttributedString *)generalCarribean;

-(NSMutableAttributedString *)whatWeOffer;
-(NSMutableAttributedString *)whatsNew;
-(NSMutableAttributedString *)slotMachineRooms;


-(NSMutableAttributedString *)tapTheRoll;

@end
