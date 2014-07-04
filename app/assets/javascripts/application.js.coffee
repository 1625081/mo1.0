# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery.turbolinks
#= require turbolinks
#= require semantic-ui
# require_tree .
#= require timeago
#= require angular
#= require angular-animate
#= require angular-resource
#= require angular-touch
#= require angular-sanitize
#= require angular-cookies
#= require angular-route
#= require_self
#= require_tree ./angular
#= require_tree ./angular/services
#= require_tree ./angular/controllers
#

window.App = angular.module('Mo', [
	'ngCookies',
	'ngRoute', 
	'ngSanitize', 
	'ngResource'
])
window.App.config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    provider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
])