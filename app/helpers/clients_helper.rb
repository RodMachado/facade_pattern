module ClientsHelper
  def link_to_new(presenter)
    link_to(
      t('defaults.new', resource: 'Client'),
      new_client_path,
      class: 'btn btn-primary'
    )
  end

  def link_to_show(client)
    link_to(client) do
      '<i class="fa fa-search"></i>'.html_safe
    end
  end

  def link_to_edit(client)
    link_to(edit_client_path(client)) do
      '<i class="fa fa-pencil-square-o"></i>'.html_safe
    end
  end

  def link_to_destroy(client)
    link_to(
      client,
      method: :delete,
      data: { confirm: 'Are you sure?' }
    ) do
      '<i class="fa fa-trash"></i>'.html_safe
    end
  end
end
