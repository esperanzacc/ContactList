//
//  Contact.h
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSMutableDictionary *phone;
@property (nonatomic) NSMutableArray *history;

- (instancetype)initWithName: (NSString *) firstName andLastName: (NSString *) lastName andEmail: (NSString *) email;
- (instancetype)initWithName: (NSString *) firstName andLastName: (NSString *) lastName andEmail: (NSString *) email andPhone: (NSMutableDictionary *) phone;

@end

NS_ASSUME_NONNULL_END
