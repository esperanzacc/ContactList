//
//  ContactList.h
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property (nonatomic) NSMutableArray* lists;

- (instancetype)init;
- (void) addContact:(Contact *)newContact;
- (void) printAllLists;
- (void) showList: (NSInteger) index;
- (void) findContact: (NSString *) userSearch;
- (BOOL) checkEmailExist: (NSString *) userEmail;

@end

NS_ASSUME_NONNULL_END
