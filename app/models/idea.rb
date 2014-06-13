class Idea < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  delegate :name_display, to: :user, prefix: true

  validates :title, :description, 
              presence: {message: "must be provided"},
              uniqueness: {message: "must be unique"}


end
