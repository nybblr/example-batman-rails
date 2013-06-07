require 'net/http'

class CommentsRealtime < FayeRails::Controller
  def self.publish channel, data
    uri = URI.parse("http://localhost:9292/faye")
    msg = {channel: channel, data: data}
    Net::HTTP.post_form(uri, :message => msg.to_json)
  end

  observe Comment, :after_create do |comment|
    CommentsRealtime.publish "/comments/created", comment.attributes
    puts "CREATING"
  end

  observe Comment, :after_update do |comment|
    CommentsRealtime.publish "/comments/updated", comment.attributes
    puts "UPDATING"
  end

  observe Comment, :after_destroy do |comment|
    CommentsRealtime.publish "/comments/destroyed", :id => comment.id
    puts "DESTROYING"
  end
end

