module News
  class VotesController < ApplicationController
    def create
      if params[:comment_id]
        @object = Comment.find(params[:comment_id])
      elsif params[:story_id]
        @object = Story.find(params[:story_id])
      end
      @object.vote! params[:direction]
      respond_to do |format|
        format.html { redirect_to(@object.try(:story) || @object) }
        format.json { render json: { points: @object.points } }
      end
    end
  end
end
