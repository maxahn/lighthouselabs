require 'bundler/setup'
require 'pry'
require 'pry-nav'
require "net/http"
require "uri"
require 'nokogiri'
require 'colorize'

require_relative 'config'
require_relative 'lib/light_brow/browser'
require_relative 'lib/light_brow/html_page'


LightBrow::Browser.new.run
