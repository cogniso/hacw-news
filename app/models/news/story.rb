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
  end
end
