module News
  class CommentsController < ApplicationController
    def new
      @comment = build_new_comment
    end

    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to @comment.story
      else
        render 'new'
      end
    end

    private
    def build_new_comment
      if params[:reply_to]
        parent = Comment.find(params[:reply_to])
        return parent.replies.build
      elsif params[:story_id]
        @story = Story.find(params[:story_id])
        return @story.comments.build
      else
        raise "Must provide either a story_id or a reply_to"
      end
    end

    def comment_params
      params.require(:comment).permit(:body, :story_id, :parent_id)
    end
  end
end
