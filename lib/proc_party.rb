module ProcParty
  def to_proc
    method(:call).to_proc
  end

  def [](*args)
    call(*args)
  end

  def ===(*args)
    call(*args)
  end

  def arity
    to_proc.arity
  end

  def curry(*arg)
    to_proc.curry(*arg)
  end

  def lambda?
    to_proc.lambda?
  end

  def parameters
    method(:call).parameters
  end

  def source_location
    method(:call).source_location
  end

  def yield(*args)
    call(*args)
  end
end
