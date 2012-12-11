# Retrieves the Puppet Enterprise version, and provides simple methods to present
# the versioning information however it may be needed. Any repo should be able to
# access this information by passing a require File.join(File.dirname(__FILE__),
# '../relative-path-to-src/puppet-dashboard/config/initializers/pe_version_init.rb')

module PEVersion

  def self.retrieve_pe_version
    pe_version          = File.read('/opt/puppet/pe_version').chomp
    @pe_version_array   = pe_version.split( '.' )
    @pe_major_version   = @pe_version_array[0]
    @pe_minor_version   = @pe_version_array[1]
    pe_version
  end

  def self.pe_major_version
    retrieve_pe_version if !@pe_major_version
    @pe_major_version
  end

  def self.pe_minor_version
    retrieve_pe_version if !@pe_minor_version
    @pe_minor_version
  end

  def self.pe_version_major_minor
    "#{pe_major_version}.#{pe_minor_version}"
  end
end
