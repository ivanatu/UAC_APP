class Apis {
  static const String url =
      "http://194.163.172.6:1337"; //"http://207.180.224.165:1337";
  static String progress_95 = "${url}/api/progress-on-95-95-95s";
  static String messages = "${url}/api/messages?populate=*";
  static String regions = "${url}/api/regions?populate=*";
  static String cases = "${url}/api/new-hiv-infections";
  static String newz = "${url}/api/newzs?populate=*";
  static String faqs = "${url}/api/faqzs";
  static String aids_info = "${url}/api/aids-infos?populate=*";
  static String videoUpdates = "${url}/api/video-updates";
  static String myths = "${url}/api/myths?populate=*";
  static String precautions = "${url}/api/precautions?populate=*";
  static String stories = "${url}/api/stories?populate=*";
  static String nationalPrevalence = "${url}/api/national-hiv-prevalances";

  // HIV burden
  static String plhivDisaggregated =
      "${url}/api/number-of-plhiv-disaggregated-by-age-group-and-sexes?populate=*";
  // Prevalence
  static String regionalPrevalence =
      "${url}/api/regional-hiv-prevalance?populate=*";
  static String newInfectionsBySubRegion =
      "${url}/api/new-hiv-prevalance-infectionz?populate=*";
}
