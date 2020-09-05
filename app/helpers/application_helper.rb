module ApplicationHelper

  def format_currency(total_in_dollars, precision = 0)
    number_to_currency(total_in_dollars, precision: precision)
  end

  def format_date(datetime)
    datetime&.strftime('%b %d, %Y')
  end

  def format_time(datetime)
    datetime&.strftime('%I %P')
  end

  def format_date_range(datetime_1, datetime_2)
    if datetime_1.to_date == datetime_2.to_date
      format_date(datetime_1)
    elsif datetime_1.year != datetime_2.year
      datetime_1&.strftime('%b %d, %Y') + ' - ' + datetime_2&.strftime('%b %d, %Y')
    else
      datetime_1&.strftime('%b %d') + ' - ' +
      format_date(datetime_2)
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
