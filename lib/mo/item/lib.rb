module Mo
  module Item
    def get_params(str)
      str =~ /_/
      @type = $`
      @id = $'
    end

    def find_item(str)
      get_params str
      case @type
      when 'photo' then find_in_images @id
      end
    end

    def find_in_images(id)
      Image.where('id = ?', id.to_i).last
    end
  end
end

