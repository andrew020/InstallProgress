//
//  AppInfoInstance.m
//  InstallProgress
//
//  Created by Andrew Leo on 17/6/15.
//  Copyright (c) 2015 Star. All rights reserved.
//

#import "AppInfoInstance.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <objc/runtime.h>
#import "LSApplicationWorkspace.h"

static NSString *kTarget = @"sg.com.ncs.bim";

@interface AppInfoInstance () {
    LSApplicationWorkspace* workspace;
}

@end

@implementation AppInfoInstance

+ (AppInfoInstance *)instance {
    static AppInfoInstance *instance = nil;
    static dispatch_once_t appinfoinstance;
    dispatch_once(&appinfoinstance, ^{
        instance = [[AppInfoInstance alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self step];
    }
    return self;
}

- (void)dealloc {
    [workspace removeObserver:self];
}

- (void)step {
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    if (workspace) {
        [workspace removeObserver:self];
    }
    workspace = (LSApplicationWorkspace *)[self getInfo:LSApplicationWorkspace_class fromKey:@"defaultWorkspace"];
    [workspace addObserver:self forKeyPath:@"allApplications" options:0 context:nil];
}

#pragma mark -

- (id)getInfo:(id)target fromKey:(NSString *)key {
    if (!target) { return nil; }
    SEL selector = NSSelectorFromString(key);
    IMP imp = [target methodForSelector:selector];
    if (!imp) { return nil; }
    id (*func)(id, SEL) = (void *)imp;
    return func(target, selector);
}

- (NSDictionary *)properties_aps:(id)application {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([application class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [application valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

#pragma mark - 

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
}

@end
