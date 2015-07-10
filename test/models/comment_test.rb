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
  class CommentTest < ActiveSupport::TestCase
    def setup
      @story = Story.create!(url: 'http://www.google.com', title: 'A title here')
      @comment = @story.comments.build(body: 'This is a comment.')
    end

    test "comment is valid" do
      assert @comment.valid?
    end

    test "it requires some body text" do
      @comment.body = ''
      assert_not @comment.valid?
    end

    test "it requires a story" do
      @comment.story = nil
      assert_not @comment.valid?
    end

    test "it rejects invalid votes" do
      assert_raise do
        @comment.vote!(:left)
      end
    end

    test "it votes up" do
      original_points = @comment.points
      @comment.vote!(:up)
      assert_equal  original_points + 1, @comment.points
    end

    test "it votes down" do
      original_points = @comment.points
      @comment.vote!(:down)
      assert_equal original_points - 1, @comment.points
    end
  end
end
