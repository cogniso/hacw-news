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
    validates :url, :title, presence: true

    def vote!(direction)
      change = case direction
      when :up then 1
      when :down then -1
      else return
      end

      update_attribute(:points, points + change)
    end
  end
end
