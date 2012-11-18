require File.join(File.dirname(__FILE__), 'base')

class Vixen::Model::Snapshot < Vixen::Model::Base
  def display_name
    return @display_name unless @display_name.nil?
    @display_name = get_string_property VixPropertyId[:snapshot_displayname]
  end

  def description
    return @description unless @description.nil?
    @description = get_string_property VixPropertyId[:snapshot_description]
  end

  def parent
    return @parent unless @parent.nil?
    parent_handle = Vixen::Bridge.get_parent handle
    @parent = parent_handle == VixHandle[:invalid] ? nil : self.class.new(parent_handle)
  end

  def full_name
    root = parent ? parent.full_name : File::SEPARATOR
    File.join(root, display_name)
  end

  def to_s
    display_name
  end
end