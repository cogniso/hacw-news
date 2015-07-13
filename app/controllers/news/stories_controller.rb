require 'faker'

module News
  class StoriesController < ApplicationController
    def index
      @stories = Story.order('points DESC').all
    end

    def show
      @story = Story.friendly.find(params[:id])
    end

    def new
      @story = Story.new
    end

    def create
      @story = Story.new(story_params)
      @story.approved = false
      if @story.save
        redirect_to root_path, success: "Thanks for your submission - we'll check it and put it on the site ASAP"
      else
        render 'new'
      end
    end


    # Creates a few random stories to get us going
    def seed
      Story.delete_all
      Comment.delete_all
      20.times do |n|
        story = Story.create!(
          title: Faker::Lorem.sentence,
          url: Faker::Internet.url,
          points: rand(-100..100),
          image: Faker::Avatar.image,
          created_at: Faker::Time.backward(14),
        )

        rand(0..10).times do |x|
          comment = story.comments.create!(
            body: Faker::Lorem.paragraph(2),
            points: rand(-100..100),
          )

          rand(0..3).times do |y|
            comment.replies.create!(
              body: Faker::Lorem.paragraph(rand(1..9)),
              points: rand(-10..10)
            )
          end
        end
      end
      redirect_to root_path
    end

    private
      def story_params
        params.require(:story).permit(:url, :title, :submitter_name, :submitter_email)
      end
  end
end


