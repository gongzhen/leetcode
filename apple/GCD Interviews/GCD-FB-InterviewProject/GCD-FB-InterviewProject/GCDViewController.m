//
//  GCDViewController.m
//  GCD-FB-InterviewProject
//
//  Created by Zhen Gong on 9/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "GCDViewController.h"
// #import "GCD_FB_InterviewProject-Swift.h"

@interface Repository : NSObject

@property(nonatomic, copy) NSString *repoName;
@property(nonatomic, copy) NSString *repoURL;

@end

@implementation Repository

- (instancetype)initWith:(NSString *)repoName repoURL:(NSString *)repoURL
{
    self = [super init];
    if (self) {
        _repoName = repoName;
        _repoURL = repoURL;
    }
    return self;
}

@end

@interface APIManager : NSObject
{
    NSURLSessionDataTask *_dataTask;
}

@end

@implementation APIManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static APIManager *_shared = nil;
    dispatch_once(&onceToken, ^{
        _shared = [[APIManager alloc] init];
    });
    return _shared;
}

- (NSString *)constructURL:(NSString *)query {
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", query];
    return url;
}

- (void)repositoriesBy:(NSString *)githubID completion:(void (^)(NSArray *, NSError*))completion {
    NSString *urlString = [self replaceEmptySpaceFor:[self constructURL:githubID]];
    NSURL *url = [NSURL URLWithString:urlString];
    if (!urlString || !url) {
        completion(nil, nil);
        return;
    }
    
    NSURLRequest *requst = [NSURLRequest requestWithURL: url];
    _dataTask = [[NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration] dataTaskWithRequest:requst completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        NSError *er = nil;
        NSArray<NSDictionary *> *itemLists = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&er];
        if (!itemLists) {
            completion(nil,er);
            return;
        } else if ([itemLists isKindOfClass:[NSArray class]]){
            __block NSMutableArray *result = [NSMutableArray new];
            [itemLists enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *name = [item objectForKey:@"name"];
                NSString *url = [item objectForKey:@"html_url"];
                if (name != nil && url != nil) {
                    Repository *repo = [[Repository alloc] initWith:name repoURL:url];
                    [result addObject:repo];
                }
            }];
            completion(result, nil);
            return;
        } else {
            completion(nil, nil);
        }
    }];
    [_dataTask resume];
}

- (nullable NSString *)replaceEmptySpaceFor:(NSString *)query {
    if (!query) {
        return nil;
    }
    return [query stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet.URLQueryAllowedCharacterSet)];
}

@end

@interface GCDViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UISearchBar *_searchBar;
    UITableView *_tableView;
    NSArray<Repository *> *_items;
    dispatch_block_t _workItem;
    double _time1;
}

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar = [[UISearchBar alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:_searchBar];
    [self.view addSubview:_tableView];
    
    _searchBar.delegate = self;
    _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    [_searchBar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [_searchBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [_searchBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    [_searchBar.bottomAnchor constraintEqualToAnchor:_tableView.topAnchor].active = true;
    [_searchBar.heightAnchor constraintEqualToConstant:66].active = true;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView.topAnchor constraintEqualToAnchor:_searchBar.bottomAnchor].active = true;
    [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_items != NULL) {
        return [_items count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _items[indexPath.row].repoName;
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    double previousTime = _time1;
    _time1 = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%@ timediff:%f", searchText, (_time1 - previousTime));
    if (_workItem) {
        dispatch_block_cancel(_workItem);
    }
    __weak __typeof__(self) weakSelf = self;
    dispatch_block_t requestWorkItem = dispatch_block_create_with_qos_class(0, QOS_CLASS_BACKGROUND, 0, ^{
        [[APIManager sharedInstance] repositoriesBy:searchText completion:^(NSArray *itemList, NSError *error) {
            NSLog(@"earchText:%@", searchText);
            __strong __typeof__(self) strongSelf = weakSelf;
            if (error == nil) {
                if (itemList) {
                    strongSelf->_items = itemList;
                } else {
                    strongSelf->_items = nil;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [strongSelf->_tableView reloadData];
                });
            }
        }];
    });
    _workItem = requestWorkItem;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), requestWorkItem);    
}

@end
