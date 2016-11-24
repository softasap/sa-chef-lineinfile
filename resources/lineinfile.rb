resource_name 'lineinfile'
actions :run
default_action :run

# property :backrefs, kind_of: String
property :backup, kind_of: String, default: 'no'
# property :create, kind_of: String
property :dest, name_property: true, kind_of: String, required: true
# property :group, kind_of: String
# property :insertafter, kind_of: String
# property :insertbefore, kind_of: String
property :line, kind_of: String, required: true
# property :mode, kind_of: String
# property :others, kind_of: String
# property :owner, kind_of: String
property :regexp, kind_of: [String, Regexp], required: true
property :state, kind_of: String, default: 'present'
# property :validate, kind_of: String

action :run do
  file_path = dest

  regex = if regexp.is_a?(Regexp)
            regexp
          else
            Regexp.new(regexp)
          end
  Chef::Log.info "======> processing trying #{regexp} to replace with #{line}"

  # Do changes
  file = Chef::Util::FileEdit.new(dest)

  if state == 'present'
    file.search_file_replace_line(regex, line)
    file.insert_line_if_no_match(regex, line)
  end

  file.search_file_delete_line(regex) if state == 'absent'

  file.write_file

  updated_by_last_action(true) if file.file_edited?

  # Remove backup file
  if backup == 'no'
    ::File.delete(file_path + '.old') if ::File.exist?(file_path + '.old')
  end
end
