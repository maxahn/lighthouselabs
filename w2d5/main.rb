require 'rubygems'
require 'nokogiri'
require './post.rb'
require './comment.rb'
require 'colorize'
require 'open-uri'

puts ARGV.to_s.class
url = ARGV.join("")
puts url


html_file = open(url)


doc = Nokogiri::HTML(html_file)
title = doc.css("title").text
id = doc.css("a[id]")[0]["id"].gsub(/[^\d]/, '')
points = doc.css("span[id=score_#{id.to_s}]").text.gsub(/[^\d]/, '')
url = doc.css('td.title a').map { |link| link['href'] }

post = Post.new(doc, title, points, id, url)

post.doc.css("span.comment").each do |x|
  Comment.create(Comment.new(x.text))
end

n = 0
post.comments.each do |comment|
  if n == 0
    puts comment.red
    n = 1 
  else
    puts comment.green
    n = 0
  end
end

puts "Title: #{post.title}"
puts "URL: #{post.url}"
puts "Points: #{post.points}"
puts "ID: #{post.id}"

  


# puts doc.search('.subtext > span:first-child').map { |span| span.inner_text}
# puts doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
# puts doc.search('.title > a:first-child').map { |link| link.inner_text}
# puts doc.search('.title > a:first-child').map { |link| link['href']}
# puts doc.search('.comment > font:first-child').map { |font| font.inner_text}

# span id=score_7663775

# <a href="item?id=7663775">

# <td class="title"><a href="http://VelocityJS.org">

# <td class="title">
# <a href="http://VelocityJS.org">Show HN: Velocity.js &acirc;&#128;&#147; Accelerated JavaScript animation</a><span class="comhead"> (VelocityJS.org) </span>
# </td>