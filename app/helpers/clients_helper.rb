module ClientsHelper

  def link_to_new(presenter)
    link_to(
      'New Client',
      new_client_path
    )
  end

  def link_to_show(client)
    link_to(
      'Show',
      client
    )
  end

  def link_to_edit(client)
    link_to(
      'Edit',
      edit_client_path(client)
    )
  end

  def link_to_destroy(client)
    link_to(
      'Destroy',
      client,
      method: :delete,
      data: { confirm: 'Are you sure?' }
    )
  end

end
