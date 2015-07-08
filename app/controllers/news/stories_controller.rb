require 'faker'

module News
  class StoriesController < ApplicationController
    def index
      @stories = Story.order('points DESC').all
    end

    def new
      @story = Story.new
    end

    def show
      @story = Story.find(params[:id])
    end

    def vote
      direction = params[:direction].downcase.to_sym
      unless [:up,:down].include? direction
        raise "Vote must be either up or down"
      end

      @story = Story.find(params[:id])
      @story.vote!(direction)
      redirect_to story_path(@story)
    end

    # Creates a few random stories to get us going
    def seed
      20.times do |n|
        Story.create!(
          title: Faker::Lorem.sentence,
          url: Faker::Internet.url,
          points: rand(-100..100),
          image: Faker::Avatar.image,
          created_at: Faker::Time.backward(14),
        )
      end
    end
  end
end
