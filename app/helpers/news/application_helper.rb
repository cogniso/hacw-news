module News
  module ApplicationHelper
    def error_messages_for(obj)
      return unless obj.errors.any?
      render 'news/shared/errors_summary', errors: obj.errors.full_messages
    end
  end
end
