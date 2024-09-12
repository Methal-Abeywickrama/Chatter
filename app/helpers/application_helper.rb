module ApplicationHelper
  require 'digest' 
  require 'uri' 
  def gravatar_url(email, size = 150)
    hash = Digest::SHA256.hexdigest(email.downcase.strip)
    default = 'retro'
    params = URI.encode_www_form('d' => default, 's' => size)
    image_src = "https://www.gravatar.com/avatar/#{hash}?#{params}"
    image_src
  end
end
