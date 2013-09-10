//= require_self
//= require_tree ./angular

LightningTalks = angular.module("LightningTalks", ["md5", "ui-gravatar"])

// https://github.com/angular/angular.js/issues/1460
$(function() {
  $('input[type="text"][ng-model]').each( function() {
    var that = this;
    setTimeout(function() {
      value = $(that).val();
      angular.element(that).controller('ngModel').$setViewValue(value);
    }, 150);    
  });  
})
