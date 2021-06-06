//
//  Tagger.mm
//  
//
//  Created by trickart on 2021/06/02.
//

#import <Foundation/Foundation.h>
#include <mecab.h>
#import "Tagger.h"
#import "Node.h"

NSString *MeCabVersion = [[NSString alloc] initWithCString:MeCab::Tagger::version() encoding:NSUTF8StringEncoding];

@interface Tagger()
@property MeCab::Tagger* tagger;
@end

@implementation Tagger: NSObject

- (nonnull id)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self != nil) {
        NSString *arg = [NSString stringWithFormat:@"--dicdir %@", url.path];
        _tagger = MeCab::createTagger(arg.UTF8String);
    }
    return self;
}

- (nullable NSString *)parseString:(NSString *)string {
    return [[NSString alloc] initWithCString:_tagger->parse(string.UTF8String) encoding:NSUTF8StringEncoding];
}

- (nonnull NSArray<Node *> *)parseNode:(NSString *)string {
    return [self parseNode: string withBosEos: NO];
}

- (nonnull NSArray<Node *> *)parseNode:(NSString *)string
                         withBosEos:(BOOL)withBosEos {
    const MeCab::Node* head = _tagger->parseToNode(string.UTF8String);
    NSMutableArray<Node *> *nodes = [NSMutableArray<Node *> new];
    while (head != nil) {
        BOOL isBosEos = [[[NSString alloc] initWithCString:head->feature encoding:NSUTF8StringEncoding] hasPrefix:@"BOS/EOS"];
        if (!isBosEos || withBosEos) {
            NSString *surface = [[NSString alloc] initWithBytes:head->surface length:head->length encoding:NSUTF8StringEncoding];
            NSString *feature = [[NSString alloc] initWithCString:head->feature encoding:NSUTF8StringEncoding];
            [nodes addObject:[[Node alloc] initWithSurface:surface feature: feature]];
        }
        head = head->next;
    }

    return nodes;
}

- (void)dealloc {
    if (_tagger != nil) {
        MeCab::deleteTagger(_tagger);
    }
}

@end
