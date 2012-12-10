module DateRanger

  def start_date
    @start_date ||= self.class.date_ranger_options[:default_start_date].call
    case self.class.date_ranger_options[:timestep]
    when :daily; @start_date
    when :monthly; @start_date.beginning_of_month
    end
  end

  def start_date=(date)
    @start_date = date.respond_to?(:to_date) ? date.to_date : date
  end

  def end_date
    @end_date ||= self.class.date_ranger_options[:default_end_date].call
    case self.class.date_ranger_options[:timestep]
    when :daily; @end_date
    when :monthly; @end_date.end_of_month
    end
  end

  def end_date=(date)
    @end_date = date.respond_to?(:to_date) ? date.to_date : date
  end

end

require "active_support/all"
require "date_ranger/version"
require 'date_ranger/bootstrapper'
