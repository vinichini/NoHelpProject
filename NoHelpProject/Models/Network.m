//
//  Network.m
//  NoHelpProject
//
//  Created by Tiago Vinagre on 28/11/17.
//  Copyright © 2017 Tiago Vinagre. All rights reserved.
//

#import "Network.h"
#import "NSString+Extension.h"

static NSString * const kMarvePublicKey = @"68af5cde204e96bf31e0181fcc9d85bf";
static NSString * const kMarvePrivateKey = @"deb5f1ae0f8e2dd5fac2d364adffa2d49ff7194a";
static NSString *const kMarvelBaseURL = @"http://gateway.marvel.com/v1/public/";

@implementation Network



-(NSURLSession*)session {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    return session;
}

-(NSURLComponents*)baseUrlComponents:(NSString*)path {
    NSURL *baseURL = [NSURL URLWithString:kMarvelBaseURL];
    NSURL *url = [NSURL URLWithString:path relativeToURL:baseURL];
    
    NSString *timeStamp = [NSString stringWithFormat:@"%1.f", [NSDate timeIntervalSinceReferenceDate]];
    NSURLQueryItem *timeStampItem = [[NSURLQueryItem alloc] initWithName:@"ts" value:timeStamp];
    
    NSString *preHash = [NSString stringWithFormat:@"%@%@%@", timeStamp, kMarvePrivateKey, kMarvePublicKey];
    NSString *hash = [preHash MD5];
    NSURLQueryItem *hashItem = [[NSURLQueryItem alloc] initWithName:@"hash" value:hash];
    NSURLQueryItem *publicKeyItem = [[NSURLQueryItem alloc] initWithName:@"apikey" value:kMarvePublicKey];

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[timeStampItem, publicKeyItem, hashItem];
    return urlComponents;
}

-(NSURL*)fetchHeroWithId:(NSInteger)heroId {
    NSString *path = [NSString stringWithFormat:@"characters/%ld", (long)heroId];
    return [self baseUrlComponents:path].URL;
}

-(NSURL*)fetchHeroesByQuery:(NSString*)query {
    NSURL *url = [NSURL URLWithString:kMarvelBaseURL];
    url = [url URLByAppendingPathComponent:@""];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"q" value:query];
    components.queryItems = @[queryItem];
    return components.URL;
}


@end
