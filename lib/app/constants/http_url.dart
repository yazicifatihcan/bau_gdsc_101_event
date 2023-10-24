class HttpUrl {

  static String baseUrl ='rickandmortyapi.com';


  static String allCharactersEndpoint = '/api/character';

  static String characterDetailEndpoint  (int id) => 'api/character/$id';


}