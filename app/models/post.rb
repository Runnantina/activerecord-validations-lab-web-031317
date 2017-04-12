class PostValidator < ActiveModel::Validator
  def validate(post)
    unless post.title =~ /Won't Believe|Secret|Top \d|Guess/
      post.errors[:title] << "Make it more clickbait-y!"
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  include ActiveModel::Validations
  validates_with PostValidator
end
