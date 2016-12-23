class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy
  scope :pending, -> {where( :status => "pending" )}
  scope :completed, -> {where( :status => "completed" )}
  scope :within_days, ->(day) {where( ["created_at >= ?", Time.now - day.days ] )}


  has_many :likes, :dependent => :destroy
  has_many :liked_users, through: :likes, source: "user"

  has_many :subscriptions, :dependent => :destroy
  has_many :subscribed_users, through: :subscriptions, source: "user"

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

end
