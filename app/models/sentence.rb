class Sentence < ActiveRecord::Base
  belongs_to :user

  scope :mine, ->(user) { where(sentences: { user_id: user.id} ) }
end
