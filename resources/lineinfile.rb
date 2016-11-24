resource_name 'lineinfile'
actions :run
default_action :run

property :backrefs, :kind_of => String
property :backup, :kind_of => String
property :create, :kind_of => String
property :dest, :name_property => true, :kind_of => String, :required => true
property :group, :kind_of => String
property :insertafter, :kind_of => String
property :insertbefore, :kind_of => String
property :line, :kind_of => String
property :mode, :kind_of => String
property :others, :kind_of => String
property :owner, :kind_of => String
property :regexp, :kind_of => [String, Regexp], :required => true
property :validate, :kind_of => String

action :run do

	file_path = file || path || name

	if regexp.is_a?(Regexp)
		regex = regexp
	else
		regex = Regexp.new(Regexp.escape(regexp))
	end

end
