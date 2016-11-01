class ApplicationDecorator < Draper::Decorator
  include Draper::LazyHelpers
  include ActionView::Helpers::DateHelper

  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
