module News
  class Comment < ActiveRecord::Base
    acts_as_nested_set
    alias_method :replies, :children

    before_validation :set_story_id
    def set_story_id
      self.story_id = parent.story_id if child?
    end

    belongs_to :story
    validates :body, :story, presence: true

    # Direction will be either up or down
    def vote!(direction)
      change = case direction.to_sym
      when :up then 1
      when :down then -1
      else raise "Unexpected vote direciton, must be up or down."
      end

      update_attribute(:points, points + change)
    end
  end
end
