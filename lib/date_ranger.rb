module DateRanger

  attr_writer :start_date, :end_date

  def date_ranger_options
    if self.class.respond_to?(:date_ranger_options)
      self.class.date_ranger_options
    else
      super
    end
  end

  def start_date
    @start_date ||= self.date_ranger_options[:default_start_date].call
    @start_date = case self.date_ranger_options[:timestep]
                  when :daily; @start_date
                  when :monthly; @start_date.beginning_of_month
                  end
    @start_date = if @start_date.respond_to?(:to_date)
                    @start_date.to_date
                  else
                    @start_date
                  end
  end

  def end_date
    @end_date ||= self.date_ranger_options[:default_end_date].call
    @end_date = case self.date_ranger_options[:timestep]
                when :daily; @end_date
                when :monthly; @end_date.end_of_month
                end
    @end_date = @end_date.respond_to?(:to_date) ? @end_date.to_date : @end_date
  end

end

require "active_support/all"
require 'date_ranger/bootstrapper'
