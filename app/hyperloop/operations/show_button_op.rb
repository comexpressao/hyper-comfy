# /app/hyperloop/operations/show_button_op.rb
class ShowButtonOp < Hyperloop::Operation
  param :ev

  step { MyStore.toggle_field }
  step { Helloworld.toggle_logo(params.ev) }
end
