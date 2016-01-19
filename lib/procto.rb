# encoding: utf-8

class Procto < Module
  # The default name of the instance method to be called
  DEFAULT_NAME = :call

  private_class_method :new

  # Return a module that turns the host into a method object
  #
  # @example without a name
  #
  #   class Greeter
  #     include Procto.call
  #
  #     def initialize(text)
  #       @text = text
  #     end
  #
  #     def call
  #       "Hello #{text}"
  #     end
  #   end
  #
  #   Greeter.call('world') # => "Hello world"
  #
  # @example with a name
  #
  #   class Printer
  #     include Procto.call(:print)
  #
  #     def initialize(text)
  #       @text = text
  #     end
  #
  #     def print
  #       "Hello #{text}"
  #     end
  #   end
  #
  #   Printer.call('world') # => "Hello world"
  #
  # @param [#to_sym] name
  #   the name of the instance method to call
  #
  # @return [Procto]
  #
  # @api public
  def self.call(name = DEFAULT_NAME)
    new(name.to_sym)
  end

  # Initialize a new instance
  #
  # @param [Symbol] name
  #   the name of the instance method to call
  #
  # @return [undefined]
  #
  # @api private
  def initialize(name)
    @block = ->(*args) { new(*args).public_send(name) }
  end

  private

  # Define the .call method on +host+
  #
  # @param [Object] host
  #   the hosting object
  #
  # @return [undefined]
  #
  # @api private
  def included(host)
    host.instance_exec(@block) do |block|
      define_singleton_method(:call, &block)
    end

    host.extend(ClassMethods)
  end

  # Procto module for adding .to_proc to host class
  module ClassMethods
    # Return the `call` singleton method as a lambda
    #
    # @example using a class as a proc
    #
    #   class Shouter
    #     include Procto.call
    #
    #     def initialize(text)
    #       @text = text
    #     end
    #
    #     def call
    #       "#{@text.upcase}!"
    #     end
    #   end
    #
    #   Shouter.to_proc.call('hello') # => "HELLO!"
    #   %w[foo bar].map(&Shouter)     # => ["FOO!", "BAR!"]
    #
    # @return [Proc]
    #
    # @api public
    def to_proc
      public_method(:call).to_proc
    end
  end
  private_constant(:ClassMethods)
end # Procto
