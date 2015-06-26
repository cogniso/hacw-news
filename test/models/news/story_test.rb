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

require 'test_helper'

module News
  class StoryTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
  end
end
