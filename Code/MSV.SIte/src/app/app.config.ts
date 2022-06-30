export const APIConfig = {
  resources: {
    login: {
      default: '/token'
    },
    company: {
      default: '/empresa'
    },
    branch: {
      default: '/filial'
    },
    entity: {
      default: '/entidade'
    },
    familyProduct: {
      default: '/familiaproduto'
    },
    subclientType: {
      default: '/tiposubcliente'
    },
    subclientContract: {
      default: '/contratosubcliente'
    },
    servicepoint: {
      default: '/pontoatendimento'
    },
    servicoscontrato: {
      default: '/servicoscontrato/servicoscontrato'
    },
    pontoatendimentoorigem: {
      default: '/PontoAtendimentoOrigem/PontoAtendimentoOrigem'
    },
    precoservicocontrato: {
      default: '/PrecoServicoContrato/PrecoServicoContrato'
    },
    parametrocampo: {
      default: '/ParametroCampo'
    },
    precoFrequencia: {
      default: '/PrecoPaFrequencia'
    },
    operationalFlow: {
      default: '/FluxoOperacional'
    }
  },
  auth: {
    client_id: 'SAM_Integracao',
    client_secret: 'G78qaZU9DXN8mCDsWsTDKzWuf6rABV',
    tokenKey: 'SAM.Authorize',
    refreshTokenKey: 'SAM.RefreshAuthorize',
    currentUserKey: 'SAM.CurrentUser',
    tokenExpiration: 'SAM.AuthorizeExpiration'
  },
  header: {
    contentType: {
      json: 'application/json',
      x_www_form_urlencoded: 'application/x-www-form-urlencoded',
      formData: 'form-data'
    },
    responseType: {
      blob: 'application/octet-stream'
    }
  },
};
