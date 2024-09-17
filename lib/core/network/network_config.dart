import 'dart:io';

 NetworkConfig ()async{
  try
  {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }
  catch(e)
  {
    return false;
  }

}