require 'mongoid'

# DB Setup
Mongoid.load! 'mongoid.yaml'

# Models
class Post
  include Mongoid::Document

  field :title, type: String
  field :image, type: String
  field :body, type: String
  field :created_date, type: String

  validates :title, presence: true
  validates :image, presence: true
  validates :body, presence: true
  validates :created_date, presence: true

  index({ title: 'text' }, name: 'title_index')
  index({ body: 'text' }, name: 'body_index')

  scope :title, ->(title) { where(title: /#{title}*/) }
  scope :body, ->(body) { where(body: /#{body}*/) }
end
