class ApplicationDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
