# encoding: utf-8

require 'spec_helper'

describe Procto, '.to_proc' do
  include_context 'procto'

  subject { proc.call(text) }

  let(:proc) { klass.to_proc }

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

  it 'exposes a lambda proc' do
    expect(proc).to be_a_lambda
  end
end
