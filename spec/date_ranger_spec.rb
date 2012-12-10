require 'spec_helper'

describe DateRanger do

  class Something
  end

  describe '.has_date_range' do
    it 'should default timestep to :daily' do
      Something.has_date_range
      Something.date_ranger_options[:timestep].should == :daily
    end
  end

  describe "#start_date" do
    it 'should return date given a string' do
      Something.has_date_range
      something = Something.new
      something.start_date = '2012-01-01'
      something.start_date.should == '2012-01-01'.to_date
    end

    context 'when not overriden' do
      it 'should return the given default start date' do
        Something.has_date_range :default_start_date => lambda { 2.days.ago.to_date }
        something  = Something.new
        something.start_date.should == 2.days.ago.to_date
      end
    end

    context 'when the timestep is monthly' do
      it 'should start at the first day of the month' do
        Something.has_date_range(:timestep => :monthly)
        something = Something.new
        something.start_date = '2012-01-05'.to_date
        something.start_date.should == '2012-01-01'.to_date
      end
    end

    context 'when the timestep is daily' do
      it 'should end at the given date' do
        Something.has_date_range(:timestep => :daily)
        something = Something.new
        something.start_date = '2012-01-15'.to_date
        something.start_date.should == '2012-01-15'.to_date
      end
    end
  end

  describe "#end_date" do
    it 'should return date given a string' do
      Something.has_date_range
      something = Something.new
      something.end_date = '2012-01-01'
      something.end_date.should == '2012-01-01'.to_date
    end

    context 'when not overriden' do
      it 'should return the given default end date' do
        Something.has_date_range :default_end_date => lambda { 2.days.ago.to_date }
        something  = Something.new
        something.end_date.should == 2.days.ago.to_date
      end
    end

    context 'when the timestep is monthly' do
      it 'should end at the last day of the month' do
        Something.has_date_range(:timestep => :monthly)
        something = Something.new
        something.end_date = '2012-01-15'.to_date
        something.end_date.should == '2012-01-31'.to_date
      end
    end

    context 'when the timestep is daily' do
      it 'should end at the given date' do
        Something.has_date_range(:timestep => :daily)
        something = Something.new
        something.end_date = '2012-01-15'.to_date
        something.end_date.should == '2012-01-15'.to_date
      end
    end
  end

end
