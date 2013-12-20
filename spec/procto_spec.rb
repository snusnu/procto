# encoding: utf-8

require 'spec_helper'

shared_context 'procto' do
  subject { klass.call(text) }

  let(:text)     { 'world' }
  let(:expected) { "Hello #{text}" }

  it 'returns the correct value' do
    expect(subject).to eql(expected)
  end
end

describe Procto, '.call' do
  context 'with no name' do
    include_context 'procto'

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
  end

  context 'with a name' do
    include_context 'procto'

    let(:name) { double('name', to_sym: :print) }

    let(:klass) do
      method_name = name
      Class.new do
        include Procto.call(method_name)

        def initialize(text)
          @text = text
        end

        def print
          "Hello #{@text}"
        end
      end
    end
  end
end
