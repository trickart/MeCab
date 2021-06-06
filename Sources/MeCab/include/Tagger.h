//
//  Tagger.h
//  
//
//  Created by trickart on 2021/06/02.
//

#ifndef Tagger_h
#define Tagger_h

#import "Node.h"

extern NSString * _Nonnull MeCabVersion;

@interface Tagger : NSObject

- (nonnull id)initWithUrl:(nonnull NSURL *)url;
- (nullable NSString *)parseString:(nonnull NSString *)string;
- (nonnull NSArray<Node *> *)parseNode:(nonnull NSString *)string;
- (nonnull NSArray<Node *> *)parseNode:(nonnull NSString *)string
                         withBosEos:(BOOL)withBosEos;

@end

#endif /* Tagger_h */
