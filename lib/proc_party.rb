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
end
