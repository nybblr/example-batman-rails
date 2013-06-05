require 'net/http'

class PostsRealtime < FayeRails::Controller
  def self.publish channel, data
    uri = URI.parse("http://localhost:9292/faye")
    msg = {channel: channel, data: data}
    Net::HTTP.post_form(uri, :message => msg.to_json)
  end

  observe Post, :after_create do |post|
    PostsRealtime.publish "/posts/created", post.attributes
    puts "CREATING"
  end

  observe Post, :after_update do |post|
    PostsRealtime.publish "/posts/updated", post.attributes
    puts "UPDATING"
  end

  observe Post, :after_destroy do |post|
    PostsRealtime.publish "/posts/destroyed", :id => post.id
    puts "DESTROYING"
  end
end

