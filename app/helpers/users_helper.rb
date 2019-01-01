module UsersHelper
  
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_uri = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_uri, alt: user.name, class: "gravatar")
  end
end
