Facter.add(:agent_specified_environment_setbycli) do
  setcode do
    # This will be nil if Puppet is not available.
    begin
      Module.const_get("Puppet")
    rescue NameError
      nil
    else
      Puppet.settings.set_by_cli?(:environment)
    end
  end
end
