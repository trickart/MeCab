//
//  Node.h
//  
//
//  Created by trickart on 2021/06/02.
//

#ifndef Node_h
#define Node_h

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic, readonly, nullable) NSString *surface;
@property (nonatomic, readonly, nullable) NSString *feature;

- (nonnull id)initWithSurface:(nullable NSString *)surface
                      feature:(nullable NSString *)feature;

@end

#endif /* Node_h */
