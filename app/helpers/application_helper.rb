module ApplicationHelper

  def gravatar_for(user, opts={})
    opts[:alt] = user.name
    img_tag "https://www.gravatat.com/avatar/#{Digest::M5.hexidigest(user.email)}?s={opts.delete(:size){40}}",
    opts
  end
end
