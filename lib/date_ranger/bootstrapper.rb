module DateRanger::Bootstrapper

  def has_date_range(options={})
    cattr_accessor :date_ranger_options
    self.date_ranger_options = options
    self.date_ranger_options[:timestep] ||= :daily
    if self.date_ranger_options[:class]
      extend DateRanger
    else
      self.send :include, DateRanger
    end
  end

end

Class.send :include, DateRanger::Bootstrapper