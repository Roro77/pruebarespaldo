class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :content, presence: true
  scope :tweets_for_me, ->(friends) {where(user_id: friends)}
  has_and_belongs_to_many :tags
  
  after_create do
    tweet = Tweet.find_by(id: self.id)
    hastags = self.content.scan(/#\w+/)
    hastags.uniq.map do |hashtag|
    tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
    tweet.tags << tag
    end
  end
    
  after_update do
    tweet = Tweet.find_by(id: self.id)
    tweet.tags.clear
    hastags = self.content.scan(/#\w+/)
    hastags.uniq.map do |hashtag|
    tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
    tweet.tags << tag
    end
  end 

  def add_like(user)
    Like.create(user: user, tweet: self)
  end

  def remove_like(user)
    Like.where(user: user, tweet: self).first.destroy
  end

  def original_tweet
    Tweet.find(self.origin_tweet)
  end
end
