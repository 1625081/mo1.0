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
# require jquery-ui
#= require turbolinks
#= require semantic-ui
# require_tree .
#= require timeago
#= require angular
#= require simditor
#= require angular-animate
#= require angular-resource
#= require angular-touch
#= require angular-sanitize
#= require angular-cookies
#= require angular-route
#= require js-template
#= require js-load_image
#= require jquery-file-upload/basic
#= require jquery-file-upload/jquery.fileupload-process
# require jquery-file-upload/jquery.fileupload-image
#= require jquery-file-upload/jquery.fileupload-ui
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

window.base = 
	ShowModal : (self_name) ->
		raw_modal_name = $("##{self_name}").data('modal-name')
		modal_name = "##{raw_modal_name}"
		$("##{self_name}").click ->
			$(modal_name).modal 'show'
	CloseFlash : () ->
		$('a#close_flash').click ->
			$(this).parent().fadeTo 600, 0, ->
				$(this).remove()
	Notice : (content) ->
		$('#flash_container').append('<div class="flash-info" id="flash_content"><span>' + content + '</span><a id="close_flash"><i class="close icon"></i></a></div>')
			.children().first().fadeIn 3000, ->
				window.base.CloseFlash()
	Warning : (content) ->
		$('#flash_container').append('<div class="flash-warning" id="flash_content"><span>' + content + '</span><a id="close_flash"><i class="close icon"></i></a></div>')
			.children().first().fadeIn 3000, ->
				window.base.CloseFlash()
	Init : () ->
		$('.ui.dropdown').dropdown()
		$('.ui.modal').modal()
		$('.ui.checkbox').checkbox()

$ ->
	#window.base.Init()
	if $.turbo.isReady == true
		window.base.Init()
		$(".timeago").timeago()