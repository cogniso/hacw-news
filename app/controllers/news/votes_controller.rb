module News
  class VotesController < ApplicationController
    def create
      if params[:comment_id]
        @comment = Comment.find(params[:comment_id])
        @comment.vote! params[:direction]
        redirect_to @comment.story
      elsif params[:story_id]
        @story = Story.find(params[:story_id])
        @story.vote! params[:direction]
        redirect_to @story
      end
    end
  end
end
