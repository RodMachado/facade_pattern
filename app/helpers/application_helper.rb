module ApplicationHelper

  def link_to_new(presenter)
    link_to(
      presenter.new_title,
      presenter.new_path
    ) if presenter.creatable?
  end

  def link_to_show(presenter)
    link_to(
      presenter.show_title,
      presenter.show_path
    ) if presenter.showable?
  end

  def link_to_edit(presenter)
    link_to(
      presenter.edit_title,
      presenter.edit_path
    ) if presenter.editable?
  end

  def link_to_destroy(presenter)
    link_to(
      presenter.destroy_title,
      presenter.destroy_path,
      method: :delete,
      data: { confirm: presenter.destroy_msg }
    ) if presenter.destroyable?
  end

end
