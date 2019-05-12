//
//  GridView.m
//  LC44_wildcardMatching
//
//  Created by Zhen Gong on 5/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "GridView.h"
#import "GridModel.h"
#import "GridViewCell.h"

static NSString * const kCollectionViewCellIdentifier = @"CollectionViewCellIdentifier";
static NSString * const kCollectionViewHeaderIdentifier = @"HeaderView";

@interface GridView() <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) GridModel *model;

@end

@implementation GridView

#pragma mark - Properties

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[GridViewCell class] forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
        [_collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:kCollectionViewHeaderIdentifier];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 5.f;
    }
    return _flowLayout;
}

- (instancetype)initWithModel:(GridModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
        [self addSubview:self.collectionView];
        [self _installViewConstraints];
    }
    return self;
}

#pragma mark - Public

- (void)reloadData {
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataSource respondsToSelector:@selector(numberOfColumnsInGridView:)]) {
        CGFloat _numberOfCells = [self.dataSource numberOfColumnsInGridView:self];
        NSInteger _widthOfCell = (self.collectionView.frame.size.width - (_numberOfCells * 10.f)) / _numberOfCells;
        return CGSizeMake(_widthOfCell, 40);
    }
    return CGSizeMake(self.collectionView.frame.size.width, 40);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if ([self.dataSource respondsToSelector:@selector(numberOfRowsInGridView:)]) {
        return [self.dataSource numberOfRowsInGridView:self];
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.dataSource respondsToSelector:@selector(numberOfColumnsInGridView:)]) {
        return [self.dataSource numberOfColumnsInGridView:self];
    }
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridViewCell *cell = (GridViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = UIColor.greenColor;
    [cell setContentlabelWith:[self.model gridCellInIndexPath:indexPath]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCollectionViewHeaderIdentifier forIndexPath:indexPath];
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 2)];
        }
        reusableview.backgroundColor = UIColor.whiteColor;
        return reusableview;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize headerSize = CGSizeMake(320, 2);
    return headerSize;
}

#pragma mark - Private

- (void)_installViewConstraints {
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}

@end
