require "proc_party/version"

module ProcParty
  def to_proc
    method(:call).to_proc
  end
end
