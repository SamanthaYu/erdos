module NotificationsHelper

  def emojime(content)
    EmojiParser.parse(content) do |emoji|
      '<img src="/'+emoji.image_filename+'" alt=":'+emoji.name+':" class="emojis">'
    end
  end

end
