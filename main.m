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

int sampleContacts(ContactList *contactList) {
  Contact *esperanza = [[Contact alloc]initWithName:@"esperanza" andLastName:@"chen" andEmail:@"esp@email.com"];
  Contact *brian = [[Contact alloc]initWithName:@"brian" andLastName:@"chen" andEmail:@"bri@email.com"];
  Contact *kelly = [[Contact alloc]initWithName:@"kelly" andLastName:@"chen" andEmail:@"kel@email.com"];
  
 
  [contactList addContact:esperanza];
  [contactList addContact:brian];
  [contactList addContact:kelly];
  
  NSLog(@"Sample data.");
  return 0;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *menu = @"\nWhat would you like to do next?\nnew - create a new contact\nlist - List all contacts\nshow - Display details along with an index\nfind <keyword> - Find contact with a keyword\nhistory - View last three commands\nquit - Exit Application";
    NSLog(@"%@", menu);
    
    BOOL (createContact) = YES;
    
    InputCollector *inputCollector = [[InputCollector alloc]init];
    ContactList *lists = [[ContactList alloc]init];
    sampleContacts(lists);
    
    while (createContact) {
      NSString *optionInput = [inputCollector inputForPrompt:@""];
//      NSLog(@"%@",userNameInput);
      
      if ([optionInput isEqualToString:@"quit"]) {
        break;
      } else if ([optionInput isEqualToString:@"new"]) {
        // prompt the user for information
        NSLog(@"Enter your email address:");
        NSString *email = [inputCollector inputForPrompt:@""];
        NSLog(@"Enter your firstname:");
        NSString *firstName = [inputCollector inputForPrompt:@""];
        NSLog(@"Enter your lastname:");
        NSString *lastName = [inputCollector inputForPrompt:@""];
//        NSLog(@"Enter your Do you want to add a phone number?\n(y/n)");
//        NSString *lastName = [inputCollector inputForPrompt:@""];
        Contact *contact = [[Contact alloc]initWithName:firstName andLastName:lastName andEmail:email];
        [lists addContact:contact];
      } else if ([optionInput isEqualToString:@"list"]) {
        [lists printAllLists];
      } else if ([optionInput isEqualToString:@"show"]) {
        NSLog(@"Enter the idex:");
        NSString *index = [inputCollector inputForPrompt:@""];
        [lists printList:[index integerValue]];
        
      }
      NSLog(@"%@", menu);
    }
    
  }
  return 0;
}
