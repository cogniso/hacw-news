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
    def setup
      @story = Story.new(url: 'http://www.google.com', title: 'A title here')
    end

    test "should be valid" do
      assert @story.valid?
    end

    test "URL should be present" do
      @story.url = ''
      assert_not @story.valid?
    end

    test "URL should be a valid URL" do
      @story.url = 'somethingcrap'
      assert_not @story.valid?
    end

    test "it adds http if needed" do
      @story.url = 'www.swim.com'
      assert @story.valid?
      assert_equal "http://www.swim.com", @story.url
    end

    test "title should be present" do
      @story.title = ''
      assert_not @story.valid?
    end

    test "voting up adds a point" do
      @story.points = 10
      @story.vote!(:up)
      assert_equal @story.points, 11
    end

    test "voting down subtracts a point" do
      @story.points = 10
      @story.vote!(:down)
      assert_equal @story.points, 9
    end
  end
end
