$(document).ready(function() {
  $('a#twilio-verify-request-sms-link').unbind('ajax:success');
  $('a#twilio-verify-request-sms-link').bind('ajax:success', function(evt, data, status, xhr) {
    alert(data.message);
  });

  $('a#twilio-verify-request-phone-call-link').unbind('ajax:success');
  $('a#twilio-verify-request-phone-call-link').bind('ajax:success', function(evt, data, status, xhr) {
    alert(data.message);
  });
});

