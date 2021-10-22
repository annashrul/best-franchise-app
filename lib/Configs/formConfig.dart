class FormConfig{
  static int minLengthPhone=10;
  static int maxLengthPhone=15;


  static validatePhoneNumber(countryCode,phone){
    if(phone[0]=="0"){
      String replaceIndex0 = phone[0].replaceAll("0","");
      phone = replaceIndex0+phone.substring(1,phone.length);
    }
    return countryCode+phone;

  }

}