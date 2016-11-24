if defined?(ChefSpec)
  def run_lineinfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:lineinfile, :run, resource_name)
  end

