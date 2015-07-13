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

require 'uri'

module News
  class Story < ActiveRecord::Base
    has_many :comments

    validates :url, :title, presence: true
    validate :validate_url
    def validate_url
      # Add HTTP if it's needed
      url.gsub!(/\Awww\./, 'http://www.')
      valid = begin
         uri = URI.parse(url)
         uri.kind_of?(URI::HTTP)
      rescue URI::InvalidURIError
        false
      end
      errors.add :url, 'is not a valid URL' unless valid
    end

    extend FriendlyId
    friendly_id :title, use: [:slugged]


    def vote!(direction)
      change = case direction.to_sym
      when :up then 1
      when :down then -1
      else "Unexpected vote direciton, must be up or down."
      end

      update_attribute(:points, points + change)
    end
  end
end
