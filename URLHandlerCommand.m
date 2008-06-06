// file URLHandlerCommand.m
#import "URLHandlerCommand.h"

@implementation URLHandlerCommand

- (id)performDefaultImplementation {
  NSTask *task;

  NSString *urlString = [self directParameter];
  NSLog(@"url = %@", urlString);
  NSArray *arguments;

  NSArray *values = [urlString componentsSeparatedByString :@"/"];

  NSLog(@"values = %@", values);
  NSLog(@"cluster = %@", [values objectAtIndex:2]);
  NSLog(@"environment = %@", [values objectAtIndex:3]);
  @try {
    NSLog(@"debug = %@", [values objectAtIndex:4]);
    arguments = [NSArray arrayWithObjects: @"terminal", @"-C", [values objectAtIndex:2], @"-E", [values objectAtIndex:3], [values objectAtIndex:4], nil];
  }
  @catch (NSException *e) {
    arguments = [NSArray arrayWithObjects: @"terminal", @"-C", [values objectAtIndex:2], @"-E", [values objectAtIndex:3], nil];
  }
  NSLog(@"args = %@", arguments);

  task = [[NSTask alloc] init];
  [task setLaunchPath: @"SAMURAI_PATH"];
  [task setArguments: arguments];

  NSDictionary *dictionary = [ task environment ];

  for (id key in dictionary)
  {
    NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
  }

  [task launch];
  exit(0);
  return nil;
}

@end