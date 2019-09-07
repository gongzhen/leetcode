//
//  ViewController.m
//  HooView
//
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import "ViewController.h"
#import <SSZipArchive/SSZipArchive.h>
#import "ColorSetObject.h"
#import "CustomButton.h"
#import "CustomCollectionViewCell.h"


static NSString *kAGBookProLightFontName = @"AGBookPro-LightCnd";
static NSString *kAGBookProMediumFontName = @"AGBookPro-MediumCnd";

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)NSFileManager *fileManager;
@property(strong, nonatomic) NSArray *colorSetList;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation ViewController {
    CGRect _viewFrame;
}
- (UICollectionViewFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
    }
    return _flowLayout;
}

- (void)configureCollectionViewLayoutItemSize {
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0); /// top, left, bottom, right
    self.flowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 4, self.view.frame.size.width / 4);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fileManager = [NSFileManager defaultManager];
    self.colorSetList = [NSMutableArray array];
    self.view.backgroundColor = UIColor.lightGrayColor;
    _viewFrame = self.view.frame;
    
    UILabel *colorSetLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 14, _viewFrame.size.width - 60, 35)];
    colorSetLabel.backgroundColor = UIColor.redColor;
    [self configureCollectionViewLayoutItemSize];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 55, _viewFrame.size.width, _viewFrame.size.height - 35 - 82) collectionViewLayout:self.flowLayout];
    collectionView.backgroundColor = UIColor.clearColor;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    UILabel *poemTitleabel = [[UILabel alloc] initWithFrame:CGRectMake(30, collectionView.frame.origin.y + collectionView.frame.size.height, _viewFrame.size.width, 52)];
    poemTitleabel.backgroundColor = UIColor.yellowColor;
    UILabel *poemLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, poemTitleabel.frame.origin.y + 49, _viewFrame.size.width, 32)];
    poemLabel.backgroundColor = UIColor.redColor;
    [self.view addSubview:colorSetLabel];
    [self.view addSubview:collectionView];
    [self.view addSubview:poemTitleabel];
    [self.view addSubview:poemLabel];
    __block NSMutableArray<CustomButton *> *tempColorSetList = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSArray<NSURL *> *hooSets = [ViewController unzipHooSets];
        [hooSets enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSError *error;
            NSString* filePath = [obj path];
            NSString* fileNumber = [filePath substringFromIndex:filePath.length - 2];
            NSLog(@"filePath:%@", fileNumber);
            NSArray<NSString *> *files = [self.fileManager contentsOfDirectoryAtPath:[obj path] error:&error];
            [files enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                NSInteger buttonCount = 0;
                NSString * buttonColor = @"";
                NSString * poemLine = @"";
                NSString * poemTitle = @"";
                NSString * btnIdx = @"";
                if([obj isEqualToString:@"hoo_set.json"]) {
                    NSString *jsonPath = [NSString stringWithFormat:@"%@/hoo_set.json", filePath];
                    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
                    if(data != nil) {
                        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                        buttonCount = [[jsonObj objectForKey:@"Count"] integerValue];
                        buttonColor = [jsonObj objectForKey:@"Color"];
                    }
                }

                if ([obj isEqualToString:@".DS_Store"] == NO && [obj rangeOfString:@"header"].location == NSNotFound){
                    NSString *buttonPath = [NSString stringWithFormat:@"%@/%@/hoo.json", filePath, obj];
                    NSData *data = [NSData dataWithContentsOfFile:buttonPath];
                    if(data) {
                        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//                        NSLog(@"jsonObj:%@", jsonObj);
                        poemLine = [jsonObj objectForKey:@"PoemLine"];
                        poemTitle = [jsonObj objectForKey:@"Title"];
                        btnIdx = obj;
                    }
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    if([btnIdx isEqualToString:@""] == NO) {
                        CustomButton *button = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, _viewFrame.size.width / 5, _viewFrame.size.width / 5)];
                        button.btnIdx = [NSString stringWithFormat:@"%@%@", fileNumber, btnIdx];
                        NSDictionary *btnObj = @{@"btnIdx": btnIdx, @"colorSet": buttonColor, @"poemLine": poemLine, @"poemTitle": poemTitle};
                        button.layer.cornerRadius = 0.5 * button.bounds.size.width;
                        [button configure:btnObj];
                        [tempColorSetList addObject:button];
                    }
                });

            }];
        }];
        
        self.colorSetList = [tempColorSetList sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            CustomButton *b1 = (CustomButton *)obj1;
            CustomButton *b2 = (CustomButton *)obj2;
            NSInteger b1Idx = [b1.btnIdx integerValue];
            NSInteger b2Idx = [b2.btnIdx integerValue];
            return b1Idx - b2Idx;
        }];
//        NSLog(@"colorSetList:%@", self.colorSetList);
        dispatch_async(dispatch_get_main_queue(), ^{
            [collectionView reloadData];
        });
        
    });
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews {
    
}

/// Returns a dictionary Hoo Set directory URL values keyed by the name of the Hoo Set directory.
+ (NSArray<NSURL *> *)unzipHooSets {
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSString *uniqueString = NSProcessInfo.processInfo.globallyUniqueString;
    NSURL *destinationDirectoryURL = [[NSURL fileURLWithPath:NSTemporaryDirectory()] URLByAppendingPathComponent:uniqueString isDirectory:YES];
    [fileManager createDirectoryAtURL:destinationDirectoryURL withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSArray<NSString *> *zipFilePaths = [NSBundle.mainBundle pathsForResourcesOfType:@"zip" inDirectory:@"HooSets"];
    NSMutableArray<NSURL *> *hooSets = [[NSMutableArray alloc] initWithCapacity:zipFilePaths.count];
    
    for (NSString *zipFilePath in zipFilePaths) {
        [SSZipArchive unzipFileAtPath:zipFilePath toDestination:destinationDirectoryURL.path];
        NSURL *hooSetDirectoryURL = [destinationDirectoryURL URLByAppendingPathComponent:zipFilePath.stringByDeletingPathExtension.lastPathComponent isDirectory:YES];
        if([fileManager fileExistsAtPath:hooSetDirectoryURL.path]) {
            [hooSets addObject:hooSetDirectoryURL];
        }
    }
    
    return hooSets;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.colorSetList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    [cell configure:[self.colorSetList objectAtIndex:indexPath.item]];
    return cell;
}

@end
