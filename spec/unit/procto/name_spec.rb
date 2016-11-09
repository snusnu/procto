# encoding: utf-8

require 'spec_helper'

describe Procto, '.name' do
  context 'with a name' do
    subject { klass.public_send(name.to_sym, text) }

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
