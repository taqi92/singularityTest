enum Environment {
  STAGING,
  PRODUCTION,
}

const Environment activeProfile = Environment.PRODUCTION;

String getBaseUrl() {
  switch (activeProfile) {
    case Environment.STAGING:
      return "http://128.199.215.102:4040";

    case Environment.PRODUCTION:
      return "http://128.199.215.102:4040";
  }
}


enum HttpMethod {
  GET,
  POST,
  PUT,
}

