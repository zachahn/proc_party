module ProcParty
  def to_proc
    method(:call).to_proc
  end

  def [](*args)
    call(*args)
  end
end
