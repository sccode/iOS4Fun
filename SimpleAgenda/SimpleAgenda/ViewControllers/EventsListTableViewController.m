//
//  EventsListTableViewController.m
//  SimpleAgenda
//
//  Created by Sophie Che on 4/23/15.
//  Copyright (c) 2015 F&F. All rights reserved.
//

#import "EventsListTableViewController.h"

#import "AddEventViewController.h"

static NSString *cellIdentifier = @"Event Cell";
static NSString *emptyAgenda = @"No event has been scheduled.";

@interface EventsListTableViewController ()

// A dictionary mapping from dates to an array of events scheduled on that day.
@property(nonatomic, copy) NSDictionary *agenda;

- (IBAction)unwindToEventsList:(UIStoryboardSegue *)segue;

@end

@implementation EventsListTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.agenda.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.agenda.count > section) {
    NSArray *events = [self.agenda objectForKey:self.agenda.allKeys[section]];
    return events.count;
  }
  return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if (self.agenda.count > 0) {
    return self.agenda.allKeys[section];
  }
  return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  if (self.agenda.count > 0) {
    NSArray *events = [self.agenda objectForKey:self.agenda.allKeys[indexPath.section]];
    Event *event = events[indexPath.row];
    [cell.textLabel setText:event.eventName];
  }
  return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

- (IBAction)unwindToEventsList:(UIStoryboardSegue *)segue {
  AddEventViewController *source = [segue sourceViewController];
  Event *event = source.event;
  if (event != nil) {
    NSLog(@"Adding event: %@", event);
    NSMutableArray *events = [NSMutableArray arrayWithArray:[self.agenda objectForKey:event.startDate]];
    [events addObject:event];
    NSMutableDictionary *mutableAgenda = [NSMutableDictionary dictionaryWithDictionary:self.agenda];
    [mutableAgenda setObject:events forKey:event.startDate];
    self.agenda = [mutableAgenda copy];
    [self.tableView reloadData];
  }
}

@end
