class ApplicationContract < Dry::Validation::Contract

  config.messages.backend = :i18n

  EMAIL_REGEXP    = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  PASSWORD_REGEXP = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/
  BUSINESS_ABN_REGEXP = /\A\d+\z/s

  register_macro(:email_format) do
    key.failure(I18n.t('errors.email.invalid_format')) unless EMAIL_REGEXP.match?(value)
  end

  register_macro(:password_format) do
    unless PASSWORD_REGEXP.match?(value)
      key.failure(I18n.t('errors.password.validation'))
    end
  end

  register_macro(:record_exists?) do |macro:|
    model = macro.args[0]
    key.failure('not exist') unless model.exists?(value)
  end

  register_macro(:business_abn_format) do
    key.failure(I18n.t('errors.business_abn.invalid_format')) unless BUSINESS_ABN_REGEXP.match?(value)
  end

end
