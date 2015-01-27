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
#= require nprogress
#= require nprogress-turbolinks
# require_tree .
#= require timeago
#= require simditor
#= require semantic-ui
#= require angular
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

NProgress.configure
	showSpinner: true
	ease: 'ease'
	speed: 500

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
	Simditor : (place,can_upload = false) ->
		editor = new Simditor
			textarea: place
			placeholder: ''
			params: {}
			upload: can_upload
			tabIndent: true
			toolbarFloat: true
			upload:
				url: '/api/v1/upload/image'
				connectionCount: 1
				leaveConfirm: '正在上传文件，如果离开上传会自动取消'
			pasteImage: true
			toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
	RemoveSmall : () ->
		$('.hide-when-small').remove()
	RemoveTiny : () ->
		$('.hide-when-small').remove()
		$('.hide-when-tiny').remove()
	Init : () ->
		$('.ui.dropdown').dropdown()
		$('.ui.modal').modal()
		$('.ui.checkbox').checkbox()


$ ->
	#window.base.Init()
	if $.turbo.isReady == true
		window.base.Init()
		window.base.CloseFlash()
		$(".timeago").timeago()
		@width = $(window).width
		switch
			when @width <= 600 then window.base.RemoveTiny()
			when 600 < @width < 1000 then window.base.RemoveSmall()

