module PathEx::Extension
  using PathEx::Refine::AtPath
  
  def at_path(*args)
    at(*args)
  end
end
