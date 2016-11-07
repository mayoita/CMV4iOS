//
//  CMVTextForGame.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 12/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTextForGame.h"
#import "CMVLocalize.h"



@interface CMVTextForGame ()
    

@property(strong, nonatomic)NSString *textForJackpot;
@end

@implementation CMVTextForGame



-(NSDictionary *)secondAttributes {
    NSMutableParagraphStyle *mutParaStyleCenter=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleCenter setAlignment:NSTextAlignmentJustified];
    
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:1.0];
    [shadowDic setShadowColor:[UIColor blackColor]];
    [shadowDic setShadowOffset:CGSizeMake(0, 1)];
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor whiteColor],
                 NSFontAttributeName:[UIFont fontWithName:GAME_TITLE_FONT size:GAME_TITLE_SIZE],
                 NSShadowAttributeName:shadowDic,
                 NSParagraphStyleAttributeName:mutParaStyleCenter};
    } else {
    return @{NSForegroundColorAttributeName: BRAND_YELLOW_COLOR,
             NSFontAttributeName:GOTHAM_BOOK(16),
             NSShadowAttributeName:shadowDic,
             NSParagraphStyleAttributeName:mutParaStyleCenter};
    }
  
}


-(NSDictionary *)firstAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    mutParaStyleJustified.lineSpacing=2.0;
    
    if (iPHONE) {
    return @{NSForegroundColorAttributeName: [UIColor whiteColor],
             NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT size:GAME_TEXT_SIZE],
             NSParagraphStyleAttributeName:mutParaStyleJustified};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor whiteColor],
                 NSFontAttributeName:GOTHAM_BOOK(14),
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    }
}

-(NSDictionary *)thirdAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    
    if (iPHONE) {
    return @{NSForegroundColorAttributeName: [UIColor redColor],
             NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT size:GAME_TEXT_SIZE],
             NSParagraphStyleAttributeName:mutParaStyleJustified};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor redColor],
                 NSFontAttributeName:GOTHAM_Medium(12),
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    }
}

-(NSDictionary *)fourthAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    
      if (iPHONE) {
    return @{NSForegroundColorAttributeName: [UIColor blackColor],
             NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT size:GAME_TEXT_SIZE],
             NSParagraphStyleAttributeName:mutParaStyleJustified};
      } else {
          return @{NSForegroundColorAttributeName: [UIColor blackColor],
                   NSFontAttributeName:GOTHAM_Medium(12),
                   NSParagraphStyleAttributeName:mutParaStyleJustified};
      }
}

#pragma FairRoulette

-(NSMutableAttributedString *)fairRoulette {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    NSString *myString=@"";
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
           myString=@"A Ca' Vendramin Calergi e a Ca' Noghera è possibile giocare a questa variante dinamica della Roulette Francese, la Fair Roulette.\n\nTra le differenze più significative osserviamo la dimensione del tavolo e la forma del tracciato (tableau), il cilindro (le cylindre) con i numeri disposti in maniera analoga ma privo delle quattro impugnature utilizzate per invertirne la rotazione, la presenza del Capo Tavolo (Chef de Table) e di un solo impiegato (croupier), la dotazione della banca formata da gettoni di valore, ma soprattutto di colore: e infine le procedure per i pagamenti effettuati per colore in modo cumulativo.\n\nOgni tavolo presenta una dotazione di gettoni dello stesso valore nominale, se non diversamente indicato, che si differenziano tra loro per il colore: a ciascun giocatore ne viene attribuito uno personale. Questo accorgimento agevola il cliente nell'individuazione delle proprie giocate ed elimina le possibili contestazioni relative alle puntate e vincite.\n\nÈ importante ricordare che i gettoni di colore portano impresso il numero del tavolo di appartenenza, pertanto possono essere giocati soltanto su quello indicato.\n\nIl giocatore effettua personalmente le proprie puntate, però, se lo desidera, ha la possibilità di consegnare al croupier gli annunci riguardanti la Serie 5/8, i Vicini dello Zero, gli Orfanelli e il numero con i suoi laterali sul cilindro, due a destra e due a sinistra.\n\nIl gioco è molto semplice: si scommette contro il banco cercando di indovinare in quale numero cadrà la pallina lanciata dal croupier (le bouler). Le puntate vincenti daranno diritto a dei premi proporzionali sia al valore dei gettoni che al tipo di combinazione scelta.\n\nLa partita inizia con il tradizionale invito rivolto dall'impiegato: \"Messieurs faites vos jeux\" e termina dopo il lancio della boule con il consueto \"Rien ne va plus\". Da questo momento in poi non sono più permesse le puntate, solamente il Capo Tavolo, in alcuni casi, può concedere una deroga.\n\nLa pallina determina il numero vincente quando si ferma in una delle trentasette caselle del cilindro, il croupier lo annuncia in francese dichiarando le relative combinazioni semplici (rouge o noir, pair o impair, manque o passe), contemporaneamente evidenzia con il dolly il numero corrispondente riportato sul tracciato (tableau) ed elenca le vincite; subito dopo \"libera il tappeto\" ritirando i gettoni perdenti.\n\nConclusa questa fase predispone i pagamenti rispettando un ordine prestabilito: colonne, chances semplici, dozzine, infine, dopo aver individuato i proprietari, paga le vincite sulle chances multiple, facendo sempre riferimento alla posizione dei gettoni sul tappeto, iniziando da quelli di colore e terminando con quelli di valore.\n\nCon l'uscita dello 0 vincono le puntate sul numero e sulle sue combinazioni multiple, perdono le colonne e dozzine, mentre le puntate sulle combinazioni semplici, dimezzando il proprio valore, vengono subito divise fra il giocatore e il banco (à partager). Nel caso in cui sulle chances vi sia un numero dispari di gettoni, quello indivisibile rimarrà \"in prigione\" (en prison) vincolato nell'apposita linea. Il colpo successivo, se risulterà vincente, verrà liberato, mentre sarà incamerato se perdente.";
            break;
        default:
            
            myString=@"This dynamic variation of French Roulette, namely Fair Roulette, can be played at both Ca' Vendramin Calergi and Ca' Noghera.\n\nOne of the main differences is the size of the table and the format of the grid (tableu), another is the wheel (le cylindre) that has the numbers positioned in the same way but does not have the four handles used to reverse rotation. There is a supervisor (Chef de Table) and only one (croupier). The bank is equipped with value chips, but mainly colour chips, and last of all payments are made cumulatively by colour.\n\nEach table is equipped with chips of the same value, unless specified otherwise, divided into different colours. Each player has their own colour so they can spot their stakes more easily. This avoids any possible disputes over stakes and wins.\n\nIt is important to remember that colour chips have the number of the table they belong to engraved on them and may not be used at any other table.\n\nPlayers Lay their stakes personally, but they can call classic bets to the Croupier such as the 5/8 Series, “Voisins du Zéro” (next to zeros), “orphans” and neighbours, i.e. a certain number plus the two numbers on either side of it.\n\nThe game is very simple and involves betting against the bank by attempting to guess on which number the boule thrown by the croupier (le bouler) will land. Winning bets are paid in proportion to both the value of the chips staked and the type of combination chosen.\n\nEach game begins with the croupier’s traditional invitation: “Messieurs faites vos jeux” and ends when the boule is tossed with the customary phase, “Rien ne va plus”. From this point on, no more bets may be laid, and only in very rare circumstances does the supervisor (Chef de Table) make an exception.\n\nThe boule determines the winning number when it lands in one of the thirty-seven pockets on the wheel, the croupier announces the number in French and lists the winning combinations (rouge o noir, pair o impair, manque o passe), pointing out with the dolly the corresponding number on the grid (tableau). Having waited for a few seconds the croupier then rakes in the losing chips.\n\nThe croupier then pays out the winners in the following order: columns, simple combinations, dozen, and then, having identified the winners, the various multiple combination wins are paid according to the position of the chips on the grid, beginning with the colour chips and finishing with the value chips.\n\nIf the boule lands on 0 the bets laid on 0 and its various multiple combinations win, columns and dozen all lose, and simple combination stakes are halved in value and split immediately between the player and the bank (à partager). If an odd number of chips have been staked on the latter (chance), the chip that cannot be split remains on the table, imprisoned (en prison) on the appropriate line. If it wins in the next round it is freed, whereas if it loses it passes to the bank.";
            break;
    }
   
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];

    
     return attMyString;
}

-(NSMutableAttributedString *)multipleChances {
     NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString=@"Numero Pieno (En Plein)\nÈ formato da un numero singolo (dallo 0 al 36): si punta posizio-nando il gettone sulla casella del numero prescelto.\n\nCavallo (Cheval)\nÈ formato da due numeri attigui, lo si individua pronunciando entrambi i numeri (dal minore al maggiore), può essere orizzontale e verticale. La puntata si effettua posizionando il gettone sulla linea che separa i due numeri.\n\nTerzina o Trasversale Piena (Transversale Pleine)\nÈ formata da tre numeri progressivi situati sulla stessa linea orizzontale. La terzina è individuata pronun-ciando il primo e l'ultimo numero (dal minore al maggiore), si gioca posizionando il gettone sulla linea esterna del tracciato. È tradizione chiamare la prima terzina \"tre primi\" (trois premiers) e l'ultima \"tre ultimi\" (trois derniers).\n\nTrasversale dello Zero (Transversale du Zero)\nLe terzine, chiamate anche trasver-sali dello zero (transversales du zero), 0/1/2 e 0/2/3 hanno i numeri sul tacciato posizionati diversamente dalla terzina tradizionale.\n\nCarré (Carré)\nÈ formato dai quattro numeri, due sopra e due sotto, che compongono un quadrato. Si individua pronun-ciando il primo e l'ultimo numero (dal minore al maggiore), si punta posizionando il gettone al centro dei quattro numeri.\n\nQuattro Primi (Quatre Premiers)\nLa sequenza numerica 0/1/2/3 viene individuata con il nome \"quattro primi\" (quatre premiers). Si punta posizionando il gettone sulla linea esterna del tracciato tra lo 0, l'1 e la prima dozzina.\n\nSestina (Sixaine - Transversale Simple)\nÈ formata da sei numeri progres-sivi che compongono due terzine consecutive, una sopra e l'altra sotto. La si individua pronunciando il primo e l'ultimo numero (dal minore al maggiore). È tradizione chiamare la prima sestina \"sei primi\" (six premiers) e l'ultima \"sei ultimi\" (six derniers). Si punta posizio-nando il gettone sulla linea esterna del tracciato tra le due terzine.\n\nDozzina (Douzaine)\nSono tre, ognuna delle quali è formata da dodici numeri progressivi.\n\nPrima: dall'1 al 12 - douze premiers, seconda: dal 13 al 24 - douze milieu, terza: dal 25 al 36 - douze derniers.\nLa si individua pronunciando \"prima dozzina, dozzina di mezzo, ultima dozzina\". Si punta posizionando il gettone sugli appositi spazi situati sul tracciato.\n\nColonna (Colonne)\nSono tre, ognuna delle quali è formata da dodici numeri posizio-nati uno sotto l'altro sul tracciato. La si individua considerando tutti i numeri posizionati in colonna che partono dal 34, 35 o 36. Si punta collocando il gettone negli appositi spazi situati sotto la colonna dei numeri che la compongono.";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Numero Pieno (En Plein)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Cavallo (Cheval)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Terzina o Trasversale Piena (Transversale Pleine)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Trasversale dello Zero (Transversale du Zero)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Carré (Carré)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Quattro Primi (Quatre Premiers)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Sestina (Sixaine - Transversale Simple)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Dozzina (Douzaine)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Colonna (Colonne)"]];
            break;
        default:
            
           myString=@"Split (Cheval)\nThis is a bet placed on two adjoining numbers, either horizontal or vertical, and is announced by declaring both numbers (the lowest first). The bet is laid by placing the chip on the line that separates the two numbers.\n\nStreet (Transversale Pleine)\nThis is a bet on three numbers on the same horizontal line. To call a street bet, the first and last number must be announced (the lowest first). The chip is placed on the outside edge of the line on the grid.The first street is traditionally called the “first three” (trois premiers) and the last, the “last three” (trois derniers).\n\nZero Street (Transversale du Zero)\nThe streets known as the zero Streets (transversales du zero), i.e. 0/1/2 e 0/2/3, are distinguished because the position of the numbers on the grid are positioned differently to traditional streets.\n\nCorner (Carré)\nThis is a bet on four numbers forming a square, two above and two below. To call a corner bet, the first and last number must be announced (the lowest first).The chip is placed at the centre of the four numbers.\n\nFirst four (Quatre Premiers)\nThis is a bet on the sequence 0/1/2/3 known as the “first four” (quatre premiers). To lay this bet the chip is placed on the outside edge of the grid line between 0, 1 and the first dozen.\n\nSixline (Sixaine - Transversale Simple)\nThis is a bet on six numbers that make up two adjoining streets, one above the other. To call a sixline bet, the first and last number must be announced (the lowest first).The first sixline is traditionally called the “first six” (six premiers) and the last, the “last six” (six derniers). To lay this bet the chip is placed on the outside edge of the line between the two streets.\n\nDozen (Douzaine)\nThis is a bet on the first, second or third group of twelve consecutive numbers.The first: from1 to 12, the douze premiers, the second: from13to24, the douzemilieu, the third: from 25 to 36, the douze derniers.These bets are called by announcing “the first dozen, the middle dozen or the last dozen” and chips are placed in the appropriate spaces at the end of the grid.\n\nColumn (Colonne)\nThis is a bet on all twelve numbers on any of the three vertical lines (columns) on the grid starting from 34, 35 or 36. To lay this bet the chip is placed in the appropriate spaces under the relevant column of numbers.";
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Split (Cheval)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Street (Transversale Pleine)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Zero Street (Transversale du Zero)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Corner (Carré)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"First four (Quatre Premiers)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Sixline (Sixaine - Transversale Simple)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Dozen (Douzaine)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Column (Colonne)"]];
            break;
    }
    
    
    
    return attMyString;
}

-(NSMutableAttributedString *)simpleChances {
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    NSDictionary *thirdAttributes = [self thirdAttributes];
    NSDictionary *fourthAttributes = [self fourthAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString=@"Manque e Passe\nSono formati ciascuno da diciotto numeri:\nManque dall'1 al 18.\nPasse dal 19 al 36.\nSi puntano giocando il gettone negli appositi spazi (Manque o Passe) del tracciato.\n\nPari e Dispari (Pair et Impair)\nComprendono ciascuno diciotto numeri:\nImpair comprende i numeri dispari.\nPair comprende i numeri pari.\nSi puntano giocando il gettone negli appositi spazi (Impair o Pair) del tracciato.\n\nRosso e Nero (Rouge et Noir)\nSono formati ciascuno da diciotto numeri.\nSi puntano giocando il gettone negli appositi spazi (rosso o nero) del tracciato.\n\nRossi\n1-3-5-7-9-12-14-16-18\n19-21-23-25-27-30-32-34-36\n\nNeri\n2-4-6-8-10-11-13-15-17\n20-22-24-26-28-29-31-33-35";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Manque e Passe"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Pari e Dispari (Pair et Impair)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Rosso e Nero (Rouge et Noir)"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"Rossi"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"1-3-5-7-9-12-14-16-18"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"19-21-23-25-27-30-32-34-36"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"2-4-6-8-10-11-13-15-17"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"20-22-24-26-28-29-31-33-35"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"Neri"]];
            break;
        default:
            
            myString=@"Manque e Passe\nThese are bets that each consist of eighteen numbers:\nManque (low numbers) from 1 to 18\nPasse (high numbers) from 19 to 36.\nThese bets are laid by placing chips in the Manque or Passe spaces on the grid.\n\nOdds and Evens (Pair et Impair)\nThese are bets that each consist of eighteen numbers:\nImpair the odd numbers\nPair the even numbers.\nThese bets are laid by placing chips in the Impair or Pair spaces on the grid.\n\nRed and Black (Rouge et Noir)\nThese are bets that each consist of eighteen numbers.\n\nRED\n1 - 3 - 5 - 7 - 9 - 12 - 14 - 16 - 18\n19 - 21 - 23 - 25 - 27 - 30 - 32 - 34 - 36\n\nBLACK\n2 - 4 - 6 - 8 - 10 - 11 - 13 - 15 - 17\n20 - 22 - 24 - 26 - 28 - 29 - 31 - 33 - 35\n\nThese bets are laid by placing chips in the red or black spaces on the grid.";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Manque e Passe"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Odds and Evens (Pair et Impair)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Red and Black (Rouge et Noir)"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"RED"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"1 - 3 - 5 - 7 - 9 - 12 - 14 - 16 - 18"]];
            [attMyString setAttributes:thirdAttributes range:[myString rangeOfString:@"19 - 21 - 23 - 25 - 27 - 30 - 32 - 34 - 36"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"2 - 4 - 6 - 8 - 10 - 11 - 13 - 15 - 17"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"20 - 22 - 24 - 26 - 28 - 29 - 31 - 33 - 35"]];
            [attMyString setAttributes:fourthAttributes range:[myString rangeOfString:@"BLACK"]];
            break;
    }
    
    
    
    return attMyString;
}

-(NSMutableAttributedString *)sectorAndFinals {
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString=@"La Serie 5/8 e i Vicini dello Zero sono tradizionalmente tenuti \"pagati a piazzare\" dall'impiegato, i gettoni corrispondenti all'ammontare della giocata vengono collocati in appositi spazi disegnati sul tracciato. A numero uscito, il gettone, nella terzina e nel Carré dei Vicini dello Zero sono due, verrà piazzato solo se risulterà vincente un numero della combinazione giocata mentre sarà annullato se perdente.\n\nLa Serie 5/8 (Le Tiers du Cylindre)\nSi giocano dodici numeri con sei gettoni, e comprende i seguenti cavalli: 5/8 - 10/11 - 13/16 - 23/24 - 27/30 - 33/36.\n\nI Vicini dello Zero (Les Voisins du Zéro)\nSi giocano diciassette numeri con nove gettoni e sono formati dalle seguenti combinazioni: due gettoni sulla terzina 0/2/3 e il carré 25/29, un gettone per ognuno dei seguenti cavalli 4/7 - 12/15 - 18/21 - 19/22 - 32/35.\n\nGli Orfanelli (Les Orphelins)\nSono formati da due settori del cilindro distanti tra loro che separano i numeri della Serie 5/8 da quelli dei Vicini dello Zero: 17/34/6 da una parte: 1/20/14/31/9 dall'altra. Gli Orfanelli si accettano giocati a cavallo con cinque gettoni così ripartiti: un pieno al numero 1 e un pezzo per ognuno dei seguenti cavalli: 6/9 - 14/17 - 17/20 - 31/34, oppure in pieno con otto gettoni.\n\nLa Nassa\nSi gioca con 5 pezzi puntando un gettone per ognuno delle seguenti combinazioni: 0/3 - 12/15 - 19 - 26 - 32/35. Una variante, nota come \"Zero spiel\", non comprende il 19 e quindi si gioca con quattro pezzi: 0/3 - 12/15 - 26 - 32/35.\n\nSettore di 5 numeri (Un Numéro et Deux Voisins)\nÈ formato da un numero e dai suoi laterali sul cilindro, due a destra e due a sinistra. Si punta con cinque pezzi giocando i pieni.\n\nFinali (Les finales)\nSi individuano osservando il tracciato dei numeri sul tappeto, e possono essere in pieno e a cavallo. Le finali in pieno sono formate dai numeri che hanno in comune la stessa cifra finale (le unità), ad esempio la \"3\": 3/13/23/33. Le finali a cavallo hanno in comune le unità di due numeri vicini tra loro (a cavallo) e, a loro volta, si dividono in orizzontali e verticali.\n\n- Le Finali Verticali\nSono formate da due numeri posti uno sopra all'altro, si giocano a cavallo con tre o quattro gettoni determinati dalla posizione dei numeri sul tracciato. Esempio finale 3/6 quattro gettoni: 3/6 - 13/16 -23/26 - 33/36.\n\n- Le Finali Orizzontali\nComprendono una sequenza di due numeri consecutivi giocati a cavallo e in pieno (due per Finale) determinati dalla loro collocazione sul tracciato, si puntano con quattro o cinque gettoni. Molto richiesta è la finale 8/9: 8/9 - 18 - 19 - 28/29 (quattro pezzi).\n\nGli annunci vincenti si possono far rigiocare dall'impiegato utilizzando l'importo del pagamento.";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"La Serie 5/8 (Le Tiers du Cylindre)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"I Vicini dello Zero (Les Voisins du Zéro)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Gli Orfanelli (Les Orphelins)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"La Nassa"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Settore di 5 numeri (Un Numéro et Deux Voisins)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Finali (Les finales)"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Gli annunci vincenti si possono far rigiocare dall'impiegato utilizzando l'importo del pagamento:"]];
           
            break;
        default:
            
            myString=@"The 5/8 Series or 5/8 series and Voisins du Zéro are traditionally bets placed by the croupier. The chips representing the stake are placed in the appropriate spaces on the grid. When the number has been called, the chip in the Voisins du Zero street and Corner, there are two, are placed only if the winning number is in the combination staked. If the number is not in the combination, the bet is cancelled.\n\nThe 5/8 Series (Le Tiers du Cylindre)\nThis is a bet where twelve numbers are played by placing six chips on the following splits: 5/8 - 10/11 - 13/16 - 23/24 - 27/30 - 33/36.\n\n\nLes Voisins du Zéro\nHere seventeen numbers are played by placing nine chips on the following combinations: two chips on the 0/2/3 street and on the 25/29 corner and one chip on each of the following splits: 4/7 - 12/15 - 18/21 - 19/22 - 32/35.\n\n\nOrphans\nThese numbers make up the two opposite sectors on the wheel that separate the 5/8 series from the Voisins. They are: 17/34/6 on one side, and: 1/20/14/31/9 on the other.\nAn Orphans bet requires a stake of five chips, one straight bet on number 1 and 1 chip on each of the following splits: 6/9 - 14/17 - 17/20 - 31/34, or a straight bet of eight chips.\n\n\nNassa\nThis is a five-chip bet where one chip is laid on each of the following combinations: 0/3 - 12/15 - 19 - 26 - 32/35. A variant known as “Zero spiel”, does not include the number 19 and is therefore played with four chips: 0/3 - 12/15 - 26 - 32/35.\n\n\n5 number sector (Un Numéro et Deux Voisins)\nThis is a bet that consists of backing a number as well as the two numbers on either side of it on the wheel. Five chips are laid down as a straight bet.\n\n\nFinal digit bets (Les finales)\nThese bets are combinations that depend on the order of the numbers on the grid and can be placed as either straight-up or split bets. Straight-up final bets consist of numbers with the same last digit (units).A final digit bet of “3” for example is made upof:3/13/23/33. Split final bets, on the other hand, share the same final digit of two numbers that are next to each other (splits) and which are in turn divided into horizontal and vertical splits.\n\n\nVertical final digit bets\nThese bets are made up of two numbers, situated one above the other, and are staked as split bets with three or four chips depending on the position of the numbers on the grid. An example of a 3/6 final digit bet with four chips is: 3/6 - 13/16 -23/26 - 33/36.\n\n\nHorizontal final digit bets\nThese bets cover a sequence of two consecutive numbers staked as straight-up and split bets (two per final) with four or five chips depending on their position on the grid. A favourite is the 8/9 final digit combination, consisting of: 8/9, 18, 19, 28/29 (four chips).";
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"The 5/8 Series (Le Tiers du Cylindre)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Les Voisins du Zéro" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Orphans" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Nassa" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"5 number sector (Un Numéro et Deux Voisins)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Final digit bets (Les finales)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Vertical final digit bets" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Horizontal final digit bets" ]];
            break;
    }
   
    
    
    
    
 
    
    
    return attMyString;
}
-(NSMutableAttributedString *)generalRules {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Per una miglior conoscenza del gioco vengono riportate alcune tra le principali regole che disciplinano lo svolgimento della partita.\n• Il valore base del gettone di colore è determinato dal minimo del tavolo.\n• La puntata minima con il colore per ognuna delle combinazioni semplici, colonne e dozzine è di almeno cinque gettoni giocati assieme, sempre di almeno cinque pezzi, giocabili anche uno per ogni combinazione, se la puntata è fatta sulle combinazioni dei numeri (sestina, terzina ecc.).\n• Durante la partita, il giocatore deve tenere esposti i gettoni di colore collocandoli negli appositi spazi situati fuori dal tracciato sul bordo del tavolo.\n• I gettoni di colore devono essere convertiti in gettoni di valuta alla chiusura del tavolo quando il cliente smette di giocare o si allontana, anche se ciò avviene per un breve intervallo di tempo. Ogni altro uso dei gettoni di colore è vietato.\n• I gettoni di colore puntati per errore su tavoli diversi saranno pagati, se vincenti, in base al loro reale valore qualora sia determinabile, altrimenti secondo il minimo di apertura del tavolo di provenienza, mentre saranno ritirati se perdenti.\n• Possono partecipare al gioco anche i clienti in possesso di gettoni di valuta negoziabili in tutti i tavoli e per i quali, nelle combinazioni multiple, non vi è un limite minimo di pezzi da puntare. Nelle combinazioni semplici il valore minimo della puntata deve corrispondere a cinque gettoni di colore.\n• Ogni spostamento, correzione o errore anche dell'impiegato di gioco dovrà essere segnalato al Capo Tavolo prima dell'annuncio del \"Rien ne va plus\".\n• La vincita è determinata unicamente dalla posizione del gettone all'uscita del numero, quindi il cliente è invitato a seguire attentamente lo svolgimento della partita, controllare la posizione dei propri gettoni sul tavolo da gioco, anche se piazzati dall'impiegato, e a presenziare ai pagamenti.\n• La Direzione declina ogni responsabilità sulle puntate effettuate dall'impiegato in modo non conforme alle richieste del giocatore.\n• Non è consentito puntare a cavallo sulle combinazioni semplici, sulle dozzine e sulle colonne.\n• Il giocatore che vince conserva la sua puntata iniziale e può lasciarla nella stessa combinazione oppure, al termine del pagamento, ritirarla o spostarla.\n• I giocatori non possono toccare i gettoni vincenti prima che siano completati tutti i pagamenti.\n• Per poter nuovamente puntare i giocatori devono attendere che l'impiegato abbia liberato il numero e ritirato tutte le giocate perdenti (sulle combinazioni vincenti è possibile farlo solo dopo la fine di tutti i pagamenti).\n• Le vincite non riscosse sulle chances multiple vengono subito accantonate assieme alle puntate, quelle sulle chances semplici, colonne e dozzine, dopo il terzo colpo.\n• Le puntate minime e massime sono evidenziate sui singoli tavoli da gioco mediante appositi cartelli, gli importi sono strettamente vincolanti per il giocatore, che non può mai superarli neppure con l'intervento di terzi. La vincita eccedente realizzata superando il massimo consentito non sarà pagata e la differenza della puntata verrà restituita al cliente.\n• La Direzione si riserva il diritto di modificare i minimi e i massimi anche nel corso della stessa giornata: il Capo Tavolo avviserà verbalmente i giocatori e disporrà il cambio del relativo cartello.\n• È facoltà della Direzione sospendere la partita in qualsiasi momento della giornata.\n• La risoluzione di eventuali controversie in materia di gioco è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"For a better understanding of the game some of the main rules that govern procedures are given below.\n\n• The base value of the colour chips is determined by the minimum table limit.\n\n• The minimum colour stake for each of the simple combinations, and the columns and dozen is at least five chips, if played together. At least five chips must also be staked, one chip being played on each number combination, if a combination bet is laid (sixline, street etc.).\n\n• During the game, players must always keep their colour chips clearly in view in the appropriate spaces situated outside the grid, on the edge of the table.\n\n• Colour chips should be changed into value chips when the table closes, or when the customer decides to stop playing or leaves the table even for a short space of time. Using the colour chips for any other reason apart from playing at the specified table is strictly forbidden.\n\n• Any colour chips staked accidentally on a different table will be paid, if they win, on the basis of their real value, if recognisable. If their value is not recognisable they will be paid according to the minimum opening stake prescribed for the table they belong to. If the chip loses it will be raked in by the croupier.\n\n• Customers possessing value chips that can be used at any table, can also join the game. It is for this reason that for multiple combinations, there is no limit to the number of chips that can be staked. For a simple combination the minimum stake that can be laid is five colour chips.\n\n• Any changes, adjustments or mistakes, including those made by the croupier, must be reported to the Table Supervisor (Chef de Table) before “Rien ne va plus” is declared.\n\n• Winning bets are determined solely by the position of the chip when the boule lands in the pocket. Therefore customers are invited to follow the progress of the game closely, check the position of their chips on the table, even if they are placed by the croupier, and be present at payments.\n\n• The management is not responsible for bets laid by the croupier in a way that does not comply with the player’s requests.\n\n• Split bets are not permitted on simple combinations, dozen or columns.\n\n• Players who win keep their initial stake and have the choice of letting it ride, withdrawing it or shifting it.\n\n• Players may not touch winning chips before all payments have been completed.\n\n• To lay a new bet players must wait for the croupier to free numbers and rake in all the losing bets (customers can only lay a new bet on a winning combination after all payments have been made).\n\n• Any multiple chances (combination bet) wins that are not claimed shall be put to one side immediately for the customer by the croupier, together with the stakes, whereas unclaimed wins on simple chances, columns and dozen are put to one side by the croupier after three rounds.\n\n• The minimum and maximum stakes are indicated on the individual tables using appropriate signs. These limits are applied strictly and players may not exceed them, or use third parties to exceed them. Any excess wins made by surpassing the maximum limit will not be paid and the difference in the stake will be returned to the customer.\n\n• The Management reserves the right to change the maximum and minimum limits at any time, even on the same day. If this should occur the Table Supervisor (Chef de Table) will inform the players verbally and a sign indicating the changes will be displayed.\n\n• It is the Management’s right to suspend play at any time.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management." ;
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    
    
    return attMyString;
}

#pragma BlackJack

-(NSMutableAttributedString *)blackJack {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il gioco si svolge tra il banco rappresentato dal Casinò e i giocatori. Vince chi realizza il punteggio più alto, non superiore al 21, determinato dalla somma dei valori delle carte ricevute inizialmente o richieste successivamente. Ogni giocatore (player) conduce una partita autonoma adottando di volta in volta varie strategie.\n\nAl Black Jack vengono utilizzati sei mazzi di cinquantadue carte da gioco formati da tredici carte per ognuno dei quattro semi (Cuori - Quadri - Fiori - Picche) così composti: un Asso (Ace), nove carte numerate in ordine crescente da 2 a 10, un Fante (Jack), una Donna (Queen) e un Re (King). L’Asso vale 1 o 11 punti, a scelta, determinando il punteggio più favorevole, le figure 10 punti, le altre il loro valore nominale.\n\nIl tavolo ha la forma di un semicerchio. Da un lato siede il banchiere (Dealer) mentre di fronte prendono posto sette giocatori in corrispondenza di altrettante postazioni: ognuna di queste comprende tre cerchietti per un totale di ventuno clienti (sette seduti e quattordici in piedi).\n\nI giocatori seduti puntando sul primo cerchietto (di colore rosso posizionato più vicino al Dealer), diventano titolari di una postazione (box holder), e con le loro decisioni vincolano il gioco di coloro che puntano nei due cerchietti rimasti liberi. Questi ultimi non possono influenzare per nessun motivo i vari titolari o interferire nelle loro scelte.\n\nLe giocate terminano nel momento in cui il Dealer, annunciando “Rien ne va plus”, sfila la prima carta dal sabot: dopo questo invito, nessuna puntata può essere aggiunta, tolta o spostata.\n\nIl banchiere procedendo da sinistra verso destra distribuisce una carta scoperta in ogni postazione giocata assegnando l’ultima al banco, effettua poi un secondo giro di carte scoperte, una per ogni postazione nello stesso ordine della prima, senza però attribuirla a sé stesso.\n\nIl cliente dopo aver preso visione delle proprie carte può decidere se “rimanere” o “sviluppare” il gioco rispettando delle semplici regole: quando il punteggio raggiunto è inferiore o pari a 11 ha l’obbligo di superarlo chiamando almeno un’altra carta, quando arriva al 21 si deve fermare, in tutti gli altri casi la richiesta è libera; se però oltrepassa il 21 “sballa” e per quella mano non ha più la possibilità di rientrare in gioco. Cominciando dalla sua sinistra, postazione per postazione, il Dealer, leggendo il punteggio, inviterà ogni titolare a manifestare il suo gioco. La risposta dovrà essere inequivocabile: “carta” o “no carta”.\n\nQuando tutti hanno fatto il proprio gioco il Dealer deve portare a termine il suo, applicando obbligatoriamente “la regola del banco”: se ha un punteggio fino a 16 si attribuisce una o più carte per superarlo, se raggiunge o oltrepassa il 17 si ferma. Se va oltre al 21 la sua mano è perdente, e si conclude con il pagamento di tutte le puntate rimaste.\n\nIl Dealer, definiti tutti i punteggi, li confronta con il proprio: procedendo da destra verso sinistra, postazione per postazione, paga le combinazioni superiori alla sua, ritira quelle inferiori e lascia quelle in parità. In caso di vincita il premio è alla pari.\n\nIl giocatore che riceve con le due carte iniziali Asso e figura oppure Asso e 10 forma il “Black Jack”: questa combinazione vince sul 21 ed è pagata 3 a 2, se anche il banco realizza “Black Jack” la mano viene considerata in parità. Il “Black Jack” determina sempre in 11 punti il valore dell’asso, pertanto non è consentito richiedere l’attribuzione di altre carte." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"The game is played between the banker, represented by the Casinò, and the players. The winner is the player with the highest score, not exceeding 21. This is determined by the sum of the values of the card received to begin with, or subsequently requested. Every player plays the game independently, adopting his or her own strategy on each occasion.\n\nIn Black Jack six decks of fifty-two playing cards are used, with thirteen cards for each of the four suits (Hearts- Diamonds-Clubs-Spades) that consist of: an Ace, nine number cards from 2 to 10, a Jack, a Queen and a King. The Ace counts as either 1 or 11 points, at the player’s discretion, the picture cards are worth 10 points and the value of the other cards is their own number.\n\nThe game is played on a semicircular table. The Dealer sits on one side and in front of him sit up to seven players. Each player’s place on the table has three circles drawn on it, so in fact up to twenty-one customers can participate (seven seated and fourteen standing up).\n\nThe players who are sitting down place their bets in the first circle (the red circle nearest the Dealer) to become box holders.\n\nTheir choices decide the bets placed by the other players in the other circles. These other players cannot influence or interfere with the decisions of the box holders.\n\nAll bets must be placed before the Dealer announces “Rien ne va plus” and deals the first card from the sabot. So after this announcement no bets can be added, moved or removed.\n\nThe banker then deals from left to right one card face up to each of the boxes in the game and one card to the bank. A second card is then dealt face up to each of the boxes, in the same order as before, but a second card is not yet dealt to the bank.\n\nAfter the customer has looked at their cards they can choose whether to “stick” or “continue” the game observing a number of simple rules, including: when the score reached is less or the same as 11 the player must ask for another card; when a player’s score reaches 21 they may not ask for another card; in all other situations customers can ask for cards as they wish. If, however, the score exceeds 21, the player’s hand “busts” and exits the game.\n\nStarting from the left the Dealer passes from one box to the next, reading the scores and asking each box holder what they wish to do. The box holders must reply clearly “card” or “no card”.\n When everyone has played their hand, the Dealer plays his, observing the “bank regulations” including: when the score reached is less or the same as 16 the bank must ask for another card; if the bank scores 17 or above they must “stick”. If the bank “busts” i.e., his score exceeds 21 then the bank’s hand loses and he must pay all the bets still on the table.\n\nHaving compared the scores of the hands on the table with his own, the Dealer proceeds from right to left, box by box, paying out the bets on hands that beat his own, raking in the bets laid on hands with a lower score and leaving on the table any bets placed on an equal score. For winning hands the bank pays evens.\n\nPlayers who are dealt an initial hand of an Ace and a picture card or a 10, score “Black Jack”, a combination that wins over a hand scoring 21 with more than two cards and is paid 3 to 2. If the bank also scores “Black Jack” the two hands draw. The Ace in a “Black Jack” score is always worth 11 points so the player cannot ask for other cards." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    
    return attMyString;
}


-(NSMutableAttributedString *)variationsBJ {
    NSDictionary *firstAttributes = [self firstAttributes];
     NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"RADDOPPIO (Double - Down)\nIl giocatore titolare di postazione dopo aver ricevuto le prime due carte, indipendentemente dal punteggio ottenuto, può decidere di raddoppiare la propria puntata. In questo caso il Dealer posiziona l’importo ricevuto sopra alla puntata iniziale e assegna una sola carta, che viene sistemata perpendicolarmente rispetto alle altre due. I giocatori che hanno puntato sulla postazione non sono obbligati a raddoppiare la posta, ma devono accettare l’attribuzione di una sola carta.\n\nDIVISIONE (Splitting)\nSe le prime due carte ricevute sono di pari valore (due 3, due Jack, un Re e un 10 ecc.) il titolare di postazione ha la possibilità di dividerle (Split) conducendo il gioco in due mani separate e indipendenti.\nIl Dealer dispone le due carte vicine tra loro, una parallela all’altra, posizionando accanto alla posta iniziale il medesimo importo consegnato dal cliente. Se con la terza carta ricevuta forma un’altra coppia il giocatore può effettuare un’ultima divisione aggiungendo un’ulteriore puntata sempre dello stesso valore.\nDopo aver diviso due figure, due 10 oppure figura e 10 il titolare di postazione, ricevendo un asso, ha la facoltà di farlo valere 1 o 11 punti: se decide per il valore di 1, determinando il punteggio totale in 11 punti, può richiedere una o più carte o raddoppiare.\n\nDIVISIONE DI 2 ASSI (Splitting 2 Ace)\nNella divisione di 2 Assi il Dealer attribuisce una sola carta per ciascuno di essi, sistemata perpendicolarmente, senza altre possibilità di gioco. Se la carta è un 10 o una figura, il punteggio realizzato non è “Black Jack” ma solamente “21”.\nNella divisione la decisione del titolare di postazione è vincolante per gli altri giocatori.\n\nASSICURAZIONE (Insurance)\nNel caso in cui il Dealer si attribuisca un Asso come prima carta, viene offerta ai giocatori l’opportunità di scommettere sull’eventuale “Black Jack” realizzato dal banco. Questa scelta viene chiamata “Assicurazione”, l’adesione è libera e non è vincolata alla decisione del titolare di postazione.\nIl giocatore che si assicura depone sulla linea con la scritta “Insurance”, davanti alla propria postazione, un importo in gettoni il cui valore non può superare la metà della puntata iniziale. Se il Dealer realizza “Black Jack” paga le “Assicurazioni” 2 a 1 (gli eventuali “Black Jack” non possono essere assicurati, pertanto pareggiano), tutte le altre puntate sono perdenti. Se invece non forma il “Black Jack” le assicurazioni perdono subito, quindi, se non è già determinato, il Dealer completa il punto del banco operando poi contestualmente su ogni casella.\n\nBLACK JACK ALLA PARI\nQuando la prima carta del Dealer è un Asso, figura o 10, ogni giocatore in possesso di “Black Jack”, anche se non è titolare di postazione, può richiedere l’immediato pagamento ricevendo un importo pari alla puntata." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"RADDOPPIO (Double - Down)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"DIVISIONE (Splitting)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"DIVISIONE DI 2 ASSI (Splitting 2 Ace)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"ASSICURAZIONE (Insurance)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"BLACK JACK ALLA PARI"]];
            
            break;
        default:
            
            myString= @"DOUBLE-DOWN\nHaving received the first two cards, regardless of the score, the box-holder can decide to double the bet laid previously. In this case, the Dealer places the new bet on top of the old one and deals the box-holder one card only at right angles to the first two cards. The other players with bets on this box are not obliged to double their stake, but they do have to accept being dealt one card only.\n\n\nSPLITTING\nIf the first two cards dealt to the player have the same value (e.g. two 3s, two Jacks, a King and a 10 etc.) the box holder may Split them and continue the game with two separate hands. The Dealer places the two cards next to each other and the customer lays next to their original stake a second bet of the same amount. If the third card dealt is the same again, the player can split once more. Laying down a third bet of the same amount as the original one.\n\nIf the box holder splits two picture cards, two 10s, or a picture card and a 10 and then receives an ace, they can decide whether the card is worth 1 or 11. If they opt for 1, making a score of 11 points, they can ask for one or more cards or the stake can be doubled.\n\n\nSPLITTING 2 ACES\nIf the player splits 2 Aces the Dealer deals one card only, at right angles, to each of them and the hand stops there. If the card dealt is a 10 or a picture card, the score is not “Black Jack” but simply “21”. If the box holder decides to split the other players must respect their decision.\n\n\nINSURANCE\nIf the Dealer deals the bank an Ace as the first card, the players can bet on the chances of the bank scoring “Black Jack”. This choice is called “Insurance”. Players are free to bet or not to bet and their decision is in no way bound to the actions of box holders.\n\nPlayers who wish to be “Insured” must place on the line marked “Insurance”, in front of their box, a stake worth at least half the value of their original bet. If the Dealer scores “Black Jack” the “Insurances” are paid at 2 to 1 (any other “Black Jacks” cannot be insured and therefore draw) whereas all the other stakes lose. If, however, the Dealer does not make “Black Jack” the insurances lose and are withdrawn by the Dealer who then completes normal bank operations passing from one box to the next.\n\n\nEVENS BLACK JACK\nWhen the Dealer’s first card is an Ace, a picture card or a 10, every player who has a “Black Jack” hand, even if they are not box holders, can ask for immediate payment and receive a sum equal to the stake they have laid." ;
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"DOUBLE-DOWN" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"SPLITTING" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"SPLITTING 2 ACES" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"INSURANCE" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"EVENS BLACK JACK" ]];
            break;
    }
    
    
    return attMyString;
}

-(NSMutableAttributedString *)generalBJ {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"• Ogni titolare decide solo su una postazione; se al tavolo ve ne sono alcune di libere ha la possibilità di giocare e decidere momentaneamente anche su queste. Qualora venissero occupate perde questo diritto.\n\n• Il giocatore non può toccare le carte per nessun motivo.\n• Nel caso in cui una puntata sia inferiore al minimo del tavolo, attribuita la prima carta alla prima postazione, non potrà più essere integrata e per quella mano sarà accettata come valida.\n• Se, in caso di raddoppio, l’importo aggiunto dal cliente fosse inferiore a quello puntato, attribuita la carta, non potrà più essere integrato e sarà considerato valido; l’eventuale pagamento corrisponderà all’importo giocato. Se invece dovesse superare quello puntato, in caso di vincita, l’importo eccedente la somma iniziale non sarà pagato, mentre se perdente verrà restituito.\n• Al tavolo può sedere solo chi gioca. Se al tavolo è presente un solo cliente, per poter giocare “solo contro il banco” deve puntare in almeno due postazioni.\n• Le puntate minime e massime sono evidenziate sui singoli tavoli da gioco mediante appositi cartelli; gli importi sono strettamente vincolanti per il giocatore, che non può mai superarli, neppure con l’intervento di terzi; la vincita eccedente realizzata superando il massimo consentito non sarà pagata e la differenza della puntata restituita al cliente.\n• La soluzione di eventuali controversie è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"• Box holders can only make decisions on one box. If, however, there are vacant boxes they can decide and play momentarily on these ones too. If the boxes are occupied, however, they lose this right.\n\n• Players must not touch the cards for any reason whatsoever.\n\n• If a stake is laid that is less than the minimum table limit, and the first card is dealt to the first box, the stake can no longer be raised and will therefore be accepted as valid for that hand.\n\n• In the case of a stake being doubled, if the customer lays down a sum that is less than the original stake and the card is dealt, the stake can no longer be raised and will therefore be accepted as valid, and payments will be made on the basis of the stake laid. If, on the other hand, the customer lays down a sum that is higher than the original stake, the sum exceeding the original stake will not be paid and if the hand loses it will be returned to the player.\n\n• Only those playing may sit at the table. If there is only one customer at the table, to play “alone against the bank” the player must bet on at least two boxes.\n\n• The minimum and maximum stakes are indicated on the individual tables using appropriate signs. These limits are applied strictly and players may not exceed them, or use third parties to exceed them. Any excess wins made by surpassing the maximum limit will not be paid and the difference in the stake will be returned to the customer.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}

#pragma MidiTrent

-(NSMutableAttributedString *)midTrenteEtQuarante {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"La partita si svolge tra il banco, che rappresenta il Casinò , e i giocatori. Le puntate possono essere effettuate su quattro combinazioni (chances): Rosso, Nero, Colore e Inverso. La combinazione vincente tra Rosso e Nero è determinata dal punteggio più basso, compreso tra 31 e 40, ottenuto som-mando i valori delle carte stese su due file, mentre tra Colore e Inverso è definita dal colore del seme della prima carta estratta. Il pagamento è alla pari.\nAl Trente et Quarante sono utilizzati sei mazzi di cinquantadue carte da gioco (six jeux de 52 cartes) formati da tredici carte per ognuno dei quattro semi (Cuori - Quadri - Fiori - Picche) così composti: un Asso (As), nove carte numerate in ordine crescente da 2 a 10, un Fante (le Valet), una Donna (la Dame) e un Re (le Roi). L’Asso vale 1 punto, le figure 10 punti, le altre il loro valore nominale.\nIl tavolo (la table de jeu) ha dimensioni simili a quelle della Roulette Francese, la forma è rettangolare, sul “tappeto verde” (tapis verte) è disegnato il tracciato (tableau) diviso in quattro zone che corrispondono rispettivamente a Rosso (Rouge), Nero (Noir), Colore (Couleur), Inverso (Inverse). Possono sedere al massimo sette giocatori (joueurs), mentre non c’è limite per quelli in piedi.\n\nIl Capo Tavolo (Chef de Table) è responsabile del tavolo: egli ha il compito di sovrintendere le attività di gioco garantendo il rispetto dei regolamenti, mentre i due impiegati (croupiers), seduti di fronte tra loro, uno a destra (tailleur) e l’altro a sinistra (payeur) dello Chef, hanno l’incarico di condurre la partita eseguendo tutte le operazioni necessarie al suo regolare svolgimento.\n\nLe carte, dopo essere state accuratamente mescolate a mano, vengono introdotte dal tailleur in una miscelatrice automatica (shuffle) che provvede, in maniera autonoma, a mescolarle a sua volta e a prepararle per essere estratte.\n\nUn tempo le procedure erano manuali e seguivano un “rituale” rigoroso: stesura, controllo e preparazione della sixain, la coupe (taglio per dividerla in due mazzi) richiesta alle signore più affascinanti ed eleganti fra quelle presenti al tavolo e, per finire, la scenografica distribuzione delle carte sul tappeto per la lettura dei punteggi.\nPer le particolarità del gioco e per le notevoli somme giocate al Trente et Quarante sono sempre designati i croupiers più esperti.\n\nIl gioco inizia quando, dopo l’annullamento delle prime cinque carte “Messieurs les cinq cartes”, l’impiegato annuncia “Messieurs faites vos jeux” e termina con la frase “Messieurs les jeux sont faites, rien ne va plus”. Da questo momento in poi non è più possibile ritirare, spostare o effettuare alcuna puntata.\n\nPer la determinazione del “punto” il tailleur estrae e scopre le carte una alla volta, sommando mentalmente i valori, posizionandole di seguito, da sinistra a destra, allineate in due file parallele. La prima fila gioca per la combinazione del Noir, quella sottostante per quella del Rouge.\n\nOgni fila deve raggiungere un punteggio che deve essere compreso tra 31 e 40. Quando l’impiegato, nella formazione della prima, supera il 30, interrompe la stesura e annuncia la somma ottenuta dichiarando solo le unità, compone quindi la fila inferiore rispettando la stessa procedura. Vince la fila che realizza il punteggio minore.\n\nIl colore del seme della prima carta della fila superiore determina la combinazione vincente tra Couleur o Inverse:\nvince Couleur se corrisponde a quello della fila vincente, se non è uguale, vince Inverse.\n\nIl tailleur annuncerà rigorosamente in francese le due chances vincenti o perdenti (una vince e l’altra perde tra Rosso e Nero, Colore e Inverso) dichiarando sempre la sorte del Rouge e del Couleur con i loro possibili abbinamenti." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Trente et Quarante is one of the oldest and most original of card games. According to custom and because of its particular characteristics it is really only to be found in the more traditional Casinos, like for example that in Venice.\n\nThe game is played between the bank, representing the Casino, and the players. Stakes can be laid on four combinations (chances): Red, Black, Colour or Inverse. The combination that wins between Red and Black is the row with the lowest score between 31 and 40. This is calculated by adding together the values of the cards in first the top row that is laid out and then the bottom row. The combination that wins between Colour and Inverse, on the other hand, is decided by the colour of the suit of the first card dealt. Payment is 1 to 1.\n\nIn Trente et Quarante six decks of fifty-two playing cards (six jeux de 52 cartes) are used with thirteen cards for each of the four suits (Hearts-Diamonds-Clubs-Spades) that consist of: an Ace (As), nine number cards from 2 to 10, a Jack (le Valet), a Queen (la Dame) and a King (le Roi). The Ace is worth 1 point, the picture cards 10 points, and the other cards are worth their own number.\n\nThe table (la table de jeu) is very similar to the one used in French Roulette. It is a rectangular, green baize table (tapis verte) with a grid (tableau) drawn on it that is divided into four areas: Red (Rouge), Black (Noir), Colour (Couleur), Inverse (Inverse). A maximum of seven players (joueurs) can sit at the table, whereas there is no limit to those standing up.\n\nThere is a Table Supervisor (Chef de Table) whose job it is to supervise the game and ensure that all the regulations are properly observed, and two stewards (croupiers) who sit, one on the right (tailleur) and one on the left (payeur) of the Chef de Table. Their job is to do everything that is needed to conduct the game orderly and efficiently.\n\nHaving thoroughly shuffled the cards manually, the Dealer (tailleur) places the cards in an automatic shuffler that shuffles them and prepares them for the game.\n\nOnce these procedures were performed manually and followed a strict ritual. The sixain was checked and shuffled, then the most glamorous lady at the table was asked to cut (coupe) the cards and then the cards were dealt out dramatically on the baize table and the scores were read.\n\nBecause this is such a special game and because considerable sums are often involved most Casinos reserve their most experienced stewards for Trente et Quarante.\n\nThe game begins, after the first five cards have been eliminated, “Messieurs les cinq cartes”, when the steward announces, “Messieurs faites vos jeux”, and betting finishes when the steward says “Messieurs les jeux sont faites, rien ne va plus”. From this moment on, players cannot withdraw, shift or place any more bets.\n\nTo determine the “score”, the Dealer (tailleur) extracts the cards one at a time and turns them face up, summing up the score mentally and positioning them from left to right in two rows. The first row plays for the Noir combination, the second for the Rouge combination.\n\nEach row has to reach a score between 31 and 40. When the total score of the cards laid down in the first row exceeds 30, the Dealer stops and announces the “score” obtained and the individual cards laid. The Dealer then repeats the same procedure to form the second row. The winner of the two rows is the one with the lowest score.\n\nThe colour of the suit of the first card in the top row determines whether Couleur or Inverse wins:\nCouleur wins if the colour of the first card is the same as that of the winning row. If it isn’t Inverse wins.\nThe Dealer (tailleur) announces in French, the two winning or losing “chances” (Red or Black, Colour or Inverse - one loses, the other wins), declaring whether Rouge and Couleur have won and the various combinations." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}



-(NSMutableAttributedString *)apresMTQ {
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Quando le due file realizzano lo stesso punteggio la mano è dichiarata nulla. L’impiegato annuncerà i due valori uguali accompagnando il secondo con la parola “Après”. I clienti avranno la possibilità di ritirare, spostare o variare la loro puntata.\n\n31 APRÈS\nNel caso in cui la somma raggiunta in entrambe le file sia 31 (Un Après) le puntate perdono la metà del loro valore e sono imprigionate negli appositi spazi.\n\nAd ogni “31 Après” il giocatore ha la possibilità di dividere con il banco la propria puntata (à partager), lasciarla dove si trova o farla spostare, sempre però vincolata, in un’altra combinazione dove giocherà per la mano successiva.\nNel caso si verifichi un solo “31 Après” la puntata (en prison) potrà essere ritirata solo se la mano successiva risulterà vincente, mentre, in presenza di più “31 Après” consecutivi, per poter essere liberata, dovrà vincere tante volte quante sono stati i “31 Après”.\nIl limite massimo degli Après consecutivi è di tre volte, al quarto Après l’importo rimasto ancora in gioco sarà diviso.\n\nAd ogni mano della taglia, per evitare di perdere la metà della mise con il “31 Après” i giocatori possono “assicurare” le puntate non in “prigione” (assurer leurs enjeux) pagando al banco l’1% del loro valore. L’impiegato evidenzierà l’importo assicurato posizionando sulle fiches corrispondenti un apposito “marcatore” (assurer).\n\nAPRÈS\nLa prima fila raggiunge 32 punti, l’impiegato annuncia “Deux”, la seconda fila 32 punti, l’impiegato annuncerà: “Deux Après” (La mano è pari).\n\n31 APRÈS\nLa prima fila raggiunge 31 punti, l’impiegato annuncia “Un”, la seconda fila 31 punti, l’impiegato dichiarerà: “Un Après” (Le puntate vengono “imprigionate”)." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"31 APRÈS" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"APRÈS" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"31 APRÈS" ]];
            
            break;
        default:
            
            myString= @"If the two rows score the same the hand is declared null and void. The steward announces the two tied scores and says “Après” after the second. Customers can then withdraw, shift or change their stakes.\n\n31 APRÈS\nIn the event of both rows reaching a score of 31 (Un Après) the stakes lose half their value and are imprisoned in the appropriate boxes.\n\nAt every “31 Après” players can either share their stake with the bank (à partager), leave it where it is, or move it (not remove it) to another combination for the next hand. If only one “31 Après” occurs, the stake (en prison) can only be withdrawn if the next hand wins. On the other hand, if a series of consecutive “31 Après” hands occur, to release the stake each hand after each “31 Après” must be won. There is a limit of three consecutive Après hands. At the fourth Après the sum left in play is divided.\n\nAt every hand in the round, to avoid losing half their stake as the result of a “31 Après” players can “insure” stakes that are not imprisoned (assurer leur enjeux) by paying the bank 1% of their value. The steward indicates the sum insured by placing a “special marker” (assurer) on the insured chips.\n\nAPRÈS \nThe first row scores 32 points, so the steward announces “Deux”. The second row also scores 32 points, so the steward announces: “Deux Après” (the hand is tied).\n\n31  APRÈS\nThe first row scores 31 points, so the steward announces “Un”. The second row also scores 31 points, so the steward announces: “Un Après” (The stakes are “imprisoned”)." ;
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"31 APRÈS" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"APRÈS " ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"31  APRÈS" ]];
            break;
    }
    
    
    return attMyString;
}

-(NSMutableAttributedString *)generalMTQ {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"• Il Casinò di Venezia, per tradizione, permette ai giocatori di ritirare le proprie puntate per l’intero valore nel caso in cui, dopo il primo “31 Après”, la “taglia” finisca senza che siano rimaste delle carte nella miscelatrice (senza resto).\n\n• Per essere veloci come il Payeur si deve osservare la prima carta della fila superiore: se è nera la sorte del Rosso si abbina all’Inverso, se è rossa al Colore.\n\n• Per la determinazione del punto, la carta valida è sempre quella che l’impiegato prende per prima. Se l’impiegato dovesse prendere più carte, queste saranno messe in gioco partendo da quella superiore.\n\n• Se una o più carte, all’interno della miscelatrice, mostrano il loro valore sono valide in ogni caso e concorrono alla formazione del punto. Se nelle mani successive una o più carte mostrano ancora il loro valore, si procederà fino al completamento della terza mano, anche non consecutiva, con le carte scoperte, al termine la taglia sarà sospesa e le carte rimescolate.\n\n• Le carte cadute a terra o nella “Sibilla” (contenitore circolare nel quale sono introdotte le carte già utilizzate nella taglia) vengono annullate.\n\n• Al tavolo può sedere solo chi gioca.\n\n• Le puntate minime e massime sono evidenziate sui singoli tavoli da gioco mediante appositi cartelli, gli importi sono strettamente vincolanti per il giocatore: non può mai superarli, neppure con l’intervento di terzi. La vincita eccedente realizzata superando il massimo consentito non sarà pagata e la differenza della puntata sarà restituita al cliente.\n\n• La soluzione di eventuali controversie è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"• It is a tradition at the Casinò di Venezia to allow players to withdraw the entire value of their stakes if after the first “31 Après” the round (coup) ends because there are no cards left in the shuffler.\n\n• To conduct the game quickly, the Payeur always checks the first card in the top row. If it is black the Red row is Inverse, whereas if it is red the Red row is Couleur.\n\n• Each deal is decided by the card the Dealer lays down first. If the Dealer should pick up more than one card, the top card should be laid down first and the others (which remain valid) should be laid down afterwards.\n\n• If one or more cards are turned face up by the shuffler they remain a valid part of the deal and still contribute to the score. If in the following hands, one or more cards are turned face up, play continues until the third hand (not necessarily consecutive) and then the round (coup) is suspended and the cards are reshuffled.\n\n• Any cards that are dropped on the ground or in the basket (the container at the centre of the table that used cards are put into) are automatically null and void.\n\n• Only those playing may sit at the table.\n\n• The minimum and maximum stakes are indicated on the individual tables using appropriate signs. These limits are applied strictly and players may not exceed them, or use third parties to exceed them. Any excess wins made by surpassing the maximum limit will not be paid and the difference in the stake will be returned to the customer.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
  
    
    
    return attMyString;
}

#pragma Texas Hold

-(NSMutableAttributedString *)texasHold {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il Texas Hold 'em Poker cash è aperto tutti i giorni nella sede di Ca' Noghera e in forma di torneo nella nuovissima poker room con competizioni giornaliere tutti i giorni, esclusi martedì e mercoledì.\nCa' Vendramin Calergi è sede di importanti tornei e competizioni internazionali\n\nIl Texas Hold ’em Poker si gioca con un mazzo di cinquantadue carte formato da quattro semi: Cuori - Quadri - Fiori - Picche. L’Asso ha il valore più alto, il 2 quello più basso, mentre nessun seme prevale sull’altro.\n\nLa partita si svolge esclusivamente tra giocatori. Il compito del Capo Partita (responsabile del tavolo) è di condurla, far rispettare le regole, distribuire le carte, controllare le puntate cambiando, se necessario, le chips ai giocatori e prelevare la tassa (Cagnotte - Rake) seguendo le percentuali stabilite dalla Casa da Gioco.\n\nAl tavolo possono sedere solo i giocatori, per poter iniziare devono essere presenti almeno due dei dieci consentiti. Nel caso in cui tutti i posti siano occupati si può prenotare fornendo il proprio nominativo al Floorman.\n\nOgni giocatore deve realizzare una combinazione di carte superiore a quella degli altri, utilizzando le cinque migliori carte scelte tra le due coperte e personali (Hole Cards) ricevute inizialmente e le cinque comuni (Community Cards) distribuite sul “tappeto”, in tre sequenze diverse, nel corso della mano.\n\nLe combinazioni vincenti sono quelle classiche del gioco del Poker a cinquantadue carte." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Texas Hold ‘em Poker cash is open every day at our Ca’ Noghera site and is offered in tournament format at our latest Poker Room (with daily tournaments), excepting Tuesdays and Wednesdays.\n\nCa’ Vendramin Calergi is where important tournaments and international competitions are held.\n\nTexas Hold ’em Poker is played with a deck of fifty-two playing cards, consisting of four suits (Hearts-Diamonds-Clubs-Spades). The Ace has the highest value, the two the lowest, and no suit is worth more than another.\n\nThe players play against each other, not against the Casino, and the Steward (the Game Supervisor) directs play only, ensuring that the rules are observed, dealing the cards, checking the stakes and, if necessary, changing chips for players and taking a commission (Cagnotte - Rake) of any wins, according to the percentages established by the Casino.\n\nOnly players can sit at the table, and to begin the game at least two of the ten places at the table must be occupied. If all the places at the table are taken reservations can be made by giving the Floorman your name.\n\nTo win, players must create a combination of cards that is higher than that of the other players using the five best cards chosen from the two cards (Hole Cards) dealt face down to each player initially and the five community cards laid out on the table at three different stages during the hand.\n\nThe winning combinations are the classic, fifty-two card Poker combinations." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    return attMyString;

}


-(NSMutableAttributedString *)differentTH {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il mazziere del tavolo (giocatore che riceve le carte per ultimo) è indicato da un Botton di forma circolare, leggermente più grande delle chips tradizionali, contrassegnato dalla lettera “D” o dalla parola Dealer, posizionato davanti alla sua postazione. Il bottone viene spostato in senso orario all’inizio di ogni round di gioco.\nLa mano inizia quando i due giocatori alla sinistra del bottone effettuano una puntata obbligatoria, dal valore prestabilito, chiamata “Piccolo Buio” e “Grande Buio” (Small Blind e Big Blind).\nL’impiegato assegna due carte coperte e personali a ciascun giocatore presente al tavolo distribuendole una alla volta partendo sempre dallo Small Blind (il primo seduto alla sinistra del bottone).\nL’attribuzione delle carte determina l’inizio delle puntate, la prima viene fatta dal giocatore alla sinistra del Big Blind e deve avere almeno lo stesso importo." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"The player in the dealer position (i.e. the last player that cards are dealt to) is indicated by a circular Dealer Button that is slightly larger than the traditional chips, marked with a “D” or the word Dealer, and placed in front of their position at the table. At the start of every round in the game the Dealer Button is moved one place in a clockwise direction.\n\nThe hand begins when the two players to the left of the Dealer Button lay down an obligatory bet of the set amount. These bets are called the Small Blind and the Big Blind.\n\nThe Steward then deals two cards face down to each of the players at the table. The cards are dealt one at a time starting from the Small Blind (the first player sitting immediately to the left of the button).Once the cards have been dealt, the players can begin to bet, starting with the player sitting on the left of the Big Blind. The stake must be at least the same amount as the Big Blind" ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    return attMyString;
}

-(NSMutableAttributedString *)flopTH {
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Flop\nAlla fine del giro di puntate, dopo aver annullato una carta senza farla vedere, l’impiegato scopre sul tappeto, una di seguito all’altra, tre carte (Flop), queste sono comuni e vengono utilizzate da ogni giocatore per formare la propria combinazione migliore. Il Flop rende possibile una nuova serie di scommesse.\n\nTurn\nIl giro delle puntate, l’impiegato annulla una carta e contemporaneamente ne gira una, sempre comune a tutti (Turn), posizionandola accanto alle tre del Flop. Il Turn determina il terzo giro di scommesse.\n\nRiver\nRispettando la stessa procedura viene mostrata la quinta carta (River). Con il River si conclude la sequenza delle puntate.\n\nL’impiegato invita i giocatori ancora in gioco ad effettuare lo Showdown: le carte sono fatte vedere appoggiandole sul “tappeto”. Il giocatore che si aggiudica “il piatto” (Pot) è quello che avrà realizzato la combinazione più alta (in caso di parità viene diviso).\n\nAl termine il bottone viene spostato di un posto verso sinistra determinando l’inizio di una nuova mano." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Flop" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Turn" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"River" ]];
            
            break;
        default:
            
            myString= @"Flop\nAt the end of every round of bets and having discarded a card without looking at it, the steward lays three cards face up on the table. This is known as the Flop. These are community cards and are used by each player to make the best possible combination. The Flop is followed by a second betting round.\n\nTurn\nAfter the flop betting round has ended, the steward again discards a card and then lays another card face up on the table. This is another community card (known as the Turn), and it is laid next to the three Flop cards. The Turn is followed by a third betting round.\n\nRiver\nFollowing the same procedure a fifth card is then laid face up on the table. This is known as the River and this card marks the last betting round.\n\nThe steward then invites the players still in the game to Showdown, i.e. to turn the cards face up on the table. The player who wins the pot is the one with the highest combination. If the winning combination is tied, the pot is split between them.\n\nOnce the hand is complete the button is moved one place to the left and this signals the start of a new hand." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Flop" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Turn" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"River" ]];
            break;
    }
    
    return attMyString;
}

-(NSMutableAttributedString *)betTH {
    NSDictionary *firstAttributes = [self firstAttributes];
     NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Bet\nPuntata iniziale\n\nCheck\nPassare la mano lasciando parlare gli altri giocatori\n\nCall\nVedere o accettare il gioco puntando lo stesso importo\n\nRaise\nRilanciare una puntata aggiungendo un importo maggiore\n\nFold\nRitirarsi dalla mano lasciando le puntate\n\nAll in\nMettere nel piatto tutta la posta" ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Bet"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Check"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Call"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Raise"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Fold"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"All in"]];
            
            break;
        default:
            
            myString= @"Bet\nThe initial bet\n\nCheck\nTo pass on the hand letting the other players call\n\nCall\nTo see or accept play by staking the same amount\n\nRaise\nTo raise a stake by laying a higher bet\n\nFold\nTo throw in one’s hand leaving the stakes on the table\n\nAll in\nTo put all the stakes in the pot" ;
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Bet"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Check"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Call"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Raise"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"Fold"]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString:@"All in"]];
            break;
    }
    
    
    return attMyString;
}

-(NSMutableAttributedString *)notesTH {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Si consiglia di anticipare ogni azione di gioco con una conferma verbale, questo accorgimento tutela il giocatore da interpretazioni o comportamenti sbagliati che non sempre possono essere corretti.\n\nLa soluzione di eventuali controversie è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString=@"We suggest that players confirm every play they make by calling them out loud. This will safeguard them against making mistakes or interpreting the game incorrectly.\n\nAny dispute that may arise will be settled without right of appeal by the Gaming Management.";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }

    
    
    return attMyString;
}

#pragma Punto Banco

-(NSMutableAttributedString *)puntoBanco {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il Punto Banco tradizionale (large variant) può ospitare due dealer e fino a quindici giocatori, mentre al tavolo del Midi Punto Banco, dalla forma di semicerchio simile a quello del Black Jack, siedono un banchiere e un numero di giocatori che varia da sette (Mini Punto banco) a nove.\n\nLe carte da 1 (asso) a 9 mantengono il valore, le figure (fante, donna, re) e i 10 si annullano.\n\nIl punteggio della mano si ottiene sommando le carte e eliminando, quando possibile, la decina (es. 8+6=14=4). Il massimo realizzabile è \"9 di battuta\" (raggiunto con le prime due carte), il più basso è \"0\". Vince il punteggio più alto.\n\nOgni giocatore ha a disposizione tre diverse possibilità di scommessa: \"Punto\", \"Banco\", \"Egalité\" (pareggio).\n\nI pagamenti sono alla pari, ad eccezione della combinazione Egalité, pagata 8 a 1. La Casa da Gioco trattiene come cagnotte (tassa) il 5% delle vincite sulle puntate al Banco.\n\nIl banchiere conduce la partita, distribuisce le carte, ritira i gettoni perdenti e paga quelli vincenti.\n\nPer la determinazione dei punteggi ad ogni mano estrae dal sabot, una di seguito all'altra, quattro carte scoperte assegnando la prima e la terza al Punto, la seconda e la quarta al Banco.\n\nLeggendo il valore delle prime due carte si ferma o attribuisce ancora una carta a Punto rispettando la tabella dei tiraggi, (tableau de tirage), che riporta la regola di gioco da seguire per il Punto e per il Banco; successivamente, facendo sempre riferimento alla medesima tabella, termina la mano o serve la terza carta anche per la combinazione Banco.\n\nI punteggi di otto e nove, raggiunti con le prime due carte, danno il \"diritto di battuta\" (espressione usata allo Chemin de Fer per scoprire le carte) sia al Punto che al Banco.\n\nQueste combinazioni chiudono la mano escludendo la possibilità di effettuare eventuali \"tiraggi\".\n\nIl Punto deve attenersi alla regola che impone la terza carta quando le prime due formano una combinazione pari a 0, 1, 2, 3, 4 e 5, obbliga a restare quando raggiungono un punteggio di 6 o 7, e abbattere con 8 o 9.\n\nIl Banco esercita il diritto di battuta con 8 o 9, prende la terza carta con 0, 1 e 2, resta sempre con 7.\n\nCon un punteggio di 3, 4, 5 e 6 deve rispettare la tabella dei tiraggi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString=@"The Casinò di Venezia has rooms dedicated to traditional Punto Banco, that can host two dealers and up to fifteen players, whereas the semi-circular shaped Midi Punto Banco table can accommodate one banker and a number of players ranging from seven to nine.\n\nWhat are the possible stakes?\nEvery player has three different kinds of stake available:\n“Punto” (Player), “Banker” and “Egalité” (Tie), the latter being paid at 8 to 1.\n\nTraditional Punto Banco Baccarat (large variant) is played at a table with two dealers and up to fifteen players. whereas Midi Baccarat is played at a smaller, semi-circular table, similar to a Black Jack table, with a banker and between seven (Mini Baccarat) and nine players.\n\nThe cards from 1 (ace) to 9 score the value shown on them, and the picture cards (jack, queen, king) and 10s are worth zero.\n\nThe score of a hand is calculated by adding the value of the cards together and ignoring the tens digit (e.g. 8+6=14=4). The highest score that can be achieved is a 9 (known as a \"natural\" or abatage) with the first two cards, and the lowest is \"0\".\n\nEvery player can choose between three different kinds of stake: \"Punto\" or \"Player\", \"Banco\" or Banker, and \"Egalité\" or \"Tie\".\n\nPayments are evens except for the Egalité or Tie combination, which is paid at 8 to 1. The Casino keeps a 5% house commission (cagnotte) of winnings from stakes laid on the Banker's (Banco) hand. The Banker conducts the game, dealing the cards, raking in the losing chips and paying the winning ones.\n\nTo play a hand, four cards are extracted from the shoe (sabot), one at a time, and laid face down on the table. The first and third are dealt to the Player (Punto), the second and fourth are dealt to the Banker (Banco).\n\nHaving read the score from these first two cards, play stops or another card is dealt to the Player according to the Table of Play (Tableau de Tirage). This table lists the game rules to be observed by both the Player and the Banker. From this moment on, it is this Table of Play that always determines whether a hand will stand pat or whether a third card will be dealt to the Player or to the Banker.\n\nScores of eight and nine with the first two cards is a hand known as a \"natural\" or abatage (an expression used in Chemin de Fer for showing your cards ) for both the Player and the Banker.\n\nThese combinations close the hand and no further cards can be drawn.\nThe Player must abide by the rules and draw a third card if the first two cards total a score of 0, 1, 2, 3, 4 e 5, stand if they total a score of 6 or 7, and call a \"natural\" hand or abatage if they achieve 8 or 9.\n\nThe Banker also calls a natural hand (abatage) with an initial score of 8 or 9, draws a third card with 0, 1 and 2, and always stands with a score of 7.\n\nWith a score of 3, 4, 5 and 6 the banker must observe the rules in the Table of Play.";
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}


-(NSMutableAttributedString *)notesPunto {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Eventuali errori rilevati durante lo svolgimento della mano verranno corretti ricostruendo il colpo secondo la regola." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Any mistakes that may occur when playing a hand should be corrected by reconstructing play according to the rules in the Table of Play." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}



-(NSMutableAttributedString *)carribeanPoker {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il Caribbean Stud Poker si gioca con cinque carte coperte, il giocatore (player) punta contro il \"banco\" rappresentato dal Casinó cercando di realizzare una combinazione migliore.\n\nViene utilizzato un mazzo di cinquantadue carte da gioco formato da tredici carte per ognuno dei quattro semi (Cuori - Quadri - Fiori - Picche) così composti: un Asso (Ace), nove carte numerate in ordine crescente da 2 a 10, un Fante (Jack), una Donna (Queen) e un Re (King). Il loro valore è quello nominale.\n\nIl tavolo è simile nella forma a quello del Black Jack, i sette giocatori seduti hanno davanti a loro due caselle: ANTE e BET.\n\nLa partita inizia quando il Dealer (l'impiegato), passando la mano lungo la linea, di gioco invita a effettuare le puntate annun-ciando: \"Messieurs faites vos jeux\", per partecipare, ogni giocatore deve obbligatoriamente puntare su ANTE un importo compreso tra il minimo e il massimo indicato al tavolo e facoltativamente il Jackpot.\n\nIl Dealer, dopo aver verificato che tutte le giocate siano regolari dichiarando \"Rien ne va plus\" determina la fine delle puntate:   partendo da sinistra verso destra, prelevandole da una miscela-trice automatica (shuffle), distribuisce cinque carte coperte a ogni postazione assegnandole per ultimo anche a se stesso.\n\nIl giocatore, prima di raccogliere le carte, dovrà attendere che il Dealer abbia completato la loro distribuzione, girato l'ultima delle sue cinque, determinando in questo modo la regolarità della mano e annunciato: \"Prego\" (\"Go ahead\"). Dopo aver preso visione del proprio gioco, potrà scegliere fra tre opportunità: rinunciare, proseguire con quelle ricevute, cambiarne una.\n\nSe rinuncia deve porre le proprie carte, sempre con il dorso verso l'alto, sulla casella BET. Il Dealer provvederà a ritirarle assieme alla puntata su ANTE.\n\nSe decide di proseguire (rilanciare) deve puntare nella casella BET esattamente il doppio di quanto piazzato su ANTE, appoggiare le carte, con il dorso verso l'alto, alla sinistra della casella e attendere, senza poterle più toccare, che il Dealer scopra le proprie.\n\nSe invece intende cambiare una delle cinque carte ricevute, la deve posizionare, senza farla vedere, davanti alla base del lettore ottico utilizzata per la puntata sul Jackpot, sovrapporre alla stessa un importo in gettoni pari a quanto preceden-temente giocato su ANTE e sistemare le quattro rimanenti, con il dorso verso l'alto, alla sinistra della casella. Ricevuta la carta non potrà più toccare quella cambiata.\n\nDopo aver visionato la nuova composizione potrà decidere se portare a termine la mano o rinunciare attenendosi alle procedure precedentemente esposte.\n\nQuando tutti hanno definito il proprio gioco, il banchiere scopre, ordinandole, le sue carte, però se non forma almeno un \"Asso e Re\" \"non qualifica\" (non gioca). A questo punto, partendo dalla sua destra, senza vedere le carte dei giocatori e indipendente-mente dai giochi realizzati, paga alla pari tutte le puntate rimaste che si trovano su ANTE.\n\nSe la mano è composta da \"Asso e Re\" o migliore, il banchiere \"è qualificato\" (gioca). Partendo da destra confronta le sue carte con quelle dei giocatori: in base alle combinazioni ritira gli ANTE e BET perdenti e paga quelli vincenti (ANTE alla pari e BET secondo la tabella dei pagamenti)." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Caribbean Stud Poker is a game played with hands of five cards dealt face down. The “player” bets against the “bank” representing the Casino, and attempts to forma better combination.\n\nA deck of fifty-two playing cards is used, consisting of four suits (Hearts-Diamonds-Clubs-Spades), each made up of: an Ace, nine number cards from 2 to 10, a Jack, a Queen and a King. The cards are worth the number shown on them.\nThe table is similar to the Black Jack table. The seven players Sitting at the table have two squares drawn in front of them: ANTE and BET.\nThe game begins when the Dealer passes his hand along the game line and invites the players to place their bets by saying: “Messieurs faites vos jeux”. To take part in the game each player must lay on ANTE a bet between the minimum and maximum limit indicated on the table, and if they wish, On the Jackpot too.\n\nHaving checked that all the stakes are in order, the Dealer closes betting by declaring “Rien ne va plus”. Starting from left to right and using an automatic shuffler, he then deals five cards face down to each player and five cards to himself.\n\nBefore picking up the cards, the players must wait for the Dealer to finish dealing all the hands and turn over the last card. Then, having checked that everything is in order the Dealer announces, “Go Ahead”. Having looked at their cards, the players may choose between three different options: fold, continue with the cards dealt or change one card.\n\nIf they fold, they must play their cards face down on the BET square. The Dealer will then rake them in together with the stake placed on the ANTE square.\n\nIf the player decides to continue(raise) they must lay on the BET square a bet of exactly twice the stake placed on the ANTE square and lay the cards face down on the left of the Square and wait, without touching them, for the Dealer to Turn up his cards.\n\nIf, on the other hand, the player decides to change one of the cards they have received, they must place it face down in front of the optical reader used for the Jackpot stake and place on it a sum in chips equivalent to the stake placed on the ANTE square and lay the four remaining cards face down on the left of the square. Having received the card the player may no longer touch the card they have exchanged.\n\nHaving looked at their new hand the player can then decide whether to keep the hand or fold, following the procedures out lined previously.\nWhen all the players have played their hands the banker turns over and orders his cards. If the hand does not form an “Ace and King” or higher it does not qualify. At this point, starting from the right and without looking at the various players’ hands and no matter how the hands have been played, the Dealer pays out the same sum as the stakes left on the “ANTE” squares.\n\nIf the Dealer’s hand does form an “Ace and a King” or higher, the banker qualifies to play. Starting from the right he therefore compares his hand to those of the various players and depending on the combinations he either rakes in the losing ANTE and BET stakes and pays out the winning ones (ANTE bets are paid 1 to 1, where as BET wins depend on the payment table)." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}

-(NSMutableAttributedString *)progresiveCarribean {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il giocatore, puntando su ANTE, acquisisce il diritto di partecipare al \"Jackpot progressive\": per poter aderire deve appoggiare un gettone (bonus) del valore prestabilito nell'apposito alloggiamento con lettore ottico (cerchi giallo e rosso negli esempi); per concor-rere a questa vincita supplementare, realizzabile formando una delle seguenti combinazioni: Colore, Full, Poker, Scala Colore, Scala Reale, non deve aver effettuato il \"cambio carta\".\nLa vincita è indipendente dall'eventuale \"qualifica\" o \"gioco\" del banco; gli importi del pagamento sono riportati nella relativa tabella presente in ogni tavolo.\n\nIl Jackpot, collegato a tutti i Caribbean Poker, è incrementato dai BONUS (Side - Bets) giocati dai clienti: un display ne riporta l'ammontare totale. Il giocatore si deve assicurare, una volta giocato il BONUS, che il suo indicatore luminoso sia acceso. In ogni caso, prima che le carte siano ritirate, il giocatore dovrà sempre avvisare il banchiere \"non qualificato\" informandolo della vincita realizzata sul montepremi progressivo. Non è ammesso giocare solo il Jackpot." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Players who bet on ANTE, have the right to participate in the Progressive Jackpot. To take part they must add a chip(bonus) worth the preset amount to the jackpot box that is fitted with an optical reader (and marked with red and yellow circles in the examples). To compete for the bonus, players must not change a card. The jackpot is won by one of the following hands: Flush, Full House, Four of a kind, Straight Flush or Royal Flush. Jackpots are won regardless of whether the bank qualifies to play or not and the stakes are specified in the table indicated on every table.\n\nThe Jackpot, present In all Caribbean Stud Poker games, is increased by BONUSES (Side-Bets) played by customers, a display shows the total amount. When staking a BONUS players should check that the luminous indicator is ON. In any case, before the cards are raked in, players must always in form an “unqualified” banker of a progressive jackpot win. Players cannot stake the Jackpot only." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    return attMyString;
}

-(NSMutableAttributedString *)generalCarribean {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il Caribbean Stud Poker ha delle regole ben precise il cui rispetto vincola la normale prosecuzione del gioco. Si invitano pertanto i clienti a prendere visione delle principali disposizioni.\n• Ogni giocatore può occupare una sola postazione, deve sempre tenere ben visibili le carte sopra il tavolo, non può scambiare informazioni riguardanti il proprio gioco, far vedere le carte o guardare quelle distribuite agli altri.\n\n• Se un giocatore, dopo il cambio carta, raccoglie per errore una (anche se è la sua) o più carte scartate perde il diritto di portare a termine il gioco, si annulla la sua mano e gli viene restituita la puntata comprensiva del BONUS.\n\n• Se un cliente punta contemporaneamente sia ANTE che BET la giocata viene considerata al buio, pertanto le puntate e la composizione delle carte saranno accettate e ritenute valide. L'impiegato, in assenza di un tempestivo ripensamento del giocatore, potrà passare alla postazione successiva.\n\n• Se la puntata su ANTE è inferiore al minimo del tavolo, dopo l'attribuzione delle carte sulla postazione, potrà essere integrata solo nel caso in cui queste non siano state viste dal giocatore, diversamente, per quella mano sarà accettata \"come valida\".\n\n• Se un giocatore ha puntato sul BET un importo inferiore al doppio dell'ANTE l'eventuale vincita è rapportata all'effettiva puntata.\n\n• Se un giocatore ha puntato sul BET un importo superiore al doppio dell'ANTE l'eventuale vincita viene pagata in base alla puntata consentita, se perdente, viene restituita l'eccedenza.\n\n• Il giocatore che ha realizzato una Scala Reale o una Scala Colore deve sempre dichiararlo appena controllate le proprie carte. In questo caso viene sospesa momentaneamente la partita in tutti i tavoli. Il \"Jackpot progressive\" realizzato sulla combinazione di Scala Reale sarà diviso in parti uguali se due o più giocatori la realizzano nello stesso momento anche su tavoli diversi.\nLa stessa procedura sarà seguita per il \"Jackpot progressive\" formato con la combinazione di Scala Colore.\n\n• Il giocatore che cambia una carta perde il diritto di partecipare a una eventuale vincita di Jackpot. Nel caso in cui realizzi una Scala Reale, Scala Colore o Poker, e il banco si \"qualifichi\", riceverà un pagamento ridotto secondo quanto previsto dalla tabella dei pagamenti. Per tutte le altre combinazioni verranno mantenuti gli stessi pagamenti senza tenere conto del cambio carta.\n\n• Se la combinazione del banchiere è uguale a quelle del giocatore (ad esempio Asso e Re, Coppia, Tris, Colore ecc.) diventerà determinante il valore delle altre carte (vince la carta più alta).\nI semi delle carte non vengono considerati e qualora il valore delle cinque carte fosse uguale per entrambi, la mano è \"in parità\".\n\n• Al tavolo può sedere solo chi gioca.\n\n• Il banco gioca anche contro il singolo cliente.\n\n• Le carte ritirate o annullate dal Dealer, anche per errore, dopo esser state posizionate nel porta-carte o mescolate con altre, non potranno in nessun caso essere controllate o rimesse in gioco.\n\n• Le puntate minime e massime sono evidenziate sui singoli tavoli da gioco mediante appositi cartelli, gli importi sono strettamente vincolanti per il giocatore che non può mai superarli, neppure con l'intervento di terzi. La vincita eccedente realizzata superando il massimo consentito non sarà pagata e la differenza della puntata verrà restituita al cliente.\n\n• La soluzione di eventuali controversie in materia di gioco è demandata alla decisione inappellabile della Direzione Giochi.\n\nCircostanze nelle quali si annulla subito tutta la mano\n• Se il Dealer o uno o più giocatori hanno un numero non corretto di carte.\n\n• Se, a carte distribuite, quelle rimanenti nella shuffle si inceppano, fuoriescono o sormontandosi mostrano il loro valore.\n\n• Se il Dealer scopre una carta durante la distribuzione.\n\n• Se il Dealer, a carte distribuite e prima di girare la carta del banco, si accorge che è stata inavvertitamente saltata una postazione. Qualora se ne accorgesse dopo aver girato la propria carta o aver qualificato, la mano è valida.\n\n• Se al Dealer cadono una o più carte a terra o nel budino durante la loro distribuzione.\n\n• Se, dopo il cambio carte, il Dealer, mentre toglie quelle dei clienti che non intendono proseguire, ritira anche le proprie.\n\n• Se un giocatore raccoglie le carte prima che il Dealer finisca di distribuirle.\n\n• Se il Dealer, nella distribuzione, assegna la carta in una postazione non giocata. Se però se ne accorge dopo aver girato la propria carta (i clienti hanno perciò visto le loro) la mano è valida e si porta a termine. In ogni caso la postazione senza puntata non potrà entrare in gioco." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Caribbean Stud Poker has very strict rules that govern normal game procedures. Customers are therefore asked to read the main regulations.\n\n• Every player can occupy one place at the table only, they must always keep their cards clearly in view above the table and they must not exchange any information what so ever regarding their hand, show their cards or look at other people’s hands.\n\n• If, having changed a card, a player accidentally picks up one of the cards that has been thrown away(even if it is one of their own) the player cannot finish the game, their hand is declared null and void and their stake is returned, including the BONUS if they have staked one.\n\n• If a customer places a bet on both the ANTE and the BET square, the stake is considered blind and therefore the stake and the hand are accepted and considered valid. Unless the player changes their mind very quickly, the Dealer moves on to the next box.\n\n• If the stake placed on the ANTE square is less than the minimum table limit, after the cards have been dealt, the stake can only be raised if the player has not actually looked at the cards, otherwise the hand will be accepted “as valid”.\n\n• If the stake placed on the BET square is less than twice the stake placed on the ANTE square, an eventual win is based on the actual sum staked.\n\n• If the stake placed on the BET square is more than twice the stake placed on the ANTE square, an eventual win is based on the stake limit allowed, whereas if the player loses the difference is returned.\n\n• A player with a Royal or Straight Flush must always declare it as soon as they have looked at their cards. In this case all the games being played at the various tables are momentarily suspended. If more than one player wins the “Progressive Jackpot” with a Royal Flush hand at any of the various tables at the same time, the Jackpot will be divided in equal parts. The same procedure applies to more than one player winning the “Progressive Jackpot” with a Straight Flush hand.\n\n• Players who change a card cannot try for the jackpot. If they then make a Four of a kind, Straight Flush or Royal Flush hand and the bank “qualifies”, they receive a reduced payment according to the payment table. All the other combinations are paid the usual amount without taking into account the changed card.\n\n• If the banker’s hand is the same as that of a player(for example Ace King, Pair, Three of a kind, Flush etc.) the value of the other cards will decide who is the winner (the highest card wins). Suits are not taken into account and if the five cards have the same value the hand is considered a “tie”.\n\n• Only those playing may sit at the table. •The bank plays even against one customer only.\n\n• Once they have been placed in the used card basket or mixed with others, any cards that have been raked in or eliminated by the Dealer, even by mistake, cannot be checked or returned to the game.\n\n• The minimum and maximum stakes are indicated on the individual tables using appropriate signs. These limits are applied strictly and players may not exceed them, or use third parties to exceed them. Any excess wins made by surpassing the maximum limit will not be paid and the difference in the stake will be returned to the customer.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management.\n\nA hand is declared null and void immediately in the following circumstances\n\n• If the Dealer or one of the players has an incorrect number of cards in their hand.\n\n• If, once the cards have been dealt the remaining cards in the shuffler get stuck, exit or are turned face up.\n\n• If the Dealer turns a card face up by mistake when dealing.\n\n• If, having dealt the cards, and before turning over the bankcard, the Dealer realizes that he has skipped a box. If h realizes when the bank card has been turned over or after having qualified to play, the hand is valid.\n\n• If, while dealing, the Dealer drops one or more cards on the floor or into the chip tray.\n\n• If, having changed a card, the Dealer accidentally rakes in his own cards as well as the cards of the customers who have quit.\n\n• If a player picks up their cards before the Dealer has finished dealing.\n\n• If the Dealer accidentally deals a hand to a box that is not in the game. If however he realizes only after having turned over the bank card(and therefore the players have already seen their own cards) the hand is valid and should be played. In any case, the box that has no stake on it cannot enter the game." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}

#pragma FrenchRoulette


-(NSMutableAttributedString *)frenchRoulette {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"A Ca' Vendramin Calergi e a Ca' Noghera sono presenti room che ospitano tavoli di Roulette Francese, uno dei giochi più importanti e affascinanti di tutto il Casinò di Venezia. Lasciati sedurre dal rumore della boule che termina la sua corsa nel cilindro.\n\nIl tavolo (table de jeu) ha forma rettangolare, il piano è ricoperto quasi interamente da un tappeto verde (tapis verte) sul quale è disegnato il tracciato (tableau) formato dai numeri, dalle colonne, dozzine e combinazioni semplici.\n\nìIn uno dei due lati più corti è posizionata la \"roulette\", un cilindro in legno (le cylindre) al cui interno ruota, appoggiato su un meccanismo di precisione, un piatto metallico suddiviso in trentasette caselle (cases), queste comprendono lo 0, diciotto numeri rossi e diciotto numeri neri alternati tra loro dall'1 al 36. Vicino alla roulette è sistemata la dotazione della \"banca\" composta da gettoni (jetons et plaques) di forma e valore diversi.\n\nIl Capo Tavolo (Chef de Table) è responsabile del tavolo; egli ha il compito di sovrintendere le attività di gioco garantendo il rispetto dei regolamenti mentre i tre impiegati (croupiers), seduti al tavolo rispettivamente a destra (droite), a sinistra (gauche) e di fronte (bout de table) allo Chef, hanno l'incarico di condurre la partita eseguendo tutte le operazioni necessarie al suo regolare svolgimento.\n\nIl gioco è molto semplice: si scommette contro il banco cercando di indovinare in quale numero cadrà la pallina lanciata dal croupier (le bouler). Le puntate vincenti daranno diritto a dei premi proporzionali sia al valore dei gettoni che al tipo di combinazione scelta.\n\nLa partita inizia con il tradizionale annuncio dell'impiegato \"Messieurs, faites vos jeux\", rivolto ai giocatori (joueurs) per invitarli a effettuare le proprie puntate, termina con il lancio della boule (il giro è inverso a quello del cilindro) e la consueta frase \"Rien ne va plus\". Da questo momento in poi non è più permesso giocare, solamente il Capo Tavolo può concedere una deroga.\n\nLa pallina determina il numero vincente quando si ferma in una delle trentasette caselle del cilindro.\nLe bouler annuncia in francese il numero e le relative combinazioni semplici (rouge o noir, pair o impair, manque o passe). Subito dopo gli impiegati di destra e di sinistra svolgono i seguenti compiti: uno indica il numero sul tappeto con il rastrello (rateau), elenca in francese le combinazioni multiple vincenti e ritira i gettoni perdenti; l'altro paga le vincite, completando una combinazione alla volta, rispettando il seguente ordine: colonna, dozzina, chances semplici, sestine e terzina, carré, cavallo e pieno.\n\nSe il numero uscito è pari rastrella l'impiegato di destra, mentre quello di sinistra paga, se è dispari avviene il contrario.\n\nNelle colonne e dozzine i pagamenti iniziano dai gettoni di valore minore e terminano con quelli di valore maggiore. Nelle combinazioni semplici, indipendentemente dalla puntata, vengono pagati per primi i gettoni fisicamente più lontani rispetto all'impiegato, posizionando le fiches, al pari delle colonne e dozzine, accanto o sopra alla posta iniziale. Nelle \"combinazioni multiple\" l'impiegato passa con il rateau un pagamento alla volta iniziando dalle vincite realizzate con la puntata di importo inferiore e terminando con quelle di importo maggiore.\n\nCon l'uscita dello 0 vincono le puntate su questo numero e sulle sue combinazioni multiple; perdono colonne e dozzine, mentre le giocate sulle combinazioni semplici, dimezzando il loro valore, sono \"messe in prigione\" (enfermées) e spostate sull'apposita linea.\n\nLe puntate \"imprigionate una volta\", se vincenti il colpo successivo, vengono liberate dall'impiegato e possono essere ritirate, se perdenti sono incamerate dal banco.\n\nLe puntate \"imprigionate più volte consecutive\" (fino ad un massimo di tre, alla quarta l'importo ancora in gioco sarà diviso) per poter essere liberate dovranno vincere tante volte quante sono state imprigionate.\n\nAd ogni uscita dello 0 il giocatore ha la possibilità di ritirare metà della posta rimasta \"à partager\" (l'altra sarà trattenuta dal banco), lasciarla dove si trova o farla spostare, sempre vincolata, in un'altra combinazione semplice." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Both Ca' Vendramin Calergi and Ca' Noghera have rooms and tables dedicated to French Roulette, one of the most important – and enchanting – games of the entire Casinò di Venezia. Allow yourself to be tempted by the sound of the boule as it finishes its run on the wheel.\n\nHow to win at French Roulette?\nThe game is really simple and the idea is to guess on which number the boule, spun by the croupier, will stop. Depending on the combination selected, one is entitled to proportional prizes.\n\nThe table (table de jeu) is rectangular and the top is covered almost completely with green baize (tapis verte) on which the grid (tableau) is drawn. The grid is made up of numbers, columns, sixlines and simple combinations.\n\nThe roulette is positioned at one end of the table. This consists of a wooden wheel (le cylindre), with a metal plate that turns inside it. The plate, which is mounted on a precision mechanism, is divided into thirty-seven pockets (cases), including a zero pocket, eighteen red numbers and eighteen black numbers that alternate from 1 to 36. The “bank” that holds chips of various shapes and values (jetons et plaques) is located next to the roulette wheel.\n\nThere is a Table Supervisor (Chef de Table) whose job it is to 5 supervise the game and ensure that all the regulations are properly observed, and three croupiers who sit, one on the right (droite), one on the left (gauche) and one in front of (bout de table) the Chef de Table. Their job is to do everything that is needed to conduct the game orderly and efficiently.\n\nThe game is extremely simple and involves betting against the bank by guessing in which pocket the ball tossed by the croupier (le bouler) will land. Winning bets are paid in direct proportion to the value of the chips staked and the kind of combination selected.\n\nThe game begins with the croupier’s traditional call of “Messieurs faites vos jeux” that invites the players (joueurs) to lay their bets and ends when the boule is tossed (the boule is spun in the opposite direction to which the wheel is turning) with the customary phase, “Rien ne va plus”. From this point on, no more bets can be laid, and only the Chef de Table can make an exception.\n\nThe boule determines the winning number when it lands in one of the thirty-seven pockets on the wheel.\n\nLe Bouler announces in french the winning number and the winning simple combinations (rouge o noir, pair o impair, manque o passe). The two croupiers on the right and left then act as follows.\n\nOne indicates the winning number on the grid with a rake (rateau), then lists the winning multiple combinations in french, and finally rakes in the losing chips, while the other pays out the wins, one combination at a time and in the following order: columns, dozen, simple combinations, sixlines, streets, corner, splits and straight bets.\n\nIf the winning number is even, the croupier on the right rakes in the chips while the croupier on the left pays the winners. If, on the other hand, the winning number is odd, they swap roles.\n\nWith columns and dozen payment begins from the winning chips with the lowest value and finishes with the highest. With simple combinations, no matter what the stake, payment begins from the chips located furthest from the croupier who is paying. Column and dozen wins are paid by placing chips of the same amount next to the initial stake. With multiple combinations the croupier pays one winning bet at a time with the rake, starting with the lowest stake and finishing with the highest.\n\nIf the boule lands on 0 the bets laid on 0 and its various multiple combinations win, columns and dozen all lose, and simple combination stakes are halved in value and “imprisoned” (enfermées) on the appropriate line.\n\nStakes that are “imprisoned only once” are released by the croupier if they win, whereas they are claimed by the bank if they lose.\n\nTo free stakes that have been “imprisoned for consecutive rounds” (there is a limit of three rounds and if the stake is still valid in the fourth round it is split), they must win the same number of times they have been imprisoned for.\n\nEvery time the winning number is 0 is the player can withdraw half the stake left “à partager” (the other half is kept by the bank), leave it where it is or shift it (even though it remains imprisoned) to another simple combination." ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}


-(NSMutableAttributedString *)sectorFrench {
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"La Serie 5/8 e i Vicini dello Zero sono tradizionalmente tenuti \"pagati a piazzare\" dall'impiegato, i gettoni corrispondenti all'ammontare della giocata sono stesi a fianco della linea esterna che delimita il Passe o il Manque. A numero uscito, il gettone, nella terzina e nel Carré dei Vicini dello Zero sono due, verrà piazzato solo se risulterà vincente la combinazione giocata mentre sarà annullato se perdente.\n\nLa Serie 5/8 (Le Tiers du Cylindre)\nSi giocano dodici numeri con sei gettoni ed è formata dai seguenti cavalli: 5/8 - 10/11 - 13/16 - 23/24 - 27/30 - 33/36.\n\nI Vicini dello Zero (Les Voisins du Zéro)\nSi giocano diciassette numeri con nove gettoni e sono formati dalle seguenti combinazioni: due pezzi sulla terzina 0/2/3 e carré 25/29, un pezzo per ognuno dei seguenti cavalli 4/7 - 12/15 - 18/21 - 19/22 - 32/35.\n\nGli Orfanelli (Les Orphelins)\nSono formati da due settori del cilindro distanti tra loro che separano i numeri della Serie 5/8 da quelli dei Vicini dello Zero: 17/34/6 da una parte e 1/20/14/31/9 dall'altra.\n\nGli Orfanelli si accettano giocati a cavallo con cinque gettoni così ripartiti: un pezzo in pieno al numero 1 e un pezzo per ognuno dei seguenti cavalli: 6/9 - 14/17 - 17/20 - 31/34, oppure in pieno con otto gettoni.\n\nLa Nassa\nSi gioca con cinque pezzi puntando un gettone per ognuna delle seguenti combinazioni: 0/3 - 12/15 - 19 - 26 - 32/35.\nUna variante, nota come \"Zero spiel\", non comprende il 19 e quindi si gioca con quattro gettoni posizionati singolarmente: 0/3 - 12/15 - 26 - 32/35.\n\nSettore di 5 Numeri (Un Numéro et Deux Voisins)\nÈ formato da un numero e dai suoi laterali sul cilindro, due a destra e due a sinistra. Si punta con cinque pezzi giocando i pieni.\n\nLe Finali (Les Finales)\nSi individuano osservando il tracciato dei numeri sul tappeto, possono essere in pieno e a cavallo. Le finali in pieno sono formate dai numeri che hanno in comune la stessa cifra finale (le unità), ad esempio la \"1\": 1/11/21/31. Le finali a cavallo hanno in comune le unità di due numeri vicini tra loro (a cavallo) e, a loro volta, si dividono in orizzontali e verticali.\n\n- Le Finali Verticali\nSono formate da due numeri posti uno sopra all'altro, si giocano a cavallo con tre o quattro gettoni determinati dalla posizione dei numeri sul tracciato. Esempio finale 3/6 quattro pezzi: 3/6 - 13/16 -23/26 - 33/36.\n\n- Le Finali Orizzontali\nComprendono una sequenza di due numeri consecutivi giocati a cavallo e in pieno (due per Finale) determinati dalla loro collocazione sul tracciato, si puntano con quattro o cinque gettoni. Molto richiesta è la finale 8/9: 8/9 - 18 - 19 - 28/29 (quattro pezzi).\n\nGli annunci vincenti si possono far rigiocare dall'impiegato utilizzando l'importo del pagamento:\n\nA rifare             Lo stesso numero di pezzi.\n\nA completare    Lo stesso numero di pezzi, meno la puntata.\n\nPer il tutto        (Serie e Vicini) Tutta la vincita e la puntata\n\n(la serie triplica, i vicini raddoppiano)." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"La Serie 5/8 (Le Tiers du Cylindre)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"I Vicini dello Zero (Les Voisins du Zéro)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Gli Orfanelli (Les Orphelins)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"La Nassa" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Settore di 5 Numeri (Un Numéro et Deux Voisins)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Le Finali (Les Finales)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"- Le Finali Verticali" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"- Le Finali Orizzontali" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"A rifare" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"A completare" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Per il tutto" ]];
            
            break;
        default:
            
            myString= @"The 5/8 Series and the Voisins du Zéro are traditionally bets “placed” by the croupier, and the chips representing the stake are placed beside the outside grid line of the Passe or Manque square. When the number has been called, the chip in the Voisins du Zéro street and corner, there are two, are placed only if the winning number is in the combination staked.\n\nIf the number is not in the combination, the bet is cancelled.\n\nThe 5/8 Series (Le Tiers du Cylindre)\nThis is a bet where twelve numbers are played by placing six chips on the following splits: 5/8 - 10/11 - 13/16 - 23/24 - 27/30 - 33/36.\n\nLes Voisins du Zéro\nThis is a bet where seventeen numbers are played by placing nine chips on the following combinations: two chips on the 0/2/3 street and on the 25/29 corner and one chip on each of the following splits: 4/7 - 12/15 - 18/21 - 19/22 - 32/35.\n\nOrphans\nThese numbers make up the two opposite sectors on the wheel that separate the 5/8 Series from the Voisins. They are: 17/34/6 on one side, and: 1/20/14/31/9 on the other.\n\nAn Orphans bet requires a stake of five chips, one straight bet 19 on number 1 and one chip on each of the following splits: 6/9 - 14/17 - 17/20 - 31/34, or a straight bet of eight chips.\n\nNassa\nThis is a five-chip bet where one chip is laid on each of the following combinations: 0/3 - 12/15 - 19 - 26 - 32/35.\nA variant known as “Zero spiel”, does not include the number 19 and is therefore played with four chips: 0/3 - 12/15 - 26 - 32/35.\n\n5 Number Sector (Un Numéro et Deux Voisins)\nThis is a bet that consists of backing a number as well as the two numbers on either side of it on the wheel. Five chips are laid down as a straight bet.\n\nFinal Digit Bets (Les Finales)\nThese bets are combinations that depend on the order of the numbers on the grid and can be placed as either straight-up or split bets. Straightup final bets consist of numbers with the same last digit (units).\nA final digit bet of “1” for example, is made up of 1/11/21/31.\n\nSplit final bets, on the other hand, share the same final digit of two numbers that are next to each other (splits) and which are in turn divided into horizontal and vertical splits.\n\nVertical Final Digit Bets\nThese bets are made up of two numbers, situated one above the other, and are staked as split bets with three or four chips depending on the position of the numbers on the grid. An example of a 3/6 final digit bet with four chips is: 3/6 - 13/16 -23/26 - 33/36.\n\nHorizontal Final Digit Bets\nThese bets cover a sequence of two consecutive numbers staked as straight-up and split bets (two per final) with four or five chips depending on their position on the grid. A favourite is the 8/9 final digit combination, consisting of: 8/9 - 18 - 19 - 28/29 (four chips).\nIf a called bet wins it can be replayed by the croupier using the sum paid out as follows:\n\nTO REPLAY\nThe same number of chips\n\nTO COMPLETE\nThe same number of chips, less the stake.\n\nTO PLAY ALL (Series and Voisins)\nThe entire win plus the stake (A Series triples and a voisin doubles)." ;
            
             _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"The 5/8 Series (Le Tiers du Cylindre)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Les Voisins du Zéro" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Orphans" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Nassa" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"5 Number Sector (Un Numéro et Deux Voisins)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Final Digit Bets (Les Finales)" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Vertical Final Digit Bets" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"Horizontal Final Digit Bets" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"TO REPLAY" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"TO COMPLETE" ]];
            [attMyString setAttributes:secondAttributes range:[myString rangeOfString: @"TO PLAY ALL (Series and Voisins)" ]];
            break;
    }

    
    return attMyString;
}

-(NSMutableAttributedString *)generalFrench {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"• Ogni spostamento, correzione o errore anche dell'impiegato di gioco, dovrà essere segnalato al Capo Tavolo prima dell'annuncio del \"Rien ne va plus\".\n\n• La vincita è determinata unicamente dalla posizione del gettone all'uscita del numero, quindi il cliente è invitato a seguire attentamente lo svolgimento della partita, a controllare la posizione dei propri gettoni sul tavolo da gioco, anche se piazzati dall'impiegato, e a presenziare ai pagamenti.\n\n• La Direzione declina ogni responsabilità sulle puntate effettuate dall'impiegato in modo non conforme alle richieste del giocatore.\n\n• Non è consentito puntare a cavallo sulle combinazioni semplici, sulle dozzine e sulle colonne.\n\n• Il giocatore che vince conserva la sua puntata iniziale che può essere lasciata nella stessa combinazione oppure, al termine del pagamento, ritirata o spostata.\n\n• I giocatori non possono toccare i gettoni vincenti prima che siano completati tutti i pagamenti.\n\n• Per poter nuovamente puntare i giocatori devono attendere che l'impiegato abbia liberato il numero e ritirato tutte le giocate perdenti (sulle combinazioni vincenti è possibile farlo al termine di tutti i pagamenti).\n\n• Le vincite non riscosse sulle chances multiple sono subito accantonate assieme alle puntate, quelle sulle chances semplici, colonne e dozzine dopo il terzo colpo.\n\n• Le puntate minime e massime sono evidenziate sui singoli tavoli da gioco mediante appositi cartelli, gli importi sono strettamente vincolanti per il giocatore, che non può mai superarli neppure con l'intervento di terzi. La vincita eccedente realizzata superando il massimo consentito non sarà pagata e la differenza della puntata verrà restituita al cliente.\n\n• La Direzione si riserva il diritto di modificare i minimi e i massimi anche nel corso della stessa giornata: il Capo Tavolo avviserà verbalmente i giocatori e disporrà il cambio del relativo cartello.\n\n• È facoltà della Direzione sospendere la partita in qualsiasi momento della giornata.\n\n• La risoluzione di eventuali controversie in materia di gioco è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"• Any changes, adjustments or mistakes, including those made by the croupier, must be reported to the Table Supervisor (Chef de Table) before “Rien ne va plus” is declared .\n\n• Winning bets are determined solely by the position of the chip when the ball lands in the pocket. Therefore customers are invited to follow the progress of the game closely, check the position of their chips on the table, even if they are placed by the croupier, and be present at payments.\n\n• The management is not responsible for bets laid by the croupier in a way that does not comply with the player’s requests.\n\n• Split bets are not permitted on simple combinations, dozen or columns.\n\n• Player who win keep their initial stake and have the choice of letting it ride, withdrawing it or shifting it.\n\n• Players may not touch winning chips before all payments have been completed.\n\n• To lay a new bet players must wait for the croupier to free numbers and rake in all the losing bets (customers can only lay a new bet on a winning combinations after all payments have been made).\n\n• Any multiple chances (combination bet) wins that are not claimed shall be put to one side immediately for the customer by the croupier, together with the stakes, whereas unclaimed wins on simple chances, columns and dozen are put to one side by the croupier after three rounds.\n\n• The minimum and maximum stakes are indicated on the individual tables using appropriate signs. These limits are applied strictly and players may not exceed them, or use third parties to exceed them. Any excess wins made by surpassing the maximum limit will not be paid and the difference in the stake will be returned to the customer.\n\n• The Management reserves the right to change the maximum and minimum limits at any time, even on the same day. If this should occur the Table Supervisor (Chef de Table) will inform the players verbally and a sign indicating the changes will be displayed.\n\n• It is the Management’s right to suspend play at any time.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management." ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}

#pragma Chemin

-(NSMutableAttributedString *)chemin {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Bello, magico e coinvolgente, lo Chemin de Fer appassiona da sempre i più grandi giocatori di tutto il mondo e in tutti i casinò. Sembra che le sue origini risalgano all’epoca medievale, quando un gioco chiamato “Baccarà” veniva praticato con i tarocchi, considerati magici, tanto da essere decorati da illustri artisti e usati come strumenti di divinazione.\n\nLo Chemin de Fer è il più classico e affascinante gioco di carte.\nBello, magico, coinvolgente, appassiona da sempre i più grandi giocatori di tutto il mondo.\n\nSembra che le sue origini risalgano all’epoca medievale, quando un gioco chiamato “Baccarà” veniva praticato con i tarocchi, considerati magici, tanto da essere decorati da illustri artisti e usati come strumenti di divinazione.\n\nNei primi anni del Cinquecento arrivò in Francia dove, prima di essere introdotto nei casinò, rimase per lungo tempo un gioco esclusivo riservato alla nobiltà.\n\nIl nome deriva dal particolare disegno rappresentato sul “panno verde” che ricorda le rotaie e dalla forma del sabot (contenitore utilizzato per la distribuzione delle carte) simile a una piccola locomotiva che si muove da un giocatore all’altro: “Chemin de Fer”, ferrovia in francese.\n\nIl Casinò di Venezia ospita nelle sale più riservate della rinascimentale Ca’ Vendramin Calergi una serie di grandi appuntamenti con gare e tornei dai premi prestigiosi, mentre a Ca’ Noghera è possibile partecipare a tornei quotidiani “sit&go” ." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Chemin de fer is the classic card game. Glamorous, magical and exciting, it is a game that has always thrilled the greatest gamblers the world over.\n\nIt seems that the origins of this game date back to the medieval period, when a game called “Baccarat” was played with Tarot cards. These special cards were considered magical and were often decorated by famous artists and used to tell fortunes.\n\nThe game reached France at the beginning of the sixteenth century, where before being introduced to the casinos, it first enjoyed a lengthy period as an exclusive game played only by the nobility.\n\nThe name of the game, “Chemin de Fer”, which means railway in French, comes from the fact that the grid drawn on the green baize Baccarat table resembles railway lines and the card shoe or sabot (a card holder that distributes the cards and is passed round the table from player to player) looks like a small train.\n\nCasinó di Venezia holds a series of Chemin de Fer tournaments with prestigious prizes in the most exclusive salons of its elegant renaissance palazzo, Ca’ Vendramin Calergi" ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }

 
    
    
    return attMyString;
}

-(NSMutableAttributedString *)cheminTheGame {
    
    
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"Il tavolo si presenta di forma ovale, il tracciato delimita nove postazioni, quelle per i giocatori sono otto, numerate in ordine crescente, la rimanente è caratterizzata da una leggera rientranza sul bordo ed è riservata al Capo Partita.\nAl centro del tavolo si trovano tre piccole aperture: in quella principale, di dimensione maggiore chiamata “sibilla”, vengono introdotte le carte che sono annullate alla fine di ogni “colpo”, mentre nelle due più piccole, collocate alla destra e alla sinistra della “sibilla”, vengono inserite le mance. Alla destra del Capo Partita è posizionata una quarta fessura nella quale sono collocate le fiches che, come vedremo, costituiscono il pagamento della tassa che spetta alla Casa da Gioco.\nVicino al tavolo è sempre presente un impiegato chiamato “Changeur”, egli ha il compito di collaborare con il Capo Partita intervenendo sul cambio dei gettoni e banconote. Per la sua mansione utilizza una dotazione di gettoni della Casa da Gioco.\nIl gioco si svolge con l’impiego di sei mazzi di cinquantadue carte (six jeux de 52 cartes): tre hanno il dorso di un colore e tre di un altro. In totale le carte sono 312.\nLo scopo del gioco è di raggiungere il punto più alto (9) o avvicinarsi il più possibile, sommando i valori delle due o tre carte assegnate.\nIl punteggio più basso è zero (Baccarà). Gli assi valgono un punto, le figure e i 10 zero punti, mentre le altre carte mantengono il loro valore nominale. Il risultato finale si ottiene sommando il valore di ogni carta togliendo la decina quando possibile (8 + 7 = 15 - 10 = 5).\nLa partita si svolge esclusivamente tra i giocatori (jouers), mentre il compito del Capo Partita (croupier) è quello di condurla, far rispettare le regole e prelevare la tassa del 5% (cagnotte), a favore della Casa da Gioco, sul solo importo che il banchiere (le banquier) vince di volta in volta.\nLa partita può incominciare quando al tavolo sono seduti almeno sei giocatori su otto posti disponibili, chi desidera occupare un posto ha l’obbligo di farne richiesta al Commissario di Gioco. Possono partecipare anche giocatori in piedi, nei limiti previsti dal regolamento, in particolare dovranno effettuare le puntate esclusivamente davanti a loro e non potranno seguire le mani cambiando posizione.\nInizia la mano il giocatore seduto alla postazione n. 1 (banchiere) il quale scommette una somma pari almeno al minimo del tavolo stabilito dal Commissario di Gioco.\nSe vince, il banchiere continua. Per rimanere in gioco è però obbligato a mettere in palio tutta la posta (puntata e vincita).\nLa mano passa dal banchiere al giocatore successivo (da sinistra a destra) quando si verifica una combinazione perdente per il banco (la banque), oppure quando il banchiere si ritira dopo aver terminato almeno un colpo valido (dare seguito).\nUna mano è l’insieme di uno o più colpi.\nAd ogni colpo il banchiere sfila dal sabot quattro carte: la prima e la terza sono per la “punta” (le ponte), giocatore che si confronta con il banchiere, la seconda e la quarta per il banchiere.\nConclusa la distribuzione delle carte la “punta”, guardando le sue senza farle vedere, deve dichiarare il gioco per prima chiamando “carta” se vuole la terza carta, “no” se non la vuole (carte ou pas de carte) oppure evidenziare la “battuta” (abatage): mostrare il punteggio di 8 o 9 realizzato con le prime due carte. La battuta preclude all’avversario la possibilità di variare il suo punteggio.\nIl banchiere, dopo che la “punta” ha manifestato il proprio gioco, scopre le sue carte e solo in questo momento assegna l’eventuale carta o la prende rispettando lo svolgimento del gioco.\nVince il giocatore che con la somma complessiva delle proprie carte si avvicina di più, o raggiunge, il punteggio di 9.\nSe si verifica la parità tra banchiere e punta il colpo è considerato nullo (égalité - le coup est nul).\n Nel caso di combinazione perdente, “la punta” ha la possibilità di rimanere ancora in gioco e chiamare nuovamente “banco” (banco suivi) escludendo dal colpo gli altri giocatori.\n\nNel gioco vi sono tre puntate consuete:\n• Banco solo\nLa punta gioca da sola contro il banchiere\n• Banco con il tavolo\nIl giocatore alla punta scommette metà della somma del banchiere\n• Puntate di singoli giocatori\nConcorrono assieme fino alla copertura del banco senza superarlo. In questo caso le carte della punta sono assegnate al giocatore che ha scommesso la cifra maggiore.\nIl giocatore che vuole partecipare alla mano deve porre la puntata davanti alla propria casella oltre la linea di divisione; quella posta sopra la linea vale la metà del proprio valore, salvo diversa dichiarazione del giocatore. Le puntate dei giocatori in piedi hanno lo stesso valore di quelle effettuate dai giocatori seduti." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"The table is kidney-shaped and seats nine people. The table has eight boxes drawn on it for the players, plus a special recess, which is where the Croupier sits.\n\nIn the centre of the table there are three baskets. The main, largest one called the “sibyl” is where used cards are put at the end of every coup (round). The two other openings, on the right and left of the sibyl are for tips.\nThere is a fourth slot on the right of the Croupier, for the chips that constitute the Casino’s commission as we will see later.\n\nA steward called the “Changeur” always stands near the table.\nTheir job is to assist the Croupier by helping to change up chips and banknotes. To do this the Changeur is entrusted with a stock of Casino chips.\nThe game is played with six decks of fifty-two cards (six jeux de 52 cartes): three decks with card backs of one colour and three decks with card backs of a different colour. This makes a total of 312 cards.\nThe aim of the game is to reach a score of 9 points or as near to 9 as possible by adding together the values of the two or three cards drawn.\nThe lowest score is zero (Baccarat). Aces count as one point, the picture cards and 10s count as zero and the other cards are worth the value shown on them.\nThe end score is obtaining by adding together the value of the cards minus 10 wherever possible (8 + 7 = 15 - 10 = 5).\nThe players (jouers) play against each other, not against the Casino, and the croupier directs play only, ensuring that the rules are observed and taking a 5% (cagnotte) commission of any sums the banker (le banquier) wins for the Casino.\nTo begin the game at least six players must be sitting at the table, which has eight places. Players who wish to take a place at the table must first ask the Game Supervisor. Players who are standing may also take part in the game within the prescribed limits. One of these limits is that they may only stake the box in front of them and they may not change position during a hand.\nThe game begins with the player sitting at box no. 1 (banker), who lays a stake equal or higher than the minimum table limit specified by the Game Supervisor.\nIf the banker wins, he may continue, but to stay in the game, he must bet the entire stake (original bet + win).\nIf, on the other hand, the banker (la banque) loses or retires after at least one valid round (passes the bank on), the hand passes onto the next player (from left to right). A hand is a sequence of one or more rounds (coups).\nAt each round the banker takes four cards from the sabot, the first and third are for the “punter” (le ponte, i.e. the other player), the second and fourth are for the bank.\nWhen the cards have been dealt the punter looks at his cards without showing them and decides whether or not to call for a third card by saying “card” or “no card” (carte ou pas de carte). If the punter has scored 8 or 9, he must announce the number (abatage) and turn his cards over.\nIf this happens the banker cannot draw a third card and his score is based on the two cards already dealt.\nAfter the “punter” has made his play, the banker turns his cards over and draws another card or stands.\nThe player with the highest score wins, i.e. the player whose card score is 9 or nearest to 9.\n\nIf the banker and the punter draw, the round is considered invalid (égalité - le coup est nul).\n\nIf the “punter” loses, he may keep playing by announcing “banco” (banco suivi) again. This excludes the other players from the round.\n\nThere are usually only three stakes made in this game:\n\n• Bank only\n\nThe punter plays alone against the banker\n\n• Bank with table\n\nThe punter bets half the sum staked by the banker\n\n• Individual player stakes\n\nThe stakes of the various players play together to cover the bank without exceeding it. With this stake the punters’ cards are dealt to the player who has staked the highest sum.\n\nPlayers who wish to take part in a hand must place a stake in front of their own box beyond the dividing line. Stakes placed over the line are worth half their value unless the player declares otherwise. The value of the stakes laid by the players standing up are exactly the same as those laid by the players sitting down." ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}



-(NSMutableAttributedString *)playingChemin {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"I giocatori sono liberi di attenersi o no alla tabella di seguito riportata detta “Regola”. Coloro che intendono attenersi alla tabella della Regola hanno l’obbligo di dichiararlo al Capo Partita, che a sua volta informerà tutti gli altri giocatori.\n\nIl Capo Partita deve sempre evidenziare coloro che giocano alla “Regola”, poiché in caso di errori il cliente è tutelato dal regolamento: i colpi non conformi sono ricostruiti dall’impiegato in base alla Regola stessa." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"Players are free to abide by or ignore the table shown below, known as the “Rule Table”. Those who wish to abide by the Rule Table must tell the Croupier who in turn informs the other players.\n\nThe Croupier must always indicate “Rule Table” players as if there is a mistake the customer is safeguarded by the regulations, which state that any rounds that do not comply must be reconstructed by the Game steward according to the Rule Table." ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    
    return attMyString;
}

-(NSMutableAttributedString *)generalChemin {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=@"";
    NSMutableAttributedString *attMyString;
    NSInteger _stringLength=0;
    
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            myString= @"• Il Commissario si riserva il diritto di formare i tavoli “a sua discrezione”, assegnando il posto ai giocatori prenotati.\n\n• Non si possono occupare più posti allo stesso tavolo o a più tavoli.\n\n• Nel Grande Tavolo i posti riservati ai giocatori sono nove.\n\n• Soltanto l’impiegato chiude il gioco con la consueta frase:\n“Rien ne va plus”, le puntate fatte in tempo non potranno essere modificate, dovranno essere individuali e saranno ritenute valide solamente se effettuate con gettoni della Casa da Gioco o con valuta in Euro. Le puntate giocate dopo il “Rien ne va plus” non sono accettate.\n\n• Quando il banchiere passa la mano, l’impiegato offre il seguito “all’altezza” (per l’intero importo del banco) ai giocatori seduti al tavolo partendo da quello seduto alla destra del banchiere uscente. Se non viene assegnato, viene offerto a tutti gli altri giocatori in piedi e sarà aggiudicato a chi “parla per primo”.\n\n• Se la mano non è presa “all’altezza” viene posta “all’asta” e attribuita al miglior offerente senza distinzione fra chi gioca al tavolo seduto o in piedi. Se però l’offerta fra più giocatori ha lo stesso importo, viene preferito quello seduto.\n\n• Le carte, che all’interno del sabot mostrano il loro valore, sono annullate; in nessun caso la carta staccata dal sabot può essere rimessa al suo interno, è rigorosamente vietato guardare le carte mentre si sfilano dal sabot.\n\n• I giocatori seduti ai tavoli da gioco e quelli che assistono sono tenuti a non conversare o commentare ad alta voce lo svolgimento della partita.\n\n• Le puntate e le vincite non riscosse sono ritirate dal Commissario e depositate conformemente alle disposizioni della Direzione Giochi.\n\n• Il Commissario di Gioco ha la possibilità di modificare il minimo del tavolo anche nel corso della partita avvisando verbalmente i giocatori.\n\n• È facoltà della Direzione sospendere la partita in qualsiasi momento della giornata.\n\n• La soluzione di eventuali controversie è demandata alla decisione inappellabile della Direzione Giochi." ;
            
            _stringLength=[myString length];
            
            attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            break;
        default:
            
            myString= @"• The Game Supervisor reserves the right to form tables “at his/her discretion” by assigning places to players who have reserved them.\n\n• Players may not occupy more than one place, either at the same table or other tables.\n\n• There are nine places reserved for players at the Grand Table.\n\n• Only the Game Steward can close betting using the customary phrase, ”Rien ne va plus” and after this players may not change their stakes. All stakes must be laid individually and shall be considered valid only if they consist of chips belonging to the Casino or Euros. Any stakes placed after ”Rien ne va plus” has been called will not be accepted.\n\n• If the banker decides to withdraw and “pass the deal”, the game steward offers it to any of the players who are willing to start the bank “all’altezza” (i.e. with the same amount at which it stood when the last banker retired). The steward offers the bank in rotation to the players sitting at the table, starting with the player on the right of the last banker. If none of the seated players accept, the bank is then offered to the standing player that “speaks first”.\n\n• If no one accepts the bank “all’altezza” it is put up for auction and passed onto the player who bids the most. No distinction is made between the players sitting down and standing up. If, however, two or more players bid the same amount, players who are seated take precedence.\n\n• Any cards that appear face up in the sabot are automatically null and void and once a card has left the sabot it may not be put back inside it. It is strictly forbidden to look at the cards as they are being removed from the sabot.\n\n• Players sitting or standing at the table and anyone who is watching are kindly asked not to talk or comment aloud on the progress of the game.\n\n• Any unclaimed stakes or wins shall be raked in by the Game Supervisor and put to one side in compliance with the procedures laid down by the Gaming Management.\n\n• The Game Supervisor has the right to change the minimum stake limits at any time, even during a game, by informing the players verbally.\n\n• It is the Management’s right to suspend play at any time.\n\n• Any dispute that may arise will be settled without right of appeal by the Gaming Management." ;
            
            NSInteger _stringLength=[myString length];
            
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            break;
    }
    
    return attMyString;
}

-(NSMutableAttributedString *)whatWeOffer {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=NSLocalizedString(@"At our machines, minimum bets start from € 0.01 (1 Euro cent) up to €10.00 with maximum bets up to €500 a spin.",@"") ;
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
    
    
    return attMyString;
}

-(NSMutableAttributedString *)whatsNew {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=NSLocalizedString(@"Our offering is under constant evolution to guarantee the best in modern technology, in our constant desire to offer the best customer satisfaction.",@"");
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
    
    
    return attMyString;
}

-(NSMutableAttributedString *)slotMachineRooms {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=NSLocalizedString(@"Ca' Noghera is Italy’s first American-style casino: 4000 square metres of slot machines and ancillary games services.\n\nCa' Vendramin Calergi: an offer in which state-of-the-art technology blends perfectly into a setting that is both historical and extraordinary",@"");
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
    
    
    return attMyString;
}


-(void)updateOurJackpots {
    
 //   AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
//    [[dynamoDBObjectMapper load:[Jackpot class] hashKey:@"2" rangeKey:nil]
//     continueWithBlock:^id(AWSTask *task) {
 //        if (task.error) {
  ////           NSLog(@"The request failed. Error: [%@]", task.error);
 //        }
  //       if (task.exception) {
 //            NSLog(@"The request failed. Exception: [%@]", task.exception);
  //       }
  //       if (task.result) {
  //           dispatch_async(dispatch_get_main_queue(), ^{
  //           Jackpot *item = task.result;
  //           switch ([CMVLocalize myDeviceLocaleIs]) {
   //              case IT :
   //                  self.textForJackpot=item.ourJackpotIT;
   //                  break;
   //              case DE :
   //                  self.textForJackpot=item.ourJackpotDE;
   //                  break;
   //              case FR :
   //                  self.textForJackpot=item.ourJackpotFR;
   //                  break;
   //              case ES :
   //                  self.textForJackpot=item.ourJackpotES;
   //                  break;
   //              case RU  :
   //                  self.textForJackpot=item.ourJackpotRU;
   //                  break;
   //              case ZH:
    //                 self.textForJackpot=item.ourJackpotZH;
    //                 break;
                     
   //              default:
   //                  self.textForJackpot=item.ourJackpot;
   //                  break;
   //          }
             
    //         NSDictionary *firstAttributes = [self firstAttributes];
    //         NSInteger _stringLength=[self.textForJackpot length];
    //         NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:self.textForJackpot];
   //          [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
   //          self.descriptionView.attributedText=attMyString;
   //          self.textToBeRead=[attMyString string];
   //          });
  //       }
  //       return nil;
 //    }];
    
}


-(NSMutableAttributedString *)tapTheRoll {
    NSDictionary *firstAttributes = [self firstAttributes];
    
    NSString *myString=NSLocalizedString(@"Tap the roll for details", nil);
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
    
    
    return attMyString;
}
@end
