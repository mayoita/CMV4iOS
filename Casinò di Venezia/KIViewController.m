//
//  KIViewController.m
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import "KIViewController.h"
#define TimeInterval 2.0f

@interface KIViewController () <KIImagePagerDelegate, KIImagePagerDataSource>
{
    IBOutlet KIImagePager *_imagePager;
    bool isPlaying;
    
}
@property (strong, nonatomic)NSArray *dataSource;
@property (nonatomic, strong) NSMutableArray *photos;
@property(nonatomic,strong)UIImage *photo;
@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupDataSource];
}

-(void)setupDataSource {
    NSString *plistName = [NSString stringWithFormat:@"PhotoDBase"];
    NSArray *contentArray = [[NSMutableArray alloc] initWithContentsOfFile:
                             [[NSBundle mainBundle] pathForResource:plistName
                                                             ofType:@"plist"]];
    self.dataSource = contentArray[1];
    self.photos = [NSMutableArray array];
    for (id object in self.dataSource) {
        NSString *a=object[0];
        [self.photos addObject:[UIImage imageNamed:a]];
    }
    [self setPhoto:[UIImage imageNamed:self.dataSource[0][0]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    _imagePager.slideshowTimeInterval = 0.0f;
}

#pragma mark - KIImagePager DataSource

- (NSArray *) arrayWithImages
{
    return self.photos;
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
   // NSLog(@"%s %d", __PRETTY_FUNCTION__, index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    //NSLog(@"%s %d", __PRETTY_FUNCTION__, index);
}
- (IBAction)playSlideShow:(id)sender {
    if (!isPlaying) {
         _imagePager.slideshowTimeInterval = TimeInterval;
        isPlaying=true;
    } else {
        _imagePager.slideshowTimeInterval = 0.0f;
        isPlaying=false;
    }
    
}
@end
