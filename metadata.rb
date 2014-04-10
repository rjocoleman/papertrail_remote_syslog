name 'papertrail_remote_syslog'
maintainer 'Robert Coleman'
maintainer_email 'github@robert.net.nz'
license 'Apache 2.0'
description 'Installs/Configures remote_syslog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.1'

%w(debian ubuntu).each do |os|
  supports os
end
