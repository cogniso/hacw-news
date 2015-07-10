# == Schema Information
#
# Table name: news_stories
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  image      :string
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module News
  class Story < ActiveRecord::Base
    has_many :comments

    validates :url, :title, presence: true

    def vote!(direction)
      change = case direction.to_sym
      when :up then 1
      when :down then -1
      else "Unexpected vote direciton, must be up or down."
      end

      update_attribute(:points, points + change)
    end
  end
end
