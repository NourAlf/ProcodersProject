class AppLink {
  // local Address
  static String reg ="127.0.0";
  static String  baseUrl = 'https://';



Map<String , String> getHeader (){

  return {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}


}