class ContactMailer < ApplicationMailer
	default from: 'ventas@joyeriadiamanteazul.xyz'

  def cotization_admin(cotization, product)
    @cotization = cotization
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de cotización')
  end	

  def shopy_client(product)
    @product = product
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de compra')
  end
end
