#!/usr/bin/env ruby -W0 

require 'rubygems'
require 'pismo'
require 'securerandom'
require 'json'
require 'pp'

index = ARGV[0]
document = ARGV[1]

f=JSON.parse(File.read(document.dup))
content=f['content']

doc = Pismo::Document.new(content, :image_extractor => true, :clean => true)
doc = Pismo::Document.new(content, :image_extractor => true, :reader => :cluster, :clean => true) if doc.body.empty?


id = File.basename(document)
data =  {:title => doc.title, 
         :url => f['url'], 
         :images => doc.images, 
         :titles => doc.titles, 
         :author => doc.author, 
         :lede => doc.lede, 
         :keywords => doc.keywords,
         :body => doc.body,
         :feed => doc.feed,
         :feeds => doc.feeds,
         :favicon => doc.favicon,
         :description => doc.description,
         :datetime => doc.datetime }
file = File.open File.join(index, id), "w"
file.puts data.to_json
file.close

