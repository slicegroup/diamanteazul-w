class ContactMailer < ApplicationMailer
	default from: 'ventas@joyeriadiamanteazul.xyz'

  def cotization_client(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: @cotization.email, subject: 'Gracias por tu cotización')
  end	

  def cotization_admin(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: @cotization.email, to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de cotización')
  end 

  def shopy_client(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: @cotization.email, subject: 'Gracias por tu compra')
  end

  def shopy_admin(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: @cotization.email, to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de compra')
  end
end
