//
//  ContactList.m
//  ContaceList
//
//  Created by Esperanza on 2022-05-14.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init
{
  self = [super init];
  if (self) {
    _lists = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void) addContact:(Contact *)newContact{
  [_lists addObject:newContact];
  
}

- (void) printAllLists {
  NSInteger num = 0;
  for (Contact *list in _lists) {
    NSString *print = [NSString stringWithFormat:@"%ld: <%@ %@> (%@)",num,[list firstName],[list lastName],[list email]];
    NSLog(@"%@",print);
    num += 1;
  }
}

- (void) printList: (NSInteger) index {
  NSString *list = [_lists objectAtIndex:index];
  NSLog(@"%@",list);
}
@end
