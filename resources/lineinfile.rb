resource_name 'lineinfile'
actions :run
default_action :run

# property :backrefs, kind_of: String
# property :backup, kind_of: String
# property :create, kind_of: String
property :dest, :name_property => true, kind_of: String, required: true
# property :group, kind_of: String
# property :insertafter, kind_of: String
# property :insertbefore, kind_of: String
property :line, kind_of: String, required: true
# property :mode, kind_of: String
# property :others, kind_of: String
# property :owner, kind_of: String
property :regexp, kind_of: [String, Regexp], required: true
# property :validate, kind_of: String

action :run do
  file_path = dest

  regex = if regexp.is_a?(Regexp)
            regexp
          else
            Regexp.new(Regexp.escape(regexp))
          end
  contents = ::File.read(file_path)
  if contents =~ regex
    # Calculate file hash before changes
    before = Digest::SHA256.file(file_path).hexdigest

    # Do changes
    file = Chef::Util::FileEdit.new(dest)
    file.search_file_replace_line(regex, line)
    file.write_file

    # Notify file changes
    if Digest::SHA256.file(file_path).hexdigest != before
      Chef::Log.info "- #{regexp}"
      Chef::Log.info "+ #{line}"
      updated_by_last_action(true)
    end

    # Remove backup file
    ::File.delete(file_path + '.old') if ::File.exist?(file_path + '.old')
  end
end
