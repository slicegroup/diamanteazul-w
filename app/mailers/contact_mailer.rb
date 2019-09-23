class ContactMailer < ApplicationMailer
	default from: 'ventas@joyeriadiamanteazul.xyz'

  def cotization_admin(cotization)
    @cotization = cotization
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de cotización')
  end

  def shopy_client(cotization)
    @cotization = cotization
    mail(from: 'ventas@joyeriadiamanteazul.xyz', to: 'ventas@joyeriadiamanteazul.xyz', subject: 'Solicitud de compra')
  end
end
