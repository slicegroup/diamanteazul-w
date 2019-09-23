class ContactMailer < ApplicationMailer
	default from: 'ventas@joyeriadiamanteazul.xyz'

  def cotization_admin(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: @cotization.email, subject: 'Gracias por tu cotización')
  end	

  def shopy_client(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: @cotization.email, subject: 'Gracias por tu compra')
  end
end
