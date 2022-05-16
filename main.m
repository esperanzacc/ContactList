//
//  main.m
//  ContactList
//
//  Created by Esperanza on 2022-05-14.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int sample(ContactList *contactList) {
  NSMutableDictionary *dict =  [NSMutableDictionary dictionary];
  [dict setObject:@"111-111-1111" forKey:@"Mobile"];
  [dict setObject:@"222-222-2222" forKey:@"Work"];
  [dict setObject:@"333-333-3333" forKey:@"Home"];
  
  Contact *esperanza = [[Contact alloc]initWithName:@"esperanza" andLastName:@"chen" andEmail:@"esp@email.com"];
  Contact *brian = [[Contact alloc]initWithName:@"brian" andLastName:@"wu" andEmail:@"bri@email.com"];
  Contact *kelly = [[Contact alloc]initWithName:@"kelly" andLastName:@"chang" andEmail:@"kel@email.com"];
  Contact *ken = [[Contact alloc]initWithName:@"ken" andLastName:@"huang" andEmail:@"ken@email.com" andPhone:dict];

 
  [contactList addContact:esperanza];
  [contactList addContact:brian];
  [contactList addContact:kelly];
  [contactList addContact:ken];
  
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nWhat would you like to do next?\nnew - create a new contact\nlist - List all contacts\nshow - Display details along with an index\nfind <keyword> - Find contact with a keyword\nhistory - View last three commands\nquit - Exit Application";
    
    BOOL (createContact) = YES;
    
    InputCollector *inputCollector = [[InputCollector alloc]init];
    ContactList *lists = [[ContactList alloc]init];
    sample(lists);
    NSMutableDictionary *phone = [NSMutableDictionary new];
    
    while (createContact) {
      NSString *optionInput = [inputCollector inputForPrompt:menu];
      
      if ([optionInput isEqualToString:@"quit"]) {
        break;
      } else if ([optionInput isEqualToString:@"new"]) {
        // prompt the user for information
        NSString *email = [inputCollector inputForPrompt:@"Enter your email address:"];
        [lists checkEmailExist:email];
        if ([lists checkEmailExist:email]) {
          NSLog(@"This email is already be used. Please create another email.");
          break;
        } else {
          NSLog(@"Succeed!");
          NSString *firstName = [inputCollector inputForPrompt:@"Enter your firstname:"];
          NSString *lastName = [inputCollector inputForPrompt:@"Enter your lastname:"];

          while (YES) {
            NSString *addPhone = [inputCollector inputForPrompt:@"Do you want to add a phone number? \n(y/n)"];
            if ([addPhone isEqualToString:@"y"]) {
              NSString *option = [inputCollector inputForPrompt:@"Select the following option(0: Mobile, 1: Work, 2: Home):"];
              if ([option isEqualToString:@"0"] || [option isEqualToString:@"1"] || [option isEqualToString:@"2"] ) {
                NSString *phoneNumber = [inputCollector inputForPrompt:@"Enter your phone number (eg. xxx-xxx-xxxx):"];
                NSMutableArray *phones = [[NSMutableArray alloc]initWithObjects:@"Mobile", @"Work", @"Home", nil];
                [phone setObject:phoneNumber forKey:[phones objectAtIndex:[option intValue]]];
              } else {
                NSLog(@"Please type num from 0 to 2.");
              }
          } else if ([addPhone isEqualToString:@"n"]) {
            break;
            }
          }
          Contact *contact = [[Contact alloc]initWithName:firstName andLastName:lastName andEmail:email andPhone:phone];
          [lists addContact:contact];
      }
      } else if ([optionInput isEqualToString:@"list"]) {
        [lists printAllLists];
      } else if ([optionInput isEqualToString:@"show"]) {
        NSString *index = [inputCollector inputForPrompt:@"Enter the index:"];
        [lists showList:[index integerValue]];
      } else if ([optionInput isEqualToString:@"find"]) {
        NSString *keyword = [inputCollector inputForPrompt:@"Enter keyword (one's firstname or one's lastname or one's email)"];
        [lists findContact:keyword];
      } else if ([optionInput isEqualToString:@"history"]) {
        if ([[inputCollector history] count] >= 3) {
          NSLog(@"%@\n%@\n%@\n", [[inputCollector history] objectAtIndex: [[inputCollector history] count] - 1],
                [[inputCollector history] objectAtIndex: [[inputCollector history] count] - 2],
                [[inputCollector history] objectAtIndex: [[inputCollector history] count] - 3]);
        } else if ([[inputCollector history] count] == 2) {
          NSLog(@"%@\n%@", [[inputCollector history] objectAtIndex: 1], [[inputCollector history] objectAtIndex: 0]);
        } else if ([[inputCollector history] count] == 1) {
          NSLog(@"%@", [[inputCollector history] objectAtIndex: 0]);
        } else {
          NSLog(@"no history record.");
        }
      }
    }

  }
  return 0;
}
