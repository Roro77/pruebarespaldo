module TweetsHelper
    def render_with_hashtags(content)
        content.gsub(/#\w+/){|word| link_to word, "/tweet/hashtag/#{word.delete('#')}"}.html_safe
    end
end
