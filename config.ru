require 'rubygems'
require 'sinatra'
require './app/server'
require './app/auth'


require File.dirname(__FILE__) + '/app/server'

run Server
run Auth
