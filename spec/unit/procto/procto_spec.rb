# encoding: utf-8

require 'spec_helper'

describe Procto, '.new' do
  subject { klass.new(1) }

  let(:klass) do
    Class.new do
      include Procto.call

      def initialize(text)
        @text = text
      end

      def call
        "Hello #{@text}"
      end
    end
  end

  it 'is a private method' do
    expect { subject }.to raise_error(NoMethodError, /private method `new'/)
  end
end


describe Procto, '#action' do
  subject { klass.call("world").print }

  let(:name) { :print }
  let(:klass) do
    Class.new do
      include Procto.call(:print)

      def initialize(text)
        @text = text
      end

      def print
        self
      end
    end
  end

  it 'is a private method' do
    expect { subject }.to raise_error(NoMethodError, /private method `#{name}'/)
  end
end
