# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#
#= require foundation
#= require underscore
#
#= require rangy-core
#= require rangy-cssclassapplier
#= require rangy-highlighter
#= require rangy-position
#= require rangy-selectionsaverestore
#= require rangy-serializer
#= require rangy-textrange
#
#= require ./lib/jquery.autosize
#= require ./lib/hallo
#
#= require ./lib/es5-shim
#= require ./lib/batman
#= require ./lib/batman.jquery
#= require ./lib/batman.rails
#
#= require ./lib/robin
#= require ./lib/reactor
#
#= require ./batman/app
#
#= require_tree ./batman/models
#= require_tree ./batman/controllers
#= require_tree ./batman/helpers
#= require_tree ./batman/views
#
#= require_self

# Run the Batman app
$ ->
  Awesome.run()

# JS niceness
$ ->
  $('#main').on 'mouseover', 'textarea', ->
    $(this).autosize()
