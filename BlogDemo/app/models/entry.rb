class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true, length: {maximum: 255}


  def getComments
  	return Comment.where("entry_id = ? ", id)
  end
end
