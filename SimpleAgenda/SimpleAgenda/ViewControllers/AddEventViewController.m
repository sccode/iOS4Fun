//
//  AddEventViewController.m
//  SimpleAgenda
//
//  Created by Sophie Che on 4/23/15.
//  Copyright (c) 2015 F&F. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddEventViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if (sender != self.saveButton) return;

  if (self.nameTextField.text.length > 0) {
    self.event = [[Event alloc] init];
    self.event.eventName = self.nameTextField.text;
    self.event.startDate = [NSDateFormatter localizedStringFromDate:self.startDatePicker.date
                                                          dateStyle:NSDateFormatterMediumStyle
                                                          timeStyle:NSDateFormatterNoStyle];
  }
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}

@end
