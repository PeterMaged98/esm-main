
const String kBaseUrl = 'tsaheel.addictaco.com';
const String kBaseVersion = 'api/';

 // guest manager endpoint
const String kSignIn = 'guest-manger/sign-in';
const String kSignOut = 'guest-manger/sign-out';
const String kForgetPassword = 'guest-manger/forget-password-send-code';
const String kResetPassword = 'guest-manger/reset-password';
const String kNotifications = 'guest-manger/notifications';
const String kNotificationsCount = 'guest-manger/count-notifications';
const String kProfile = 'guest-manger/profile';
const String kUpdateProfile = 'guest-manger/update-profile';
const String kGuestManageHome = 'guest-manger/home';
const String kGuestManageEventsPrevious = 'guest-manger/events/previous';
const String kGuestManageEventsCurrent = 'guest-manger/events/current';
const String kGuestManageEventsUpComing = 'guest-manger/events/up-coming';
const String kGuestManageEventsDetails = 'guest-manger/events/details';

// employee end points
const String kEmployeesSignIn = 'employees/sign-in';
const String kEmployeesSignOut = 'employees/sign-out';
const String kEmployeesForgetPassword = 'employees/forget-password-send-code';
const String kEmployeesResetPassword = 'employees/reset-password';
const String kEmployeesNotifications = 'employees/notifications';
const String kEmployeesNotificationsCount = 'employees/count-notifications';
const String kEmployeesProfile = 'employees/profile';
const String kEmployeesUpdateProfile = 'employees/update-profile';


// guest end points
const String kGuestSignIn = 'guest/sign-in';
const String kGuestSignOut = 'guest/sign-out';
const String kGuestForgetPassword = 'guest/forget-password-send-code';
const String kGuestResetPassword = 'guest/reset-password';
const String kGuestNotifications = 'guest/notifications';
const String kGuestNotificationsCount = 'guest/count-notifications';
const String kGuestProfile = 'guest/profile';
const String kGuestUpdateProfile = 'guest/update-profile';
const String kGuestEventsPrevious = 'guest/event/previous';
const String kGuestEventsCurrent = 'guest/event/current';
const String kGuestEventsUpComing = 'guest/event/up-coming';
const String kGuestEventsDetails = 'guest/event/details';
const String kGuestHome = 'guest/home';
const String kGuestFeedback = 'guest/event/feed-back';

//Static Headers
 Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};