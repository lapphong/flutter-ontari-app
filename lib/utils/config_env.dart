enum Flavor {
  staging,
  production,
  mock,
}

class ConfigEnv {
  static Flavor? appFlavor;

  static String getDomainAPI() {
    switch (appFlavor) {
      case Flavor.staging:
        return 'https://api.dofhunt.200lab.io';
      case Flavor.mock:
        return '';
      default:
        return 'https://api.dofhunt.200lab.io';
    }
  }

  static String getWebDomain() {
    switch (appFlavor) {
      case Flavor.staging:
        return 'https://dofhunt.200lab.io';
      default:
        return 'https://dofhunt.200lab.io';
    }
  }
}
