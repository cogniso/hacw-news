module News
  module ApplicationHelper
    def error_messages_for(obj)
      return unless obj.errors.any?
      render 'news/shared/errors_summary', errors: obj.errors.full_messages
    end

    # Creates an ajax link for voting
    # Takes the object we are voting on
    # and the direction we're voting
    def vote_link_for(obj, direction)
      puts obj.class.inspect
      attr = case obj.class.name
      when 'News::Story' then { story_id: obj.id }
      when 'News::Comment' then { comment_id: obj.id }
      else raise "Unknown vote subject: #{obj.class}"
      end

      attr.merge!(direction: direction)
      link_to '', votes_path(attr), class: "glyphicon glyphicon-chevron-#{direction} story-item-vote-arrow js-vote"
    end
  end
end
