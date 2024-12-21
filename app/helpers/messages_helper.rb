module MessagesHelper
  def justify_and_color_from(message, owned)
    if owned
      %w[justify-end bg-green-600 ]
    else
      %w[justify-start bg-blue-600 ]
    end
  end

  def margin_by_message(message, same_user)
    same_user ? "mt-0" : "mt-2"
  end
end
