module Puppet::Parser::Functions
  newfunction(:adminpass, :type => :rvalue) do |password|
    `echo -n "#{password}" | sha1sum  | sed 's/ .*$//g'`.chomp
  end
end
