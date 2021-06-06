//
//  Node.mm
//  
//
//  Created by trickart on 2021/06/02.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node: NSObject

- (nonnull id)initWithSurface:(NSString *)surface
                      feature:(NSString *)feature {
    self = [super init];
    if (self != nil) {
        _surface = surface;
        _feature = feature;
    }
    return self;
}

@end
