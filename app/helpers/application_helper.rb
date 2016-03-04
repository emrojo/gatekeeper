module ApplicationHelper

  def flash_message(category)
    {
      :success  => 'Success',
      :info     => 'Note',
      :warning  => 'Caution',
      :danger   => 'Sorry!'
    }[category]
  end

  def each_barcode_printer(type)
    (Settings.printers[type]||no_printer).each do |printer|
      yield printer[:name],printer[:uuid]
    end
  end

  def icon_tag(icon_class)
    render :partial => 'shared/icon_tag', :locals => {:icon_class => icon_class}
  end

  def no_printer
    [{:name=>'No printer found',:uuid=>nil}]
  end
  private :no_printer

end
