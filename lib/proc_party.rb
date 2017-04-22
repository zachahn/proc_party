# {ProcParty} is a module that takes any class that defines a method `#call`
# and turns it into a proc.
#
# It defines methods that are analogous to the one defined in `Proc` so that
# any object which includes this module can effectively be considered as a
# proc.
#
# For more information as to what each of the methods do, see the original
# documentation in `Proc`. This is generally possible via the command-line
# by running (for example) `ri "Proc#==="`.
module ProcParty
  # Converts the method `#call` into a proc. It generates a new proc each time
  # it's called.
  #
  #     foo = Foo.new
  #     foo.to_proc == foo.to_proc # => false
  #     ->{} == ->{} # => false
  #
  # @return [Proc]
  def to_proc
    method(:call).to_proc
  end

  # Alias for `#call`
  #
  # @see https://ruby-doc.org/core/Proc.html#method-i-5B-5D
  def [](*args)
    call(*args)
  end

  # Alias for `#call`
  #
  # @see https://ruby-doc.org/core/Proc.html#method-i-3D-3D-3D
  def ===(*args)
    call(*args)
  end

  # @see https://ruby-doc.org/core/Proc.html#method-i-arity
  # @return [Integer] the arity of the #call method
  def arity
    to_proc.arity
  end

  # @see https://ruby-doc.org/core/Proc.html#method-i-curry
  # @return [Proc]
  def curry(*arg)
    to_proc.curry(*arg)
  end

  # @see https://ruby-doc.org/core/Proc.html#method-i-lambda-3F
  # @return [Boolean]
  def lambda?
    to_proc.lambda?
  end

  # @see https://ruby-doc.org/core/Proc.html#method-i-parameters
  # @return [Array<Array<Symbol>>]
  def parameters
    method(:call).parameters
  end

  # @see https://ruby-doc.org/core/Proc.html#method-i-source_location
  # @return [Array<String, Integer>, nil]
  def source_location
    method(:call).source_location
  end

  # Alias for `#call`
  #
  # @see https://ruby-doc.org/core/Proc.html#method-i-yield
  def yield(*args)
    call(*args)
  end
end
