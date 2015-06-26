require 'faker'

module News
  class StoriesController < ApplicationController
    def index
      @stories = Story.all
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
