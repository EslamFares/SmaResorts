String dayConvert(String day) {
  switch (day) {
    case "Monday":
      return "الاثنين";
    case "Tuesday":
      return "الثلاثاء";
    case "Wednesday":
      return "الاربعاء";
    case "Thursday":
      return "الخميس";
    case "Friday":
      return "الجمعة";
    case "Saturday":
      return "السبت";
    case "Sunday":
      return "الاحد";
    default:
      return "الجمعة";
  }
}
