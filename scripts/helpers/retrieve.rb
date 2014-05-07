#!/usr/bin/env ruby -W0 

require 'rubygems'
#require 'open-uri'
require 'json'
require 'securerandom'
require 'pismo'
require 'pp'

index = ARGV[0]
link = ARGV[1]

id = SecureRandom.uuid

open(File.join(index, id), "w") do |file|
cmd = "wget -qO- #{link}"
content = `#{cmd}`
data = {:url => link, :content => content}
file.write(data.to_json)
end

#open(File.join(index, id), "w") do |file|
#  open(link) do |uri|
#     content = uri.read.force_encoding("utf-8")
#     data = {:url => link, :content => content}
#     file.write(data.to_json)
#  end
#end
