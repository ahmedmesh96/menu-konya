import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu/controller/language_change_controller.dart';
import 'package:menu/generated/l10n.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatefulWidget {
  // final String rightLift;
  // final String filsonProBold;
  // final String filsonProRegular;
  // final String brandoRegular;
  // final String brandoBold;

  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

enum Language { english, arabic, turkish, kurdish }

class _MenuScreenState extends State<MenuScreen> {
//   bool isArabic() {
//   return Intl.getCurrentLocale() == 'ar';
// }
  late bool isArabic = false;
  late bool isTurkish = false;
  late String rightLeft = "en";
  final filsonProBold = "FilsonProBold";
  final filsonProRegular = "FilsonProRegular";
  final brandoRegular = "Brando-Regular";
  final brandoBold = "Brando-Bold";

  bool isSelected = false;
  bool isSelectedColdAppetizers = true;
  bool isSelectedMorningBreakfast = false;
  bool isSelectedSalad = false;
  bool isSelectedHotAppetizers = false;
  bool isSelectedSoups = false;
  bool isSelectedTurkishPide = false;
  bool isSelectedOurSignature = false;
  bool isSelectedDurum = false;
  bool isSelecteTurkishGrill = false;
  bool isSelecteSideDishedes = false;
  bool isSelecteDietFood = false;
  bool isSelecteHotBeverages = false;
  bool isSelecteColdBeverages = false;
  bool isSelecteDessert = false;
  bool isSelecteShisha = false;
  bool isSelecteBaklawa = false;
  bool isSelecteHotTea = false;
  bool isSelecteHotCoffee = false;
  bool isSelecteCocktails = false;
  bool isSelecteSerbet = false;
  bool isSelecteFreshJuice = false;
  bool isSelecteIcedTeaAndCoffee = false;
  bool isSelecteMevlanaShak = false;
  bool isSelecteSoftDrink = false;
  bool isSelecteClassicShisha = false;
  bool isSelectePremiumShisha = false;
  bool isSelecteNaturalShisha = false;

  Future<void> refesh() {
    return Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      setState(() {});
    });
  }

  late String mainLabe = S.of(context).cold_appetizers;

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    final heightAppbar = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(138, 0, 47, 1),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color.fromRGBO(228, 198, 144, 1)),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Image.asset(
            "assets/img/konya_logo.png",
            height: 40,
          ),
        ),
        actions: [
            Consumer<LanguageChangeController>(
                builder: (context, provider, child) {
              return PopupMenuButton(
                  iconColor: Colors.white,
                  icon: const Icon(
                    Icons.language_sharp,
                    color: Color.fromRGBO(228, 198, 144, 1),
                  ),
                  onSelected: (Language item) {
                    if (Language.english.name == item.name) {
                      provider.changeLanguage(const Locale("en"));
                      setState(() {
                        
                      });
                      setState(() {
                        isArabic = false;
                        isTurkish = false;
                        rightLeft = "en";
                      });
                    } else if (Language.arabic.name == item.name) {
                      provider.changeLanguage(const Locale("ar"));
                      setState(() {
                        isArabic = true;
                        isTurkish = false;
                        rightLeft = "ar";

                        
                      });
                    } else  if (Language.turkish.name == item.name) {
                      provider.changeLanguage(const Locale("tr"));
                      setState(() {
                        isArabic = false;
                        isTurkish = true;
                        rightLeft = "tr";

                        
                      });
                    } else {
                      provider.changeLanguage(const Locale("fa"));
                      setState(() {
                        isArabic = true;
                        isTurkish = false;
                        rightLeft = "fa";

                        
                      });

                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Language>>[
                        PopupMenuItem(
                            value: Language.english,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/languages_icons/unitedstat.png",
                                    height: 20,
                                  ),
                                  const Text(
                                    "English",
                                  ),
                                ],
                              ),
                            )),
                        PopupMenuItem(
                            value: Language.arabic,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/languages_icons/iraq.png",
                                    height: 20,
                                  ),
                                  const Text("العربية"),
                                ],
                              ),
                            )),
                        PopupMenuItem(
                            value: Language.turkish,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/languages_icons/turkey.png",
                                    height: 20,
                                  ),
                                  const Text("Türkçe"),
                                ],
                              ),
                            )),

                            PopupMenuItem(
                            value: Language.kurdish,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage("assets/languages_icons/kurdish.png", ), fit: BoxFit.cover)),
                                    
                                  ),
                                  const Text("کوردی"),
                                ],
                              ),
                            ))
                      ]);
            }),
          ],
         backgroundColor: const Color.fromRGBO(21, 8, 88, 1),
      ),
      body: Container(
        color: Colors.white,
        width: widthScreen,
        height: heightScreen - heightAppbar,
        child:

            //--********Web RESPONSIVE**********--//
            widthScreen >= 450
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                                color: const Color.fromRGBO(186, 150, 92, 1))),
                        height: heightScreen - 50,
                        width: 130,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //--------------------------------//
                              MainLsitButton(
                                iconPath: "assets/img/cold_appetizers.png",
                                label: S.of(context).cold_appetizers,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).cold_appetizers;
                                    isSelectedColdAppetizers = true;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedColdAppetizers ? 3 : 2,
                                colors: isSelectedColdAppetizers
                                    ? const Color.fromRGBO(138, 0, 47, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedColdAppetizers
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedColdAppetizers
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/morning_breakfast.png",
                                label: S.of(context).morning_breakfast,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).morning_breakfast;
                                    isSelectedMorningBreakfast = true;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedMorningBreakfast ? 3 : 2,
                                colors: isSelectedMorningBreakfast
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedMorningBreakfast
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedMorningBreakfast
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/salad.png",
                                label: S.of(context).salads,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).salads;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = true;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedSalad ? 3 : 2,
                                colors: isSelectedSalad
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedSalad
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedSalad
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/hot_appetizers.png",
                                label: S.of(context).hot_apetizers,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).hot_apetizers;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = true;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedHotAppetizers ? 3 : 2,
                                colors: isSelectedHotAppetizers
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedHotAppetizers
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedHotAppetizers
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/soup.png",
                                label: S.of(context).soups,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).soups;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = true;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedSoups ? 3 : 2,
                                colors: isSelectedSoups
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedSoups
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedSoups
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/turkish_pide.png",
                                label: S.of(context).turkish_pide,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).turkish_pide;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = true;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedTurkishPide ? 3 : 2,
                                colors: isSelectedTurkishPide
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedTurkishPide
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedTurkishPide
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/our_signutare.png",
                                label: S.of(context).our_signature,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).our_signature;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = true;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedOurSignature ? 3 : 2,
                                colors: isSelectedOurSignature
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedOurSignature
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedOurSignature
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/durum.png",
                                label: S.of(context).durum,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).durum;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = true;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelectedDurum ? 3 : 2,
                                colors: isSelectedDurum
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelectedDurum
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelectedDurum
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/turkish_grill.png",
                                label: S.of(context).turkish_grill,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).turkish_grill;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = true;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteTurkishGrill ? 3 : 2,
                                colors: isSelecteTurkishGrill
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteTurkishGrill
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteTurkishGrill
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/side_dishes.png",
                                label: S.of(context).side_dishes,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).side_dishes;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = true;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteSideDishedes ? 3 : 2,
                                colors: isSelecteSideDishedes
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteSideDishedes
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteSideDishedes
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/diet_food.png",
                                label: S.of(context).diet_food,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).diet_food;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = true;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteDietFood ? 3 : 2,
                                colors: isSelecteDietFood
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteDietFood
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteDietFood
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),

                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/hot_berevages.png",
                                label: S.of(context).hot_beverages,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).hot_tea;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = true;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = true;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteHotBeverages ? 3 : 2,
                                colors: isSelecteHotBeverages
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteHotBeverages
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteHotBeverages
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//
                              //-----------------------hot Beverages  Menu----------------//
                              isSelecteHotBeverages
                                  ? Container(
                                      color: Colors.white,
                                      // margin: EdgeInsets.only(left: 0,right: 0),
                                      //  width: widthScreen >=450 ? 80 : 60,
                                      // width: 115,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/hot_tea.png",
                                              label: S.of(context).hot_tea,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).hot_tea;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = true;
                                                  isSelecteColdBeverages =
                                                      false;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = true;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteHotTea ? 3 : 2,
                                              colors: isSelecteHotTea
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteHotTea
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight: isSelecteHotTea
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                            ),

                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/hot_coffee.png",
                                              label: S.of(context).hot_coffee,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).hot_coffee;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = true;
                                                  isSelecteColdBeverages =
                                                      false;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = true;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteHotCoffee ? 3 : 2,
                                              colors: isSelecteHotCoffee
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteHotCoffee
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight: isSelecteHotCoffee
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),

                              MainLsitButton(
                                iconPath: "assets/img/cold_berevages.png",
                                label: S.of(context).cold_beverages,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).cocktails;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = true;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = true;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteColdBeverages ? 3 : 2,
                                colors: isSelecteColdBeverages
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteColdBeverages
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteColdBeverages
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              //-----------------------cold Beverages Menu----------------//

                              //--------------------------------//

                              isSelecteColdBeverages
                                  ? Container(
                                      color: Colors.white,
                                      // width: widthScreen * 0.2,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/cocktails.png",
                                              label: S.of(context).cocktails,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).cocktails;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = true;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteCocktails ? 3 : 2,
                                              colors: isSelecteCocktails
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteCocktails
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight: isSelecteCocktails
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                            ),
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath: "assets/img/serbat.png",
                                              label: S.of(context).serbet,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).serbet;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = true;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteSerbet ? 3 : 2,
                                              colors: isSelecteSerbet
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteSerbet
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight: isSelecteSerbet
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                            ),
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/fresh_juice.png",
                                              label: S.of(context).fresh_juice,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).fresh_juice;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = true;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteFreshJuice ? 3 : 2,
                                              colors: isSelecteFreshJuice
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteFreshJuice
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelecteFreshJuice
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/iced_tea_and_coffee.png",
                                              label: S
                                                  .of(context)
                                                  .iced_tea_and_coffee,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe = S
                                                      .of(context)
                                                      .iced_tea_and_coffee;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      true;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteIcedTeaAndCoffee
                                                  ? 3
                                                  : 2,
                                              colors: isSelecteIcedTeaAndCoffee
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color:
                                                      isSelecteIcedTeaAndCoffee
                                                          ? const Color
                                                              .fromRGBO(
                                                              138, 0, 47, 1)
                                                          : const Color
                                                              .fromRGBO(
                                                              186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelecteIcedTeaAndCoffee
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),

                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/mevlana_shak.png",
                                              label: S.of(context).mevlana_shak,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe = S
                                                      .of(context)
                                                      .mevlana_shak;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = true;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size:
                                                  isSelecteMevlanaShak ? 3 : 2,
                                              colors: isSelecteMevlanaShak
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteMevlanaShak
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelecteMevlanaShak
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/soft_drink.png",
                                              label: S.of(context).soft_drink,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe =
                                                      S.of(context).soft_drink;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages = true;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = false;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = true;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteSoftDrink ? 3 : 2,
                                              colors: isSelecteSoftDrink
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteSoftDrink
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight: isSelecteSoftDrink
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              //---------------------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/dessert.png",
                                label: S.of(context).dessert,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).dessert;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = true;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteDessert ? 3 : 2,
                                colors: isSelecteDessert
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteDessert
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteDessert
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/shisha.png",
                                label: S.of(context).shisha,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).classic_shisha;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = true;
                                    isSelecteBaklawa = false;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = true;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteShisha ? 3 : 2,
                                colors: isSelecteShisha
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteShisha
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteShisha
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                              //--------------------------------//
                              isSelecteShisha
                                  ? Container(
                                      color: Colors.white,
                                      // width: widthScreen * 0.2,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/clasic_shisha.png",
                                              label:
                                                  S.of(context).classic_shisha,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe = S
                                                      .of(context)
                                                      .classic_shisha;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages =
                                                      false;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = true;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha = true;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelecteClassicShisha
                                                  ? 3
                                                  : 2,
                                              colors: isSelecteClassicShisha
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteClassicShisha
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelecteClassicShisha
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),

                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/premium_shisha.png",
                                              label:
                                                  S.of(context).premium_shisha,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe = S
                                                      .of(context)
                                                      .premium_shisha;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages =
                                                      false;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = true;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha = true;
                                                  isSelecteNaturalShisha =
                                                      false;
                                                });
                                              },
                                              size: isSelectePremiumShisha
                                                  ? 3
                                                  : 2,
                                              colors: isSelectePremiumShisha
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelectePremiumShisha
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelectePremiumShisha
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),

                                            //--------------------------------//

                                            SubLsitButton(
                                              iconPath:
                                                  "assets/img/natural_shisha.png",
                                              label:
                                                  S.of(context).natural_shisha,
                                              onTap: () {
                                                setState(() {
                                                  mainLabe = S
                                                      .of(context)
                                                      .natural_shisha;
                                                  isSelectedMorningBreakfast =
                                                      false;
                                                  isSelectedColdAppetizers =
                                                      false;
                                                  isSelectedSalad = false;
                                                  isSelectedHotAppetizers =
                                                      false;
                                                  isSelectedSoups = false;
                                                  isSelectedTurkishPide = false;
                                                  isSelectedOurSignature =
                                                      false;
                                                  isSelectedDurum = false;
                                                  isSelecteTurkishGrill = false;
                                                  isSelecteSideDishedes = false;
                                                  isSelecteDietFood = false;
                                                  isSelecteHotBeverages = false;
                                                  isSelecteColdBeverages =
                                                      false;
                                                  isSelecteDessert = false;
                                                  isSelecteShisha = true;
                                                  isSelecteBaklawa = false;
                                                  isSelecteHotTea = false;
                                                  isSelecteHotCoffee = false;
                                                  isSelecteCocktails = false;
                                                  isSelecteSerbet = false;
                                                  isSelecteFreshJuice = false;
                                                  isSelecteIcedTeaAndCoffee =
                                                      false;
                                                  isSelecteMevlanaShak = false;
                                                  isSelecteSoftDrink = false;
                                                  isSelecteClassicShisha =
                                                      false;
                                                  isSelectePremiumShisha =
                                                      false;
                                                  isSelecteNaturalShisha = true;
                                                });
                                              },
                                              size: isSelecteNaturalShisha
                                                  ? 3
                                                  : 2,
                                              colors: isSelecteNaturalShisha
                                                  ? const Color.fromRGBO(
                                                      138, 47, 0, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              style: TextStyle(
                                                  color: isSelecteNaturalShisha
                                                      ? const Color.fromRGBO(
                                                          138, 0, 47, 1)
                                                      : const Color.fromRGBO(
                                                          186, 150, 92, 1),
                                                  fontWeight:
                                                      isSelecteNaturalShisha
                                                          ? FontWeight.bold
                                                          : FontWeight.w200),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              //---------------------------------------------//

                              MainLsitButton(
                                iconPath: "assets/img/baklawa.png",
                                label: S.of(context).Baklawa,
                                onTap: () {
                                  setState(() {
                                    mainLabe = S.of(context).Baklawa;
                                    isSelectedMorningBreakfast = false;
                                    isSelectedColdAppetizers = false;
                                    isSelectedSalad = false;
                                    isSelectedHotAppetizers = false;
                                    isSelectedSoups = false;
                                    isSelectedTurkishPide = false;
                                    isSelectedOurSignature = false;
                                    isSelectedDurum = false;
                                    isSelecteTurkishGrill = false;
                                    isSelecteSideDishedes = false;
                                    isSelecteDietFood = false;
                                    isSelecteHotBeverages = false;
                                    isSelecteColdBeverages = false;
                                    isSelecteDessert = false;
                                    isSelecteShisha = false;
                                    isSelecteBaklawa = true;
                                    isSelecteHotTea = false;
                                    isSelecteHotCoffee = false;
                                    isSelecteCocktails = false;
                                    isSelecteSerbet = false;
                                    isSelecteFreshJuice = false;
                                    isSelecteIcedTeaAndCoffee = false;
                                    isSelecteMevlanaShak = false;
                                    isSelecteSoftDrink = false;
                                    isSelecteClassicShisha = false;
                                    isSelectePremiumShisha = false;
                                    isSelecteNaturalShisha = false;
                                  });
                                },
                                size: isSelecteBaklawa ? 3 : 2,
                                colors: isSelecteBaklawa
                                    ? const Color.fromRGBO(138, 47, 0, 1)
                                    : const Color.fromRGBO(186, 150, 92, 1),
                                style: TextStyle(
                                    color: isSelecteBaklawa
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    fontWeight: isSelecteBaklawa
                                        ? FontWeight.bold
                                        : FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //------------------test***********************//

                      //------------------test***********************//

                      //------------------ Menu Previwe ---------------------//

                      Expanded(
                          child: Container(
                              // width: widthScreen * 0.8,
                              // height: heightScreen * 0.6,
                              // color: const  Color.fromRGBO(138, 0, 47, 1),
                              color: const Color.fromRGBO(7, 51, 72, 1),
                              child: Column(
                                children: [
                                  //-------------------- Center Gatogary-----//
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          mainLabe,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  186, 150, 92, 1)),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Color.fromRGBO(186, 150, 92, 1),
                                      )
                                    ],
                                  ),

                                  //-------------------- Cold Appetizers -----//
                                  isSelectedColdAppetizers
                                      ? StreamViewMenu(
                                          collectionName: 'Cold Appetizers',
                                          isArabic: isArabic,
                                          isTurkish: isTurkish,
                                        )
                                      : isSelectedMorningBreakfast
                                          ? StreamViewMenu(
                                              collectionName:
                                                  'Morning Breakfast',
                                              isArabic: isArabic,
                                              isTurkish: isTurkish,
                                            )
                                          : isSelectedSalad
                                              ? StreamViewMenu(
                                                  collectionName: "Salads",
                                                  isArabic: isArabic,
                                                  isTurkish: isTurkish,
                                                )
                                              : isSelectedHotAppetizers
                                                  ? StreamViewMenu(
                                                      collectionName:
                                                          "Hot Appetizers",
                                                      isArabic: isArabic,
                                                      isTurkish: isTurkish,
                                                    )
                                                  : isSelectedSoups
                                                      ? StreamViewMenu(
                                                          collectionName:
                                                              "Soups",
                                                          isArabic: isArabic,
                                                          isTurkish: isTurkish,
                                                        )
                                                      : isSelectedTurkishPide
                                                          ? StreamViewMenu(
                                                              collectionName:
                                                                  "Turkish Pide",
                                                              isArabic:
                                                                  isArabic,
                                                              isTurkish:
                                                                  isTurkish,
                                                            )
                                                          : isSelectedOurSignature
                                                              ? StreamViewMenu(
                                                                  collectionName:
                                                                      "Our Signature",
                                                                  isArabic:
                                                                      isArabic,
                                                                  isTurkish:
                                                                      isTurkish,
                                                                )
                                                              : isSelectedDurum
                                                                  ? StreamViewMenu(
                                                                      collectionName:
                                                                          "Durum",
                                                                      isArabic:
                                                                          isArabic,
                                                                      isTurkish:
                                                                          isTurkish,
                                                                    )
                                                                  : isSelecteTurkishGrill
                                                                      ? StreamViewMenu(
                                                                          collectionName:
                                                                              "Turkish Grill",
                                                                          isArabic:
                                                                              isArabic,
                                                                          isTurkish:
                                                                              isTurkish,
                                                                        )
                                                                      : isSelecteSideDishedes
                                                                          ? StreamViewMenu(
                                                                              collectionName: "Side Dishes",
                                                                              isArabic: isArabic,
                                                                              isTurkish: isTurkish,
                                                                            )
                                                                          : isSelecteDietFood
                                                                              ? StreamViewMenu(
                                                                                  collectionName: "Diet Food",
                                                                                  isArabic: isArabic,
                                                                                  isTurkish: isTurkish,
                                                                                )
                                                                              : isSelecteHotTea
                                                                                  ? StreamViewMenu(
                                                                                      collectionName: 'Hot Tea',
                                                                                      isArabic: isArabic,
                                                                                      isTurkish: isTurkish,
                                                                                    )
                                                                                  : isSelecteHotCoffee
                                                                                      ? StreamViewMenu(
                                                                                          collectionName: "Hot Coffee",
                                                                                          isArabic: isArabic,
                                                                                          isTurkish: isTurkish,
                                                                                        )
                                                                                      : isSelecteCocktails
                                                                                          ? StreamViewMenu(
                                                                                              collectionName: "Cocktails",
                                                                                              isArabic: isArabic,
                                                                                              isTurkish: isTurkish,
                                                                                            )
                                                                                          : isSelecteSerbet
                                                                                              ? StreamViewMenu(
                                                                                                  collectionName: "Serbet",
                                                                                                  isArabic: isArabic,
                                                                                                  isTurkish: isTurkish,
                                                                                                )
                                                                                              : isSelecteFreshJuice
                                                                                                  ? StreamViewMenu(
                                                                                                      collectionName: "Fresh Juice",
                                                                                                      isArabic: isArabic,
                                                                                                      isTurkish: isTurkish,
                                                                                                    )
                                                                                                  : isSelecteIcedTeaAndCoffee
                                                                                                      ? StreamViewMenu(
                                                                                                          collectionName: "Iced Tea And Coffee",
                                                                                                          isArabic: isArabic,
                                                                                                          isTurkish: isTurkish,
                                                                                                        )
                                                                                                      : isSelecteMevlanaShak
                                                                                                          ? StreamViewMenu(
                                                                                                              collectionName: "Mevlana Shak",
                                                                                                              isArabic: isArabic,
                                                                                                              isTurkish: isTurkish,
                                                                                                            )
                                                                                                          : isSelecteSoftDrink
                                                                                                              ? StreamViewMenu(
                                                                                                                  collectionName: "Soft Drink",
                                                                                                                  isArabic: isArabic,
                                                                                                                  isTurkish: isTurkish,
                                                                                                                )
                                                                                                              : isSelecteDessert
                                                                                                                  ? StreamViewMenu(
                                                                                                                      collectionName: "Dessert",
                                                                                                                      isArabic: isArabic,
                                                                                                                      isTurkish: isTurkish,
                                                                                                                    )
                                                                                                                  : isSelecteClassicShisha
                                                                                                                      ? StreamViewMenu(
                                                                                                                          collectionName: 'Classic Shisha',
                                                                                                                          isArabic: isArabic,
                                                                                                                          isTurkish: isTurkish,
                                                                                                                        )
                                                                                                                      : isSelectePremiumShisha
                                                                                                                          ? StreamViewMenu(
                                                                                                                              collectionName: "Premium Shisha",
                                                                                                                              isArabic: isArabic,
                                                                                                                              isTurkish: isTurkish,
                                                                                                                            )
                                                                                                                          : isSelecteNaturalShisha
                                                                                                                              ? StreamViewMenu(
                                                                                                                                  collectionName: "Natural Shisha",
                                                                                                                                  isArabic: isArabic,
                                                                                                                                  isTurkish: isTurkish,
                                                                                                                                )
                                                                                                                              : isSelecteBaklawa
                                                                                                                                  ? StreamViewMenu(
                                                                                                                                      collectionName: 'Baklawa',
                                                                                                                                      isArabic: isArabic,
                                                                                                                                      isTurkish: isTurkish,
                                                                                                                                    )
                                                                                                                                  : const SizedBox()
                                ],
                              )))
                    ],
                  )

                //--********PHONE RESPONSIVE**********--//

                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                                color: const Color.fromRGBO(186, 150, 92, 1))),

                        // height: 130 ,
                        width: widthScreen,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //--------------------------------//
                                  MainLsitButton(
                                    iconPath: "assets/img/cold_appetizers.png",
                                    label: S.of(context).cold_appetizers,
                                    onTap: () {
                                      setState(() {
                                        mainLabe =
                                            S.of(context).cold_appetizers;
                                        isSelectedColdAppetizers = true;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedColdAppetizers ? 3 : 2,
                                    colors: isSelectedColdAppetizers
                                        ? const Color.fromRGBO(138, 0, 47, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedColdAppetizers
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedColdAppetizers
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath:
                                        "assets/img/morning_breakfast.png",
                                    label: S.of(context).morning_breakfast,
                                    onTap: () {
                                      setState(() {
                                        mainLabe =
                                            S.of(context).morning_breakfast;
                                        isSelectedMorningBreakfast = true;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedMorningBreakfast ? 3 : 2,
                                    colors: isSelectedMorningBreakfast
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedMorningBreakfast
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedMorningBreakfast
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/salad.png",
                                    label: S.of(context).salads,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).salads;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = true;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedSalad ? 3 : 2,
                                    colors: isSelectedSalad
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedSalad
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedSalad
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/hot_appetizers.png",
                                    label: S.of(context).hot_apetizers,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).hot_apetizers;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = true;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedHotAppetizers ? 3 : 2,
                                    colors: isSelectedHotAppetizers
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedHotAppetizers
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedHotAppetizers
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/soup.png",
                                    label: S.of(context).soups,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).soups;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = true;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedSoups ? 3 : 2,
                                    colors: isSelectedSoups
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedSoups
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedSoups
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/turkish_pide.png",
                                    label: S.of(context).turkish_pide,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).turkish_pide;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = true;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedTurkishPide ? 3 : 2,
                                    colors: isSelectedTurkishPide
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedTurkishPide
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedTurkishPide
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/our_signutare.png",
                                    label: S.of(context).our_signature,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).our_signature;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = true;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedOurSignature ? 3 : 2,
                                    colors: isSelectedOurSignature
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedOurSignature
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedOurSignature
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/durum.png",
                                    label: S.of(context).durum,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).durum;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = true;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelectedDurum ? 3 : 2,
                                    colors: isSelectedDurum
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelectedDurum
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelectedDurum
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/turkish_grill.png",
                                    label: S.of(context).turkish_grill,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).turkish_grill;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = true;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteTurkishGrill ? 3 : 2,
                                    colors: isSelecteTurkishGrill
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteTurkishGrill
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteTurkishGrill
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/side_dishes.png",
                                    label: S.of(context).side_dishes,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).side_dishes;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = true;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteSideDishedes ? 3 : 2,
                                    colors: isSelecteSideDishedes
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteSideDishedes
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteSideDishedes
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/diet_food.png",
                                    label: S.of(context).diet_food,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).diet_food;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = true;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteDietFood ? 3 : 2,
                                    colors: isSelecteDietFood
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteDietFood
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteDietFood
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/hot_berevages.png",
                                    label: S.of(context).hot_beverages,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).hot_tea;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = true;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = true;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteHotBeverages ? 3 : 2,
                                    colors: isSelecteHotBeverages
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteHotBeverages
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteHotBeverages
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/cold_berevages.png",
                                    label: S.of(context).cold_beverages,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).cocktails;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = true;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = true;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteColdBeverages ? 3 : 2,
                                    colors: isSelecteColdBeverages
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteColdBeverages
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteColdBeverages
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  //-----------------------cold Beverages Menu----------------//

                                  //---------------------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/dessert.png",
                                    label: S.of(context).dessert,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).dessert;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = true;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteDessert ? 3 : 2,
                                    colors: isSelecteDessert
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteDessert
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteDessert
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                  //--------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/shisha.png",
                                    label: S.of(context).shisha,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).classic_shisha;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = true;
                                        isSelecteBaklawa = false;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = true;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteShisha ? 3 : 2,
                                    colors: isSelecteShisha
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteShisha
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteShisha
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),

                                  //---------------------------------------------//

                                  MainLsitButton(
                                    iconPath: "assets/img/baklawa.png",
                                    label: S.of(context).Baklawa,
                                    onTap: () {
                                      setState(() {
                                        mainLabe = S.of(context).Baklawa;
                                        isSelectedMorningBreakfast = false;
                                        isSelectedColdAppetizers = false;
                                        isSelectedSalad = false;
                                        isSelectedHotAppetizers = false;
                                        isSelectedSoups = false;
                                        isSelectedTurkishPide = false;
                                        isSelectedOurSignature = false;
                                        isSelectedDurum = false;
                                        isSelecteTurkishGrill = false;
                                        isSelecteSideDishedes = false;
                                        isSelecteDietFood = false;
                                        isSelecteHotBeverages = false;
                                        isSelecteColdBeverages = false;
                                        isSelecteDessert = false;
                                        isSelecteShisha = false;
                                        isSelecteBaklawa = true;
                                        isSelecteHotTea = false;
                                        isSelecteHotCoffee = false;
                                        isSelecteCocktails = false;
                                        isSelecteSerbet = false;
                                        isSelecteFreshJuice = false;
                                        isSelecteIcedTeaAndCoffee = false;
                                        isSelecteMevlanaShak = false;
                                        isSelecteSoftDrink = false;
                                        isSelecteClassicShisha = false;
                                        isSelectePremiumShisha = false;
                                        isSelecteNaturalShisha = false;
                                      });
                                    },
                                    size: isSelecteBaklawa ? 3 : 2,
                                    colors: isSelecteBaklawa
                                        ? const Color.fromRGBO(138, 47, 0, 1)
                                        : const Color.fromRGBO(186, 150, 92, 1),
                                    style: TextStyle(
                                        color: isSelecteBaklawa
                                            ? const Color.fromRGBO(
                                                138, 0, 47, 1)
                                            : const Color.fromRGBO(
                                                186, 150, 92, 1),
                                        fontWeight: isSelecteBaklawa
                                            ? FontWeight.bold
                                            : FontWeight.w200),
                                  ),
                                ],
                              ),
                              //-----------------------hot Beverages  Menu----------------//
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen,
                        child: isSelecteHotBeverages
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //--------------------------------//

                                    SubLsitButton(
                                      iconPath: "assets/img/hot_tea.png",
                                      label: S.of(context).hot_tea,
                                      onTap: () {
                                        setState(() {
                                          mainLabe = S.of(context).hot_tea;
                                          isSelectedMorningBreakfast = false;
                                          isSelectedColdAppetizers = false;
                                          isSelectedSalad = false;
                                          isSelectedHotAppetizers = false;
                                          isSelectedSoups = false;
                                          isSelectedTurkishPide = false;
                                          isSelectedOurSignature = false;
                                          isSelectedDurum = false;
                                          isSelecteTurkishGrill = false;
                                          isSelecteSideDishedes = false;
                                          isSelecteDietFood = false;
                                          isSelecteHotBeverages = true;
                                          isSelecteColdBeverages = false;
                                          isSelecteDessert = false;
                                          isSelecteShisha = false;
                                          isSelecteBaklawa = false;
                                          isSelecteHotTea = true;
                                          isSelecteHotCoffee = false;
                                          isSelecteCocktails = false;
                                          isSelecteSerbet = false;
                                          isSelecteFreshJuice = false;
                                          isSelecteIcedTeaAndCoffee = false;
                                          isSelecteMevlanaShak = false;
                                          isSelecteSoftDrink = false;
                                          isSelecteClassicShisha = false;
                                          isSelectePremiumShisha = false;
                                          isSelecteNaturalShisha = false;
                                        });
                                      },
                                      size: isSelecteHotTea ? 3 : 2,
                                      colors: isSelecteHotTea
                                          ? const Color.fromRGBO(138, 47, 0, 1)
                                          : const Color.fromRGBO(
                                              186, 150, 92, 1),
                                      style: TextStyle(
                                          color: isSelecteHotTea
                                              ? const Color.fromRGBO(
                                                  138, 0, 47, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          fontWeight: isSelecteHotTea
                                              ? FontWeight.bold
                                              : FontWeight.w200),
                                    ),

                                    //--------------------------------//

                                    SubLsitButton(
                                      iconPath: "assets/img/hot_coffee.png",
                                      label: S.of(context).hot_coffee,
                                      onTap: () {
                                        setState(() {
                                          mainLabe = S.of(context).hot_coffee;
                                          isSelectedMorningBreakfast = false;
                                          isSelectedColdAppetizers = false;
                                          isSelectedSalad = false;
                                          isSelectedHotAppetizers = false;
                                          isSelectedSoups = false;
                                          isSelectedTurkishPide = false;
                                          isSelectedOurSignature = false;
                                          isSelectedDurum = false;
                                          isSelecteTurkishGrill = false;
                                          isSelecteSideDishedes = false;
                                          isSelecteDietFood = false;
                                          isSelecteHotBeverages = true;
                                          isSelecteColdBeverages = false;
                                          isSelecteDessert = false;
                                          isSelecteShisha = false;
                                          isSelecteBaklawa = false;
                                          isSelecteHotTea = false;
                                          isSelecteHotCoffee = true;
                                          isSelecteCocktails = false;
                                          isSelecteSerbet = false;
                                          isSelecteFreshJuice = false;
                                          isSelecteIcedTeaAndCoffee = false;
                                          isSelecteMevlanaShak = false;
                                          isSelecteSoftDrink = false;
                                          isSelecteClassicShisha = false;
                                          isSelectePremiumShisha = false;
                                          isSelecteNaturalShisha = false;
                                        });
                                      },
                                      size: isSelecteHotCoffee ? 3 : 2,
                                      colors: isSelecteHotCoffee
                                          ? const Color.fromRGBO(138, 47, 0, 1)
                                          : const Color.fromRGBO(
                                              186, 150, 92, 1),
                                      style: TextStyle(
                                          color: isSelecteHotCoffee
                                              ? const Color.fromRGBO(
                                                  138, 0, 47, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          fontWeight: isSelecteHotCoffee
                                              ? FontWeight.bold
                                              : FontWeight.w200),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ),

                      //-----------------cold Beverages --------------//
                      SizedBox(
                        width: widthScreen,
                        child: //--------------------------------//

                            isSelecteColdBeverages
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SubLsitButton(
                                          iconPath: "assets/img/cocktails.png",
                                          label: S.of(context).cocktails,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).cocktails;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = true;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteCocktails ? 3 : 2,
                                          colors: isSelecteCocktails
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteCocktails
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteCocktails
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath: "assets/img/serbat.png",
                                          label: S.of(context).serbet,
                                          onTap: () {
                                            setState(() {
                                              mainLabe = S.of(context).serbet;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = true;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteSerbet ? 3 : 2,
                                          colors: isSelecteSerbet
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteSerbet
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteSerbet
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/fresh_juice.png",
                                          label: S.of(context).fresh_juice,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).fresh_juice;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = true;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteFreshJuice ? 3 : 2,
                                          colors: isSelecteFreshJuice
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteFreshJuice
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteFreshJuice
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/iced_tea_and_coffee.png",
                                          label:
                                              S.of(context).iced_tea_and_coffee,
                                          onTap: () {
                                            setState(() {
                                              mainLabe = S
                                                  .of(context)
                                                  .iced_tea_and_coffee;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = true;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size:
                                              isSelecteIcedTeaAndCoffee ? 3 : 2,
                                          colors: isSelecteIcedTeaAndCoffee
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteIcedTeaAndCoffee
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight:
                                                  isSelecteIcedTeaAndCoffee
                                                      ? FontWeight.bold
                                                      : FontWeight.w200),
                                        ),

                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/mevlana_shak.png",
                                          label: S.of(context).mevlana_shak,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).mevlana_shak;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = true;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteMevlanaShak ? 3 : 2,
                                          colors: isSelecteMevlanaShak
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteMevlanaShak
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteMevlanaShak
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath: "assets/img/soft_drink.png",
                                          label: S.of(context).soft_drink,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).soft_drink;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = true;
                                              isSelecteDessert = false;
                                              isSelecteShisha = false;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = true;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteSoftDrink ? 3 : 2,
                                          colors: isSelecteSoftDrink
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteSoftDrink
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteSoftDrink
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                      ),

                      //------------Shisha----------//

                      SizedBox(
                        width: widthScreen,
                        child: //--------------------------------//
                            isSelecteShisha
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/clasic_shisha.png",
                                          label: S.of(context).classic_shisha,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).classic_shisha;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = false;
                                              isSelecteDessert = false;
                                              isSelecteShisha = true;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = true;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelecteClassicShisha ? 3 : 2,
                                          colors: isSelecteClassicShisha
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteClassicShisha
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteClassicShisha
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),

                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/premium_shisha.png",
                                          label: S.of(context).premium_shisha,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).premium_shisha;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = false;
                                              isSelecteDessert = false;
                                              isSelecteShisha = true;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = true;
                                              isSelecteNaturalShisha = false;
                                            });
                                          },
                                          size: isSelectePremiumShisha ? 3 : 2,
                                          colors: isSelectePremiumShisha
                                              ? const Color.fromRGBO(
                                                  138, 47, 0, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelectePremiumShisha
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelectePremiumShisha
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),

                                        //--------------------------------//

                                        SubLsitButton(
                                          iconPath:
                                              "assets/img/natural_shisha.png",
                                          label: S.of(context).natural_shisha,
                                          onTap: () {
                                            setState(() {
                                              mainLabe =
                                                  S.of(context).natural_shisha;
                                              isSelectedMorningBreakfast =
                                                  false;
                                              isSelectedColdAppetizers = false;
                                              isSelectedSalad = false;
                                              isSelectedHotAppetizers = false;
                                              isSelectedSoups = false;
                                              isSelectedTurkishPide = false;
                                              isSelectedOurSignature = false;
                                              isSelectedDurum = false;
                                              isSelecteTurkishGrill = false;
                                              isSelecteSideDishedes = false;
                                              isSelecteDietFood = false;
                                              isSelecteHotBeverages = false;
                                              isSelecteColdBeverages = false;
                                              isSelecteDessert = false;
                                              isSelecteShisha = true;
                                              isSelecteBaklawa = false;
                                              isSelecteHotTea = false;
                                              isSelecteHotCoffee = false;
                                              isSelecteCocktails = false;
                                              isSelecteSerbet = false;
                                              isSelecteFreshJuice = false;
                                              isSelecteIcedTeaAndCoffee = false;
                                              isSelecteMevlanaShak = false;
                                              isSelecteSoftDrink = false;
                                              isSelecteClassicShisha = false;
                                              isSelectePremiumShisha = false;
                                              isSelecteNaturalShisha = true;
                                            });
                                          },
                                          size: isSelecteNaturalShisha ? 3 : 2,
                                          colors: isSelecteNaturalShisha
                                              ? const Color.fromRGBO(
                                                  138, 0, 47, 1)
                                              : const Color.fromRGBO(
                                                  186, 150, 92, 1),
                                          style: TextStyle(
                                              color: isSelecteNaturalShisha
                                                  ? const Color.fromRGBO(
                                                      138, 0, 47, 1)
                                                  : const Color.fromRGBO(
                                                      186, 150, 92, 1),
                                              fontWeight: isSelecteNaturalShisha
                                                  ? FontWeight.bold
                                                  : FontWeight.w200),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                      ),

                      //------------------test***********************//

                      //------------------test***********************//

                      //------------------ Menu Previwe ---------------------//

                      Expanded(
                          child: Container(
                              // width: widthScreen * 0.8,
                              // height: heightScreen * 0.6,
                              // color: const  Color.fromRGBO(138, 0, 47, 1),
                              color: const Color.fromRGBO(7, 51, 72, 1),
                              child: Column(
                                children: [
                                  //-------------------- Center Gatogary-----//
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          mainLabe,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  186, 150, 92, 1)),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Color.fromRGBO(186, 150, 92, 1),
                                      )
                                    ],
                                  ),

                                  //-------------------- Cold Appetizers -----//
                                  isSelectedColdAppetizers
                                      ? StreamViewMenu(
                                          collectionName: 'Cold Appetizers',
                                          isArabic: isArabic,
                                          isTurkish: isTurkish,
                                        )
                                      : isSelectedMorningBreakfast
                                          ? StreamViewMenu(
                                              collectionName:
                                                  'Morning Breakfast',
                                              isArabic: isArabic,
                                              isTurkish: isTurkish,
                                            )
                                          : isSelectedSalad
                                              ? StreamViewMenu(
                                                  collectionName: "Salads",
                                                  isArabic: isArabic,
                                                  isTurkish: isTurkish,
                                                )
                                              : isSelectedHotAppetizers
                                                  ? StreamViewMenu(
                                                      collectionName:
                                                          "Hot Appetizers",
                                                      isArabic: isArabic,
                                                      isTurkish: isTurkish,
                                                    )
                                                  : isSelectedSoups
                                                      ? StreamViewMenu(
                                                          collectionName:
                                                              "Soups",
                                                          isArabic: isArabic,
                                                          isTurkish: isTurkish,
                                                        )
                                                      : isSelectedTurkishPide
                                                          ? StreamViewMenu(
                                                              collectionName:
                                                                  "Turkish Pide",
                                                              isArabic:
                                                                  isArabic,
                                                              isTurkish:
                                                                  isTurkish,
                                                            )
                                                          : isSelectedOurSignature
                                                              ? StreamViewMenu(
                                                                  collectionName:
                                                                      "Our Signature",
                                                                  isArabic:
                                                                      isArabic,
                                                                  isTurkish:
                                                                      isTurkish,
                                                                )
                                                              : isSelectedDurum
                                                                  ? StreamViewMenu(
                                                                      collectionName:
                                                                          "Durum",
                                                                      isArabic:
                                                                          isArabic,
                                                                      isTurkish:
                                                                          isTurkish,
                                                                    )
                                                                  : isSelecteTurkishGrill
                                                                      ? StreamViewMenu(
                                                                          collectionName:
                                                                              "Turkish Grill",
                                                                          isArabic:
                                                                              isArabic,
                                                                          isTurkish:
                                                                              isTurkish,
                                                                        )
                                                                      : isSelecteSideDishedes
                                                                          ? StreamViewMenu(
                                                                              collectionName: "Side Dishes",
                                                                              isArabic: isArabic,
                                                                              isTurkish: isTurkish,
                                                                            )
                                                                          : isSelecteDietFood
                                                                              ? StreamViewMenu(
                                                                                  collectionName: "Diet Food",
                                                                                  isArabic: isArabic,
                                                                                  isTurkish: isTurkish,
                                                                                )
                                                                              : isSelecteHotTea
                                                                                  ? StreamViewMenu(
                                                                                      collectionName: 'Hot Tea',
                                                                                      isArabic: isArabic,
                                                                                      isTurkish: isTurkish,
                                                                                    )
                                                                                  : isSelecteHotCoffee
                                                                                      ? StreamViewMenu(
                                                                                          collectionName: "Hot Coffee",
                                                                                          isArabic: isArabic,
                                                                                          isTurkish: isTurkish,
                                                                                        )
                                                                                      : isSelecteCocktails
                                                                                          ? StreamViewMenu(
                                                                                              collectionName: "Cocktails",
                                                                                              isArabic: isArabic,
                                                                                              isTurkish: isTurkish,
                                                                                            )
                                                                                          : isSelecteSerbet
                                                                                              ? StreamViewMenu(
                                                                                                  collectionName: "Serbet",
                                                                                                  isArabic: isArabic,
                                                                                                  isTurkish: isTurkish,
                                                                                                )
                                                                                              : isSelecteFreshJuice
                                                                                                  ? StreamViewMenu(collectionName: "Fresh Juice", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                  : isSelecteIcedTeaAndCoffee
                                                                                                      ? StreamViewMenu(collectionName: "Iced Tea And Coffee", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                      : isSelecteMevlanaShak
                                                                                                          ? StreamViewMenu(collectionName: "Mevlana Shak", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                          : isSelecteSoftDrink
                                                                                                              ? StreamViewMenu(collectionName: "Soft Drink", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                              : isSelecteDessert
                                                                                                                  ? StreamViewMenu(collectionName: "Dessert", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                                  : isSelecteClassicShisha
                                                                                                                      ? StreamViewMenu(collectionName: 'Classic Shisha', isArabic: isArabic, isTurkish: isTurkish)
                                                                                                                      : isSelectePremiumShisha
                                                                                                                          ? StreamViewMenu(collectionName: "Premium Shisha", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                                          : isSelecteNaturalShisha
                                                                                                                              ? StreamViewMenu(collectionName: "Natural Shisha", isArabic: isArabic, isTurkish: isTurkish)
                                                                                                                              : isSelecteBaklawa
                                                                                                                                  ? StreamViewMenu(
                                                                                                                                      collectionName: 'Baklawa',
                                                                                                                                      isArabic: isArabic,
                                                                                                                                      isTurkish: isTurkish,
                                                                                                                                    )
                                                                                                                                  : const SizedBox()
                                ],
                              )))
                    ],
                  ),
      ),
    );
  }
}

class StreamViewMenu extends StatefulWidget {
  final String collectionName;
  final bool isArabic;
  final bool isTurkish;
  const StreamViewMenu(
      {super.key,
      required this.collectionName,
      required this.isArabic,
      required this.isTurkish});

  @override
  State<StreamViewMenu> createState() => _StreamViewMenuState();
}

class _StreamViewMenuState extends State<StreamViewMenu> {
  Future<void> refesh() {
    return Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(widget.collectionName)
              // .where('uid',
              // isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              // .orderBy("datePublished", descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }

            return RefreshIndicator(
              onRefresh: refesh,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => ShowFullItem(
                                    data: data,
                                    isArabic: widget.isArabic,
                                    isTurkish: widget.isTurkish,
                                  )));
                    },
                    child: Container(
                      // width: widthScreen * 0.3,
                      padding: const EdgeInsets.all(5),
                      margin: widthScreen <= 1024
                          ? const EdgeInsets.only(left: 5, right: 5, top: 5)
                          : EdgeInsets.symmetric(
                              vertical: 5, horizontal: widthScreen * 0.125),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(186, 150, 92, 1)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.isArabic
                                    ? data['nameInArabic']
                                    : widget.isTurkish
                                        ? data['nameInTurkish']
                                        : data['nameInEnglish'],
                                style: const TextStyle(
                                    color: Color.fromRGBO(186, 150, 92, 1),
                                    // color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  width: widthScreen >= 450
                                      ? widthScreen * 0.4
                                      : widthScreen * 0.6,
                                  child: Text(
                                    widget.isArabic
                                        ? data['descriptionInArabic']
                                        : widget.isTurkish
                                            ? data['descriptionInTurkish']
                                            : data['descriptionInEnglish'],
                                    style: const TextStyle(color: Colors.white),
                                  )),
                              Text(
                                widget.isArabic
                                    ? "${data['price']} دينار "
                                    : "${data['price']} IQD",
                                style: const TextStyle(
                                    color: Color.fromRGBO(186, 150, 92, 1),
                                    // color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      data['imgPost'],
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainLsitButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final Function() onTap;
  final double size;
  final Color colors;
  final TextStyle style;
  const MainLsitButton(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.onTap,
      required this.size,
      required this.colors,
      required this.style});

  @override
  State<MainLsitButton> createState() => _MainLsitButtonState();
}

class _MainLsitButtonState extends State<MainLsitButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            // padding:  widthScreen >=450 ?const EdgeInsets.all(10) : const EdgeInsets.all(2),
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(5),
            // height:  widthScreen >=450 ? 80 : 60,
            // width:  widthScreen >=450 ? 80 : 60,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(width: widget.size, color: widget.colors),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(widget.iconPath),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              widget.label,
              style: widget.style,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromRGBO(186, 150, 92, 1),
          )
        ],
      ),
    );
  }
}

class SubLsitButton extends StatefulWidget {
  final String iconPath;
  final String label;
  final Function() onTap;
  final double size;
  final Color colors;
  final TextStyle style;
  const SubLsitButton(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.onTap,
      required this.size,
      required this.colors,
      required this.style});

  @override
  State<SubLsitButton> createState() => _SubLsitButtonState();
}

class _SubLsitButtonState extends State<SubLsitButton> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            padding: widthScreen >= 450
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(2),
            margin: const EdgeInsets.all(5),
            // height:  widthScreen >=450 ? 75 : 55,
            // width:  widthScreen >=450 ? 75 : 55,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: widget.size, color: widget.colors),
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(widget.iconPath),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              widget.label,
              style: widget.style,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color.fromRGBO(186, 150, 92, 1),
          )
        ],
      ),
    );
  }
}

class ShowFullItem extends StatefulWidget {
  final Map data;
  final bool isArabic;
  final bool isTurkish;

  const ShowFullItem({
    super.key,
    required this.data,
    required this.isArabic,
    required this.isTurkish,
  });

  @override
  State<ShowFullItem> createState() => _ShowFullItemState();
}

class _ShowFullItemState extends State<ShowFullItem> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 51, 72, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor:const Color.fromRGBO(21, 8, 88, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Image.asset(
          "assets/img/konya_logo.png",
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: widthScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                thickness: 2,
                color: Color.fromRGBO(186, 150, 92, 1),
              ),
              SizedBox(
                  width:
                      widthScreen >= 450 ? heightScreen * 0.6 : double.infinity,
                  child: Container(
                    margin: const  EdgeInsets.only(left: 5,right: 5, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 0, 217, 255),
                        blurRadius: 1,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.outer,
                        offset: Offset.fromDirection(0))
                  ],
                    ),
                    child: ClipRRect(
                      
                      borderRadius: BorderRadius.circular(16),
                      child: InteractiveViewer(child: Image.network(widget.data['imgPost']))),
                  )),
              Text(
                widget.isArabic
                    ? widget.data['nameInArabic']
                    : widget.isTurkish
                        ? widget.data['nameInTurkish']
                        : widget.data['nameInEnglish'],
                style: const TextStyle(
                    color: Color.fromRGBO(186, 150, 92, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.isArabic
                      ? widget.data['descriptionInArabic']
                      : widget.isTurkish
                          ? widget.data['descriptionInTurkish']
                          : widget.data['descriptionInEnglish'],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Text(
                widget.isArabic
                    ? "${widget.data['price']} دينار "
                    : "${widget.data['price']} IQD",
                style: const TextStyle(
                    color: Color.fromRGBO(186, 150, 92, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
