module UsersHelper
  def profile_image_for(user, options = {})
    size = options[:size] || 80
    imgclass = options[:class] || 'gravatar'
    if user.avatar?
      image_tag(user.avatar.thumb.url, alt: user.email, class: imgclass, size: size)
    else
      url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}&d=identicon"
      image_tag(url, alt: user.email, class: imgclass)
    end
  end
end
