//
//  ViewController.m
//  HooView
//
//  Copyright © 2016 Yahoo. All rights reserved.
//

#import "ViewController.h"
#import <SSZipArchive/SSZipArchive.h>

static NSString *kAGBookProLightFontName = @"AGBookPro-LightCnd";
static NSString *kAGBookProMediumFontName = @"AGBookPro-MediumCnd";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray<NSURL *> *hooSets = [ViewController unzipHooSets];
    NSLog(@"%@", hooSets);
    
    // Do any additional setup after loading the view, typically from a nib.
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

@end
